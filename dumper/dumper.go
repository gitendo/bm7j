package main

import (
	"bufio"
	"encoding/binary"
	"fmt"
	"log"
	"os"
	"strconv"
	"strings"
	"unicode/utf8"
)

const ver = 1.02

const romfile = "bm7j.gbc"
const tblfile = "macross7.tbl"
const ofsfile = "offsets.cfg"

const strName = 0x00FD
const strNL = 0x00FE
const strEnd = 0x00FF

func main() {

	fmt.Printf("\nMacross 7 script dumper v%.2f \n", ver)
	fmt.Println("Programmed by: tmk, email: tmk@tuta.io")
	fmt.Printf("Project page: https://github.com/gitendo/bm7j/\n\n")

	// open table file for reading
	fn := tblfile
	ft, err := os.Open(fn)
	if err != nil {
		fmt.Fprintln(os.Stderr, "Error: Unable to access", fn)
		os.Exit(1)
	}
	defer ft.Close()

	// open script offsets file for reading
	fn = ofsfile
	fo, err := os.Open(fn)
	if err != nil {
		fmt.Fprintln(os.Stderr, "Error: Unable to access", fn)
		os.Exit(1)
	}
	defer fo.Close()

	// open ROM file for reading
	fn = romfile
	fr, err := os.Open(fn)
	if err != nil {
		fmt.Fprintln(os.Stderr, "Error: Unable to access", fn)
		os.Exit(1)
	}
	defer fr.Close()

	// internal LUT based on table
	lut := map[uint16]string{}

	// read table, line by line
	scanner := bufio.NewScanner(ft)
	for scanner.Scan() {
		// split each entry
		str := strings.Split(scanner.Text(), "=")
		// convert ascii code into hex
		hex, _ := strconv.ParseInt(str[0], 16, 16)
		// populate LUT
		if utf8.ValidString(str[1]) {
			lut[uint16(hex)] = str[1]
		} else {
			fmt.Fprintln(os.Stderr, "Error: Invalid UTF character in table", str[0])
			os.Exit(1)
		}
	}
	if err := scanner.Err(); err != nil {
		fmt.Fprintln(os.Stderr, "reading standard input:", err)
	}

	// read offsets, line by line
	scanner = bufio.NewScanner(fo)
	for scanner.Scan() {
		// skip comments
		if strings.HasPrefix(scanner.Text(), ";") {
			continue
		}
		// split each entry into: offset, number of control bytes
		str := strings.Split(scanner.Text(), ",")
		// convert ascii offset into hex
		ofs, _ := strconv.ParseInt(str[1], 16, 64)
		// write each script part into separate file
		fn = fmt.Sprintf("%s.txt", str[0])
		fs, err := os.Create(fn)
		if err != nil {
			fmt.Fprintln(os.Stderr, "Error: Unable to create", fn)
			os.Exit(1)
		}
		fmt.Println(fn)

		bom := []byte{0xEF, 0xBB, 0xBF}
		fs.Write(bom)
		// string reference comment
		ref, _ := strconv.ParseInt(str[0], 16, 64)
		hi := (ref & 0xFFFFC000) / 0x4000
		lo := ref & 0x3FFF
		if hi > 0 {
			lo |= 0x4000
		}
		fs.WriteString(fmt.Sprintf("; referenced at %02x:%04x\n", hi, lo))
		// string location comment
		hi = (ofs & 0xFFFFC000) / 0x4000
		lo = ofs & 0x3FFF
		if hi > 0 {
			lo |= 0x4000
		}
		fs.WriteString(fmt.Sprintf("; located at %02x:%04x\n\n", hi, lo))

		// prepare buffer for 1st read
		bs, _ := strconv.ParseInt(str[2], 10, 64)
		buf := make([]byte, bs)
		// text is in parenthesis
		if bs == 2 {
			fs.WriteString("\"")
		}
		// used to decipher some control codes
		side := ""
		name := ""
		icon := ""
		// read from file until string's end
		size := 0
		token := uint16(0)
		for token != strEnd {
			if _, err := fr.ReadAt(buf, ofs); err != nil {
				log.Fatal(err)
				os.Exit(1)
			}
			// next pair
			ofs += int64(len(buf))
			size += len(buf)
			if len(buf) == 2 {
				// write kana / kanji present in table / LUT
				token = binary.BigEndian.Uint16(buf)
				if val, ok := lut[token]; ok {
					fs.WriteString(val)
					// control code
				} else {
					switch token & 0x00FF {
					case strName:
						if token == strName {
							fs.WriteString(fmt.Sprintf("\",$%02X\n\n", uint8(token)))
							buf = make([]byte, 3)
						} else {
							fs.WriteString(fmt.Sprintf("\",$%02X,$%02X\n\n", uint8(token>>8), uint8(token)))
						}
					case strNL:
						if token == strNL {
							fs.WriteString(fmt.Sprintf("\",$%02X\n\"", uint8(token)))
						} else {
							fs.WriteString(fmt.Sprintf("\",$%02X,$%02X\n\"", uint8(token>>8), uint8(token)))
						}
					case strEnd:
						if token == strEnd {
							fs.WriteString(fmt.Sprintf("\",$%02X\n", uint8(token)))
						} else {
							fs.WriteString(fmt.Sprintf("\",$%02X,$%02X\n", uint8(token>>8), uint8(token)))
							token = strEnd
						}
					default:
						fs.WriteString("•")
					}
				}
			} else {
				// decipher some control codes
				switch buf[0] {
				case 0:
					side = "LEFT"
				case 1:
					side = "RIGHT"
				default:
					fmt.Fprintln(os.Stderr, "Error: Invalid icon side found", str[0])
					os.Exit(1)
				}

				switch buf[1] {
				case 0:
					name = "BASARA"
				case 1:
					name = "MYLENE"
				case 2:
					name = "RAY"
				case 3:
					name = "VEFFIDAS"
				case 4:
					name = "GAMLIN"
				case 5:
					name = "MAX"
				case 6:
					name = "MILIA"
				case 10:
					name = "PILOT"
				default:
					fmt.Fprintln(os.Stderr, "Error: Invalid character name id found", str[0])
					os.Exit(1)
				}

				switch buf[2] {
				case 0:
					icon = "GFX0"
				case 1:
					icon = "GFX1"
				case 2:
					icon = "GFX2"
				case 3:
					icon = "GFX3"
				default:
					fmt.Fprintln(os.Stderr, "Error: Invalid icon id found", str[0])
					os.Exit(1)
				}
				fs.WriteString(fmt.Sprintf("%s, %s, %s\n\"", side, name, icon))
				//fs.WriteString(fmt.Sprintf("$%02X,$%02X,$%02X\n\"", buf[0], buf[1], buf[2]))
				buf = make([]byte, 2)
			}
		}
		fs.WriteString(fmt.Sprintf("\n; size: %d bytes", size))
		fs.Close()
	}
	if err := scanner.Err(); err != nil {
		fmt.Fprintln(os.Stderr, "reading standard input:", err)
	}

}

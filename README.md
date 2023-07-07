# Macross 7: Let's take on the heart of the galaxy!

English translation of Macross 7: Ginga no Heart o Furuwasero!! (マクロス7 銀河のハートを奮わせろ!!) created for Wildfang Translations. Started on Jun 2019, finished on Oct 2021, released now. Thank Ichido for all delays. `¯\_(ツ)_/¯`

I'm releasing complete source of the project. This is for anyone interested how the usual translation / patch is created in the details. 

```
└───bm7j
    ├───dumper     - script extracting utility
    ├───gfx        - graphical patches
    ├───inc        - game code patches
    ├───photo      - physical release photos
    ├───rom        - needs to be here
    ├───script     - jp and en files
    └───bm7e.s     - asm project file

```

A brief description of what has been done:

- intro : replaced original screens with translated counterparts, couple of screens were added to fit the whole story since kanji takes less space than english script
- new title screen logo
- options menu : modified routine to work with 8x8 font and improved readability
- text engine modification : 8x16 font for dialogs, 8x8 font for HUD and game menu
- save screen : edited graphic
- credits : replaced original screens with translated counterparts
- dmg warning : replaced original screen
- script : couple of banks had to be disassembled and modified to fit neccessary content - this was usual relocation and graphic shrinking done with [bmp2cgb](https://github.com/gitendo/bmp2cgb)
- save routine : reversed and transplanted flash save which works with certain chinese bootleg carts - neccessary for physical release, not present here

To faciliate translation process I've programmed script dumper (all the original and translated files are in `script` directory, so you don't need it anyway). Instead of creating usual `.ips` file I deceided to take slightly different approach and exploit `.isx` format. This resulted in new features added to [isx2gb](https://github.com/gitendo/isx2gb).

Build system requires:
- Intelligent Systems assembler and linker
- [isx2gb](https://github.com/gitendo/isx2gb) - get latest version, available from my repository

After successful assembly and linking process you should get translated file  `bm7j-patched.gbc` in `rom` directory. Feel free to PR makefile for Linux users - I'm too lazy to create one.

Pictures of limited run physical release for die hard collectors and Macross fans! (Nope, I don't sell these so don't ask.)

![IMG1](photo/PXL_20230404_221206804.jpg?raw=true "Physical release 1")
![IMG2](photo/PXL_20230404_221241209.jpg?raw=true "Physical release 2")
![IMG3](photo/PXL_20230404_221328706.jpg?raw=true "Physical release 3")

The End

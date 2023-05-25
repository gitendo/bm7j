@ECHO OFF
CLS

SET file=bm7e

SET ISAS=-w3 -isdmg -b 131072
SET ISINC=inc
SET ISLK=-v -n -o %file%.isx

isas32 %file%.s
IF %ERRORLEVEL% NEQ 0 GOTO 1
ECHO.

IF EXIST %file%.isx DEL %file%.isx
islk32 %file%.o
IF %ERRORLEVEL% NEQ 0 GOTO 2
ECHO.
DEL %file%.o

IF EXIST rom/bm7j-patched.gbc DEL rom/bm7j-patched.gbc
isx2gb -p %file%.isx rom/bm7j.gbc
IF %ERRORLEVEL% NEQ 0 GOTO 3
START bgb rom/bm7j-patched.gbc

ECHO.
ECHO No error.  
GOTO end

:1
ECHO.
ECHO An assemble error has occurred.  
GOTO end

:2
ECHO.
ECHO A link error has occurred.  
GOTO end

:3
ECHO.
ECHO An isx error has occurred.  

:end

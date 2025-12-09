@ECHO OFF
SETLOCAL

rem function returns
SET /A ir=0
SET sr=

rem initial vars
SET /A total=0


REM begin the while loop, while we have data to read
:WHILE

    REM read in the line
    SET /P line=

    REM if the line has the EOF (CTRL+Z), goto end

    REM find max for line 
    call:MaxForLine_ir %line%

    REM add max to sum
    SET /A total=%total%+%ir%

GOTO WHILE

ECHO %total%
GOTO END

REM begin functions

REM Inputs: String version of the line
REM Outputs: Max Joltage for said line, on ir return variable
:MaxForLine_ir
ECHO TODO: Complete Max Function
ECHO %~1
SET /A ir=100


:END
ENDLOCAL
EXIT /B 0
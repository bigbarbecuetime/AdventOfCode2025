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
    REM EOF is detected by ERRORLEVEL being set from SET /P, stop
    IF /I "%ERRORLEVEL%" NEQ "0" (GOTO END)

    REM find max for line 
    call:MaxForLine_ir %line%

    REM add max to sum
    SET /A total=%total%+%ir%

GOTO WHILE

REM begin functions

REM Inputs: String version of the line
REM Outputs: Max Joltage for said line, on ir return variable
:MaxForLine_ir
SET /A max=0
SET full_line=%~1

REM TODO Add for loops
REM For each char (i) (up to n-1)
    SET chr1=%full_line:~0,1%
    REM For each char past that i+1
        SET chr2=%full_line:~1,1%
        REM Combine the two into a guess
        SET /A guess=%chr1%%chr2%
        REM if the guess is greater than the maximum save it for that line
        IF /I %guess% GTR %max% (SET /A max=%guess%)

REM set the return to the max
ENDLOCAL
SET /A ir=%max%
EXIT /B


:END
ECHO %total%
EXIT /B 0
@echo off
if not %~x1==.bf (
echo Only the file extension '.bf' is supported. You have used '%~x1'.
pause
goto :eof
)

setlocal ENABLEDELAYEDEXPANSION
call %~p0log clear
SET /A tg_one=1
set n=0
REM ==TO ADD COMENTS REPLACE '*' WITH '1,2 delims=#'==
FOR /F "tokens=*" %%a IN (%~pn1.bf) DO (
  set tg_line[!n!]=%%a
  rem set tg_note[!n!]=%%b
  set /a n+=1
)

type %~p0res\init.txt>%~pn1.bat
type %~p0res\start.txt>>%~pn1.bat
type %~p0res\end.txt>>%~pn1.bat


set tg_line_count=!n!
set n=
call %~p0log tg_

set tg_line_num=0
goto :line_loop
:end_line_loop
rem @echo off
type %~p0res\close.txt>>%~pn1.bat

notepad %~p0log.txt
rem start %~pn1.bat
goto :eof

:line_loop
rem @echo on
if !tg_line_num!==!tg_line_count! goto end_line_loop
echo LINE %tg_line_num%: !tg_line[%tg_line_num%]!
rem echo.>>%~pn1.bat
rem echo.>>%~pn1.bat
rem echo.>>%~pn1.bat
rem echo rem ==!tg_note[%tg_line_num%]!==>>%~pn1.bat
set tg_char_num=0
:char_loop
  SET tg_char=!tg_line[%tg_line_num%]:~%tg_char_num%,%tg_one%!
  IF NOT DEFINED tg_char goto end_char_loop
  )
  echo CHAR %tg_char_num%: !tg_char!
  if "!tg_char!"=="<" (
    type %~p0res\start.txt>>%~pn1.bat
    type %~p0res\move-left.txt>>%~pn1.bat
    type %~p0res\end.txt>>%~pn1.bat
  ) else (
  if "!tg_char!"==">" (
    type %~p0res\start.txt>>%~pn1.bat
    type %~p0res\move-right.txt>>%~pn1.bat
    type %~p0res\end.txt>>%~pn1.bat
  ) else (
  if "!tg_char!"=="," (
    type %~p0res\start.txt>>%~pn1.bat
    type %~p0res\user-input.txt>>%~pn1.bat
    type %~p0res\end.txt>>%~pn1.bat
  ) else (
  if exist %~p0res\!tg_char!.txt (
    type %~p0res\start.txt>>%~pn1.bat
    type %~p0res\!tg_char!.txt>>%~pn1.bat
    type %~p0res\end.txt>>%~pn1.bat
  )
  )))

  call %~p0log tg_
  set /a tg_char_num+=1
goto char_loop
:end_char_loop

set /a tg_line_num+=1
goto :line_loop

@echo off
setlocal ENABLEDELAYEDEXPANSION
set one=1
for /F "tokens=1 delims=!" %%a in (face.txt) do (
  set line=%%a
  echo line:%%a
  set pos=0
  :NextChar
  echo NEXTCHAR: '!line:~%pos%,1!'
  set /a pos=pos+1
  if "!line:~%pos%,1!" NEQ "" goto NextChar

  for /L %%n in (1,1,-1) do (
  echo FOR: !line:~%%n,1!
  )
)
pause

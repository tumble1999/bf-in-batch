@echo off
setlocal ENABLEDELAYEDEXPANSION
if %1==clear echo.>%~p0log.txt

if not %1==clear (
  echo ====== %date% ======>>%~p0log.txt
  echo.>>%~p0log.txt
  set %1>>%~p0log.txt
  echo.>>%~p0log.txt
  echo.>>%~p0log.txt
)

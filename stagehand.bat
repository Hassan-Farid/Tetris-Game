@echo off
rem This file was created by pub v2.7.1.
rem Package: stagehand
rem Version: 3.3.7
rem Executable: stagehand
rem Script: stagehand
dart "C:\Users\Mr. Ghori\AppData\Roaming\Pub\Cache\global_packages\stagehand\bin\stagehand.dart.snapshot.dart2" %*

rem The VM exits with code 253 if the snapshot version is out-of-date.
rem If it is, we need to delete it and run "pub global" manually.
if not errorlevel 253 (
  exit /b %errorlevel%
)

pub global run stagehand:stagehand %*

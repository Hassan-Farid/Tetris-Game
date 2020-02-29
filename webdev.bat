@echo off
rem This file was created by pub v2.7.1.
rem Package: webdev
rem Version: 2.5.4
rem Executable: webdev
rem Script: webdev
dart "C:\Users\Mr. Ghori\AppData\Roaming\Pub\Cache\global_packages\webdev\bin\webdev.dart.snapshot.dart2" %*

rem The VM exits with code 253 if the snapshot version is out-of-date.
rem If it is, we need to delete it and run "pub global" manually.
if not errorlevel 253 (
  exit /b %errorlevel%
)

pub global run webdev:webdev %*

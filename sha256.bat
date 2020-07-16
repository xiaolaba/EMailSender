
:: SHA256, for zip file and size
:: Win10 dosbox
:: xiaolaba, 2020-JAN-10

@echo off

::change input file names
set zip1=EMailSender-2.0.1.zip
set zip2=EMailSender-2.0.0.zip

::out put text file
set out=package_xiaolaba_EMailSender-zip.sha256.txt

:: hide all dos info
prompt $

:: sha256 hash
CertUtil -hashfile %zip1% SHA256 > %out%
:: file size
for %%A in (%zip1%) do echo.%%A file size = %%~zA >> %out%
:: empty line
@echo. >> %out%

:: sha256 hash
CertUtil -hashfile %zip2% SHA256 >> %out%
:: file size
for %%A in (%zip2%) do echo.%%A file size = %%~zA >> %out%
:: empty line
@echo. >> %out%


::show each zip file
forfiles /s /m *.zip /c "cmd /c echo @path"

REM ** The exit is important, so the cmd.exe doesn't try to execute commands after ampersands
pause & exit


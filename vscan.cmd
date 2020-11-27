@echo off

:: I swear, if I can avoid ever writing Batch ever again, I will. This language feels more like assembly than a script.

:: references from ss64.com and <https://www.tutorialspoint.com/batch_script/batch_script_comments.htm>

:: <https://www.clamav.net/documents/installing-clamav-on-windows>

:: set TARGET=D:\
set TARGET=C:\Users\petroff\OneDrive - Queensland University of Technology\Desktop\_Tools
echo Target is %TARGET%

set ENGINED=C:\Program Files\ClamAV
echo Engine directory is %ENGINED%

:: set HANDLING=D:\_virusscan
set HANDLING=C:\Users\petroff\OneDrive - Queensland University of Technology\Desktop\SCANNY
echo Handling directory is %HANDLING%

set QUARANTINE=%HANDLING%\_quarantine
echo Quarantine directory is %QUARANTINE%

set LOG=%HANDLING%\_SCANLOG.txt
echo Log directory is %LOG%

echo Clearing log and quarantine directories

:: Clear (delete & recreate) virus_handling directory
rmdir /S /Q "%HANDLING%"
mkdir "%HANDLING%"
mkdir "%QUARANTINE%"


cd /D "%ENGINED%"
echo Updating virus definitions...
"%ENGINED%"\freshclam.exe

:: echo Running scan on D:\...
:: clamscan --bell --infected --recursive --stdout --log="%LOG%" --move="%QUARANTINE%" --detect-pua --scan-mail --algorithmic-detection=yes --scan-pe=yes --scan-elf=yes --scan-ole2=yes --scan-pdf=yes --scan-html=yes --scan-archive=yes --detect-broken=yes --block-encrypted=yes D:\

echo Running scan on %TARGET%...
clamscan --bell --infected --recursive --stdout --log="%LOG%" --move="%QUARANTINE%" --detect-pua --scan-mail --algorithmic-detection=yes --scan-pe=yes --scan-elf=yes --scan-ole2=yes --scan-pdf=yes --scan-html=yes --scan-archive=yes --block-encrypted=yes "%TARGET%"

notepad "%LOG%"

cd /d "%~dp0"

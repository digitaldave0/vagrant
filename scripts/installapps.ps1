
$Time=Get-Date
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

  Try
{
$devpackages = @("virtualbox-guest-additions-guest.install","notepadplusplus","terraform","git.install") 
foreach ($packages in $devpackages) {
write-host "Installing - $packages at $Time"
  choco install $packages -y 
  }
  if ($PSVersionTable.PSEdition -eq 'Desktop' -and (Get-Module -Name AzureRM -ListAvailable)) {
    Write-Warning -Message ('Az module not installed. Having both the AzureRM and ' +
      'Az modules installed at the same time is not supported.')
  } else {
    write-host "Installing Azure Modules for Powershell" 
    Install-Module -Name Az -AllowClobber -Scope AllUsers -Force -Confirm:$False
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
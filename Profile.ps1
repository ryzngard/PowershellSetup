# Default Modules
Import-Module PScolor
Import-Module posh-docker
Import-Module PowerLine
Import-Module PSGit
Import-Module posh-git
Import-Module PSReadLine
Import-Module oh-my-posh

Set-Prompt
set-theme Darkblood

# Set up colors
[console]::BackgroundColor = "black"

# Global functions
$profileDirectory = (Get-Item $PROFILE).Directory

# Load everything from /Scripts
gci "$profileDirectory\Scripts" -Filter "*.ps1" | %{
    Write-Host "Loading $($_.FullName)"
    . $_.FullName
}



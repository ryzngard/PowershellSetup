# Default Modules
Import-Module PScolor
Import-Module posh-docker
Import-Module PowerLine
Import-Module PSGit
Import-Module posh-git

Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

oh-my-posh init pwsh --config "$((get-item $PROFILE).DirectoryName)\darkblood.omp.json" | Invoke-Expression

# Set up colors
[console]::BackgroundColor = "black"

# Global functions
$profileDirectory = (Get-Item $PROFILE).Directory

# Load everything from /Scripts
gci "$profileDirectory\Scripts" -Filter "*.ps1" | %{
    Write-Host "Loading $($_.FullName)"
    . $_.FullName
}



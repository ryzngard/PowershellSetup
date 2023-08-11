# Default Modules
Import-Module PScolor
Import-Module posh-docker
Import-Module posh-git

#oh-my-posh setup
oh-my-posh init pwsh --config C:\Users\ryzng\OneDrive\Documents\WindowsPowerShell\darkblood.omp.json | Invoke-Expression
$env:POSH_GIT_ENABLED = $true

#PS ReadLine setup
set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -colors @{ ListPrediction = '#8A0303' }

if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine

    # Set up colors
    [console]::BackgroundColor = "black"
}

# Global functions
$profileDirectory = (Get-Item $PROFILE).Directory

# Load everything from /Scripts
gci "$profileDirectory\Scripts" -Filter "*.ps1" | %{
    Write-Host "Loading $($_.FullName)"
    . $_.FullName
}
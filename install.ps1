Install-Hub 
Install-Powerline 
Install-PowerlineFonts
Install-PSGit 
Install-Profile

# Installation function definition 

function Install-Scoop {
    iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
}

function Requires-Scoop {
    try {
        Get-Command scoop 
        return $True
    }
    catch {
        Install-Scoop
    }
}

function Install-Hub {
    Requires-Scoop

    scoop install hub
}

function Install-Powerline {
    install-module powerline -Scope CurrentUser -AllowClobber -Confirm
    $powerlineConfig = Get-ResourcePath "Powerline_Configuration.psd1" 
    $destination = Join-Path $env:AppData "powershell/HuddledMasses.org/Powerline/Configuration.psd1"

    Ensure-Directory $destination 

    Move-Item $powerlineConfig $destination
}

function Install-PowerlineFonts {
    $fontsScript = Get-ResourcePath "fonts/install.ps1"
    & $fontsScript
}

function Install-PSGit {
    Install-Module psgit -Scope CurrentUser -AllowClobber -Confirm
}

function Install-Profile {
    $profilePath = Get-ResourcePath "Profile.ps1"
    Move-Item $profilePath $profile 
}

function Get-ScriptDirectory {
    Split-Path -parent $PSCommandPath
}

function Get-ResourcePath($relativePath) {
    return Join-Path Get-ScriptDirectory $relativePath
}

function Ensure-Directory($path) {
    $directory = Split-Path -Parent $path
    if (Test-Path $directory) {
        return 
    }

    New-Item -ItemType Directory $directory
}
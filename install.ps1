# Installation function definition 

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
    $scriptDirectory = Get-ScriptDirectory
    return Join-Path $scriptDirectory $relativePath
}

function Ensure-Directory($path) {
    $directory = Split-Path -Parent $path
    if (Test-Path $directory) {
        return 
    }

    New-Item -ItemType Directory $directory
}

# Installation Logic

& winget import -i ./winget.exp
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force -Scope CurrentUser
Install-Package psgit -Scope CurrentUser -AllowClobber -Confirm
Install-Package powerline -Scope CurrentUser -AllowClobber -Confirm
Install-PowerlineFonts

$powerlineConfig = Get-ResourcePath "Powerline_Configuration.psd1" 
$destination = Join-Path $env:AppData "powershell/HuddledMasses.org/Powerline/Configuration.psd1"

Ensure-Directory $destination 

Copy-Item $powerlineConfig $destination

$themePath = Get-ResourcePath "darkblood.omp.json"
Copy-Item $themePath (get-children $PROFILE).Directory

Install-Module -Scope CurrentUser Pansies -AllowClobber
Install-Module -Scope CurrentUser posh-docker,posh-git,Powerline,PSColor,PSGit
Install-Module -Scope CurrentUser -AllowPrerelease -Force
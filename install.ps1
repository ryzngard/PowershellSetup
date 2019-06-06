function Install-Scoop
{
    iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
}

function Requires-Scoop
{
    try 
    {
        Get-Command scoop 
        return $True
    }
    catch 
    {
        Install-Scoop
    }
}

function Install-Hub
{
    Requires-Scoop

    scoop install hub
}

function Install-Powerline 
{

}

function Install-PowerlineFonts
{

}

function Install-PSGit 
{

}

function Install-Profile 
{
    
}
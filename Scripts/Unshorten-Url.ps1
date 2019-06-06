<#
.SYNOPSIS
Expand Short URLs
.DESCRIPTION
Unshortens the short URL using the UnTiny.me web API http://untiny.me/api
.PARAMETER URL
Short URL to be expanded
.EXAMPLE
PS > Expand-ShortURL -URL https://goo.gl/quuacW, http://goo.gl/VG9XdU
ShortURL              LongURL
--------              -------
https://goo.gl/quuacW https://geekeefy.wordpress.com/
http://goo.gl/VG9XdU  https://raw.githubusercontent.com/PrateekKumarSingh/PowershellScrapy/master/MACManufacturers/MAC_Manufacturer_Reference.csv
.EXAMPLE
PS > 'https://goo.gl/quuacW' |Expand-ShortURL
ShortURL              LongURL
--------              -------
https://goo.gl/quuacW https://geekeefy.wordpress.com/
.NOTES
Blog URL - http://geekeefy.wordpress.com
#> 
Function Expand-ShortURL {
    Param(
        [Parameter(
            Mandatory = $true,
            HelpMessage = 'Short URL to be expanded',
            ValueFromPipeline = $true,
            Position = 0
        )]
        [ValidateNotNullOrEmpty()]
        [string[]] $URL
    )

    Begin {
    }
    Process {
        try {
            $request = [System.Net.WebRequest]::Create($URL);
            $request.AllowAutoRedirect = $false;
            $resp = $request.GetResponse();
            $resp.Headers["Location"];                
        }
        catch {
            $_.exception.Message
        }
    }
    End {
    }
}
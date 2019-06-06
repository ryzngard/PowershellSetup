function Roslyn-FilterBuildOutputForFileWarnings
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, Position = 0)]
        $buildOutput
    )
    BEGIN {}
    PROCESS {
        $filtered = @();

        foreach ($line in $buildOutput)
        {
            if($line.contains("warning IDE"))
            {
                return $line.split(" ")[0].split("(")[0]; 
            } 
        }
    }
    END {}
}

function Roslyn-GetUniqueChangedFilesFromBuildOutput
{
    param(
        [string]
        $buildOutputFile
    )

    cat $buildOutputFile | Roslyn-FilterBuildOutputForFileWarnings | Select-Object -Unique
}

function Roslyn-GetChangedFilesThatAreWarned
{
    param(
        [string]
        $buildOutputFile
    )

    $changedFiles = Roslyn-GetUniqueChangedFilesFromBuildOutput -buildOutputFile $buildOutputFile
    return Git-ChangedFileIntersection -fileList $changedFiles -useFullPath $true
}
#requres -version 4

function Git-ChangedFileIntersection
{
    param(
        [string]
        $branch="master",

        [string[]]
        $fileList,

        [Boolean]
        $useFullPath = $false
    )

    $gitFiles = (git diff --name-only $branch);

    if ($useFullPath)
    {
        $gitFiles = $gitFiles | %{ Resolve-Path $_ }
    }

    return $gitFiles | ?{ $gitName = $_; return Linq-Any -collection $fileList -filter ([Func[object, bool]]{param($x) $x -contains $gitName }) }
}
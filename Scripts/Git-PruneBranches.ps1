function Git-PruneBranches 
{
    git branch -vv | 
        select-string ": gone]" | 
        %{ $_.ToString() } | 
        %{ $_.Split(" ", [System.StringSplitOptions]::RemoveEmptyEntries)[0] } | 
        %{ git branch -D $_ }
}
function Linq-Any 
{
    param(
        [object[]] $collection,
        $filter = [Func[object, bool]]{param($x) $true; }
    )

    if ($null -eq $collection)
    {
        return $false
    }

    if ($null -eq $filter)
    {
        return [System.Linq.Enumerable]::Any($collection);
    }

    [System.Linq.Enumerable]::Any($collection, $filter);
}
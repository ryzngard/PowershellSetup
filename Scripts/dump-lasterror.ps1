function Dump-LastError ($ErrorRecord = $Error[0]) {
    if ($ErrorRecord -eq $null) {
        Write-Host "No error found"
        return
    }
    
    $ErrorRecord | Format-List * -Force
    $ErrorRecord.InvocationInfo |Format-List *
    $Exception = $ErrorRecord.Exception
    for ($i = 0; $Exception; $i++, ($Exception = $Exception.InnerException)) {
        "$i" * 80
        $Exception |Format-List * -Force
    }
}
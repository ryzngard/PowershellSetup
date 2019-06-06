function Prompt-UserSelection($choices, $prompt = "Choose a number") {
    if ($choices.Count -eq 0 -or $choices.Count -eq $null) {
        throw "No choices for the user provided"
    }

    $choices | % {$counter = 0} {
        Write-Host "[$counter] $_"
        $counter = $counter + 1
    }

    $choiceValid = $false
    [int]$choice = 0

    do {
        $rawChoice = Read-Host -Prompt $prompt

        if ($rawChoice -eq "q" -or $rawChoice -eq "Q") {
            return $null
        }

        if ([int]::TryParse($rawChoice, [ref]$choice)) {
            return $choices[$choice]
        }
    }
    while ($true)
}
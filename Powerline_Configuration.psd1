
@{
  PowerLineConfig = @{
    DefaultAddIndex = 4
    FullColor = $False
    Prompt = @((ScriptBlock ' if($pushed = (Get-Location -Stack).count) { "&raquo;$pushed" } '),(ScriptBlock ' Get-SegmentedPath '),(ScriptBlock ' Write-GitStatusPowerLine '),(ScriptBlock ' "`t" '),(ScriptBlock ' Get-Elapsed '),(ScriptBlock ' Get-Date -f "T" '),(ScriptBlock ' "`n" '),(ScriptBlock ' New-PromptText { "$(New-PromptText "&rarr;")" } -Bg Red'))
    RestoreVirtualTerminal = $True
    SetCurrentDirectory = $True
    Colors = @((RgbColor '#FF0000'),(RgbColor '#FF0000'))
    PowerLineFont = $True
  }
  ExtendedCharacters = @{
    ColorSeparator = ''
    ReverseColorSeparator = ''
    Separator = ''
    ReverseSeparator = ''
    Branch = ''
    Lock = ''
    Gear = '⛯'
    Power = '⚡'
  }
  EscapeSequences = @{
    Esc = '['
    Store = '[s'
    Recall = '[u'
    Clear = '[0m'
  }
}

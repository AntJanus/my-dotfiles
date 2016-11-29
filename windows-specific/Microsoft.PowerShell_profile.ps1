set-location D:\Projects
$env:path += ";" + (Get-Item "Env:ProgramFiles(x86)").Value + "\Git\bin"

$Shell = $Host.UI.RawUI
$size = $Shell.WindowSize
$size.width=100
$size.height=60
$Shell.WindowSize = $size
$size = $Shell.BufferSize
$size.width=100
$size.height=5000
$Shell.BufferSize = $size
$shell.BackgroundColor = "Black"
$shell.ForegroundColor = "White"

Import-Module Posh-Git

function global:prompt {
    $realLASTEXITCODE = $LASTEXITCODE

    Write-Host($pwd.ProviderPath) -nonewline

    Write-VcsStatus

    $global:LASTEXITCODE = $realLASTEXITCODE
    return "> "
}

Pop-Location

Start-SshAgent -Quiet


Clear-Host
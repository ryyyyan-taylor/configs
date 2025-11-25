function Write-BranchName () {
    try {
        $branch = git rev-parse --abbrev-ref HEAD

        if ($branch -eq "HEAD") {
            $branch = git rev-parse --short HEAD
            Write-Host " ($branch)" -ForegroundColor "red"
        }
        else {
            Write-Host " ($branch)" -ForegroundColor Yellow
        }
    } catch {
        Write-Host " (no branch)" -ForegroundColor Yellow
    }
}

function prompt {
    Write-Host "`n$env:USERNAME " -ForegroundColor Green -NoNewLine
    Write-Host "$((Get-Location).Path.Replace($HOME, "~"))" -ForegroundColor Cyan -NoNewLine
    if (Test-Path .git) {
        Write-BranchName -ForegroundColor Yellow
    }
    else {
        Write-Host "`n" -NoNewLine
    }
    Write-Host "->" -ForegroundColor Red -NoNewLine
    return " "
}

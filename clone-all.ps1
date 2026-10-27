param([string]$Dest = ".")

$repos = @("Lock-Bases-View", "MemoFlow", "QuickAddScript")

foreach ($r in $repos) {
    $path = Join-Path $Dest $r
    if (Test-Path (Join-Path $path ".git")) {
        Write-Host "更新 $r"
        git -C $path pull --ff-only
    } else {
        Write-Host "克隆 $r"
        git clone "https://github.com/Cyletix/$r.git" $path
    }
}

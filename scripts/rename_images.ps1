Set-Location -Path 'c:\Users\ADMIN\Desktop\DRIP WEBSITE'
$commands = @(
    @{old='ANTI SOCIAL 1.jpeg'; new='anti-social-1.jpeg'},
    @{old='ANTI SOCIAL 2.jpeg'; new='anti-social-2.jpeg'},
    @{old='COMMON BLACK TOP VIEW.jpeg'; new='common-black-top-view.jpeg'},
    @{old='COMMON WHITE TOP VIEW.jpeg'; new='common-white-top-view.jpeg'},
    @{old='GUMAAN BLACK 1.jpeg'; new='gumaan-black-1.jpeg'},
    @{old='GUMAAN BLACK 2.jpeg'; new='gumaan-black-2.jpeg'},
    @{old='GUMAAN WHITE 1.jpeg'; new='gumaan-white-1.jpeg'},
    @{old='GUMAAN WHITE 2.jpeg'; new='gumaan-white-2.jpeg'},
    @{old='KAHANI BLACK 1.jpeg'; new='kahani-black-1.jpeg'},
    @{old='KAHANI BLACK 2.jpeg'; new='kahani-black-2.jpeg'},
    @{old='KAHANI WHITE 1.jpeg'; new='kahani-white-1.jpeg'},
    @{old='KAHANI WHITE 2.jpeg'; new='kahani-white-2.jpeg'},
    @{old='NASA BLACK 1.jpeg'; new='nasa-black-1.jpeg'},
    @{old='NASA BLACK 2.jpeg'; new='nasa-black-2.jpeg'},
    @{old='NASA WHITE 1.jpeg'; new='nasa-white-1.jpeg'},
    @{old='NASA WHITE 2.jpeg'; new='nasa-white-2.jpeg'},
    @{old='NY BLACK 1.jpeg'; new='ny-black-1.jpeg'},
    @{old='NY BLACK 2.jpeg'; new='ny-black-2.jpeg'},
    @{old='NY WHITE 1.jpeg'; new='ny-white-1.jpeg'},
    @{old='NY WHITE 2.jpeg'; new='ny-white-2.jpeg'},
    @{old='STARRY NIGHT 1.jpeg'; new='starry-night-1.jpeg'},
    @{old='STARRY NIGHT 2.jpeg'; new='starry-night-2.jpeg'},
    @{old='TAME IMPALA INSPIRED WHITE 2.jpeg'; new='tame-impala-inspired-white-2.jpeg'},
    @{old='TAME IMPALA INSPIRED WHITE.jpeg'; new='tame-impala-inspired-white-1.jpeg'},
    @{old='TLIKTB 1.jpeg'; new='tliktb-1.jpeg'},
    @{old='TLIKTB 2.jpeg'; new='tliktb-2.jpeg'}
)
foreach ($c in $commands) {
    $oldPath = Join-Path 'products' $c.old
    if (Test-Path -LiteralPath $oldPath) {
        Rename-Item -LiteralPath $oldPath -NewName $c.new -Force
        Write-Output "Renamed '$($c.old)' -> '$($c.new)'"
    } else {
        Write-Output "Missing: $($c.old)"
    }
}

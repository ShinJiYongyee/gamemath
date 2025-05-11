# 사용자 설정
$owner = "onlybooks"
$repo = "gamemath"
$perPage = 100  # 최대 100개까지 가능
$page = 1
$allBranches = @()

# 모든 브랜치 가져오기 (페이지네이션 처리)
do {
    $url = "https://api.github.com/repos/$owner/$repo/branches?per_page=$perPage&page=$page"
    $branches = Invoke-RestMethod -Uri $url

    if ($branches.Count -gt 0) {
        $allBranches += $branches
        $page++
    } else {
        break
    }
} while ($true)

# 다운로드 루프
foreach ($branch in $allBranches) {
    $branchName = $branch.name
    $zipUrl = "https://github.com/$owner/$repo/archive/refs/heads/$branchName.zip"
    $outputFile = "$repo-$branchName.zip"

    Write-Host "Downloading $branchName..."
    Invoke-WebRequest -Uri $zipUrl -OutFile $outputFile
}

Write-Host "✅ 모든 브랜치 다운로드 완료!"

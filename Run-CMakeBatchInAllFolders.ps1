# 현재 디렉토리에서 gamemath-* 폴더 찾기
Get-ChildItem -Directory -Filter "gamemath-*" | ForEach-Object {
    $folderPath = $_.FullName
    $batchFile = Join-Path $folderPath "CMake-VS-17-2022.bat"

    if (Test-Path $batchFile) {
        Write-Host "▶ 실행 중: $batchFile"
        
        # 배치 파일 실행 (cmd.exe로 실행)
        Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$batchFile`"" -Wait -NoNewWindow
    } else {
        Write-Warning "⚠ 배치 파일이 존재하지 않음: $batchFile"
    }
}

Write-Host "`n✅ 모든 배치 파일 실행 완료."

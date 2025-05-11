# 원하는 버전
$oldVersion = "cmake_minimum_required(VERSION 3.1)"
$newVersion = "cmake_minimum_required(VERSION 4.0.1)"

# 대상 파일 목록
$targetFiles = @(
    "CMakeLists.txt",
    "Source/Player/CMakeLists.txt",
    "Source/Runtime/Engine/CMakeLists.txt",
    "Source/Runtime/Math/CMakeLists.txt",
    "Source/Runtime/Renderer/CMakeLists.txt"
)

# gamemath-* 폴더들을 검색
Get-ChildItem -Directory -Filter "gamemath-*" | ForEach-Object {
    $baseDir = $_.FullName

    foreach ($relativePath in $targetFiles) {
        $fullPath = Join-Path $baseDir $relativePath

        if (Test-Path $fullPath) {
            Write-Host "Updating: $fullPath"

            # 파일 내용 읽기
            $content = Get-Content $fullPath -Raw

            # 문자열 교체
            $newContent = $content -replace [regex]::Escape($oldVersion), $newVersion

            # 덮어쓰기
            Set-Content $fullPath -Value $newContent
        }
    }
}

Write-Host "CMake version update complete."

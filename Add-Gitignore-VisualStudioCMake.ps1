# Visual Studio + CMake .gitignore 내용
$gitignoreContent = @"
# --- CMake ---
CMakeFiles/
CMakeCache.txt
cmake_install.cmake
Makefile
compile_commands.json

# --- Visual Studio ---
.vs/
*.VC.db
*.VC.opendb

# Build results
[Bb]uild/
x64/
x86/
Debug/
Release/
ipch/
*.obj
*.exe
*.dll
*.lib
*.pdb
*.ilk
*.iobj
*.ipdb
*.sdf
*.opensdf

# User-specific files
*.suo
*.user
*.userosscache
*.sln.docstates

# Others
*.log
*.cache
"@

# gamemath-* 폴더에 .gitignore 파일 생성
Get-ChildItem -Directory -Filter "gamemath-*" | ForEach-Object {
    $folderPath = $_.FullName
    $gitignorePath = Join-Path $folderPath ".gitignore"

    # 기존 파일이 있다면 덮어쓰기
    $gitignoreContent | Out-File -FilePath $gitignorePath -Encoding UTF8 -Force
    Write-Host "✅ .gitignore 덮어쓰기 또는 생성됨: $gitignorePath"
}

Write-Host "`n모든 gamemath-* 폴더에 .gitignore 처리 완료."

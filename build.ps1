$ErrorActionPreference = "Stop"

$projectDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$outputDir = Join-Path $projectDir "dist"
$compiler = Join-Path $env:WINDIR "Microsoft.NET\Framework64\v4.0.30319\csc.exe"
$iconGenerator = Join-Path $projectDir "tools\GenerateIcon.exe"
$iconFile = Join-Path $projectDir "assets\FloatingClock.ico"

if (-not (Test-Path -LiteralPath $compiler)) {
    throw "64-bit .NET Framework compiler not found: $compiler"
}

New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path $projectDir "assets") -Force | Out-Null

& $compiler /nologo /target:exe /platform:x64 /optimize+ `
    /reference:System.dll /reference:System.Drawing.dll `
    /out:$iconGenerator "$projectDir\tools\GenerateIcon.cs"
if ($LASTEXITCODE -ne 0) { throw "Icon generator compilation failed." }

& $iconGenerator "$projectDir\assets"
if ($LASTEXITCODE -ne 0) { throw "Icon generation failed." }

& $compiler /nologo /target:winexe /platform:x64 /optimize+ `
    /win32manifest:"$projectDir\app.manifest" `
    /win32icon:$iconFile `
    /reference:System.dll /reference:System.Drawing.dll `
    /reference:System.Windows.Forms.dll /reference:System.Xml.dll `
    /out:"$outputDir\FloatingClock.exe" `
    "$projectDir\src\FloatingClock.cs"
if ($LASTEXITCODE -ne 0) { throw "Application compilation failed." }

Copy-Item -LiteralPath "$projectDir\LICENSE" -Destination "$outputDir\LICENSE.txt" -Force
Copy-Item -LiteralPath "$projectDir\README.md" -Destination "$outputDir\README.md" -Force
Copy-Item -LiteralPath "$projectDir\RELEASE_NOTES.md" -Destination "$outputDir\RELEASE_NOTES.md" -Force
$hash = (Get-FileHash -LiteralPath "$outputDir\FloatingClock.exe" -Algorithm SHA256).Hash
Set-Content -LiteralPath "$outputDir\SHA256SUMS.txt" -Value "$hash  FloatingClock.exe" -Encoding ASCII
Write-Host "Build complete: $outputDir\FloatingClock.exe"

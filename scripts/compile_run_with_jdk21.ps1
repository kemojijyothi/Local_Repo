<#
PowerShell helper script to compile and run Hello.java using a specified JDK path.
Usage:
  .\compile_run_with_jdk21.ps1 -Jdk21Path 'C:\Program Files\Eclipse Adoptium\jdk-21'

This script sets JAVA_HOME and PATH for the session only (doesn't modify system env).
#>
param(
  [Parameter(Mandatory=$true)]
  [string]$Jdk21Path
)

if (-not (Test-Path $Jdk21Path)) {
  Write-Error "JDK path not found: $Jdk21Path"
  exit 2
}

$env:JAVA_HOME = $Jdk21Path
$env:Path = Join-Path $env:JAVA_HOME 'bin' + ';' + ($env:Path)

Write-Host "Using JAVA_HOME=$env:JAVA_HOME"

# Show java version
java -version

# Compile
Write-Host "Compiling Hello.java..."
javac Hello.java
if ($LASTEXITCODE -ne 0) {
  Write-Error "Compilation failed"
  exit $LASTEXITCODE
}

# Run
Write-Host "Running Hello..."
java Hello

# End
Write-Host "Done."
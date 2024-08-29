


# checking if the directory exists
$directories = @(
    "$env:USERPROFILE\3D Objects",
    "$env:USERPROFILE\Pictures",
    "$env:USERPROFILE\Desktop",
    "$env:USERPROFILE\Documents",
    "$env:USERPROFILE\Downloads",
    "$env:USERPROFILE\Music",
    "$env:USERPROFILE\Source",
    "C:\ProgramData\MySQL\MySQL Server 8.0.39.0\Data"
)

foreach ($dir in $directories) {
    if (-Not (Test-Path -Path $dir)) {
        Write-Host "Directory does not exist: $dir"
        try {
            New-Item -ItemType Directory -Path $dir -Force | Out-Null
            Write-Host "Created directory: $dir"
        } catch {
            Write-Host "Failed to create directory: $dir. Error: $_"
        }
    } else {
        Write-Host "Directory already exists: $dir"
    }
}


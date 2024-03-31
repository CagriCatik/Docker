# Check if Visual Studio Code is installed
if (!(Test-Path "C:\Program Files\Microsoft VS Code\Code.exe")) {
    Write-Host "Visual Studio Code is not installed. Installing..."
    
    # Download and install Visual Studio Code
    Invoke-WebRequest -Uri "https://update.code.visualstudio.com/latest/win32-x64-user/stable" -OutFile "$env:TEMP\VSCodeSetup.exe"
    Start-Process -FilePath "$env:TEMP\VSCodeSetup.exe" -ArgumentList "/VERYSILENT /NORESTART" -Wait
    Remove-Item "$env:TEMP\VSCodeSetup.exe"
    
    Write-Host "Visual Studio Code installed successfully!"
} else {
    Write-Host "Visual Studio Code is already installed."
}

# Install Docker Desktop
if (!(Get-Command "docker" -ErrorAction SilentlyContinue)) {
    Write-Host "Docker Desktop is not installed. Installing..."
    
    # Download and install Docker Desktop
    Invoke-WebRequest -Uri "https://desktop.docker.com/win/stable/amd64/Docker%20Desktop%20Installer.exe" -OutFile "$env:TEMP\DockerDesktopInstaller.exe"
    Start-Process -FilePath "$env:TEMP\DockerDesktopInstaller.exe" -ArgumentList "/VERYSILENT /NORESTART" -Wait
    Remove-Item "$env:TEMP\DockerDesktopInstaller.exe"
    
    Write-Host "Docker Desktop installed successfully!"
} else {
    Write-Host "Docker Desktop is already installed."
}

# Install Docker extension for Visual Studio Code
Write-Host "Installing Docker extension for Visual Studio Code..."
code --install-extension ms-azuretools.vscode-docker

Write-Host "Docker and Docker extension for Visual Studio Code installed successfully!"

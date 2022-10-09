function installChocolatey {
  Set-ExecutionPolicy "Bypass" -Scope "CurrentUser" -Force
  [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
  Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

function installApps {
  foreach ($app in @("opera-gx", "7zip", "git", "vscode", "hyper")) {
    choco.exe install -yf $app
  }
}

function installWSL {
  powershell.exe wsl --install -d Ubuntu-20.04
}

function getDotFiles {
  powershell.exe git clone "https://github.com/dreisss/.files.git" "$env:USERPROFILE/.files"
}

function getFonts {
  WebClient = New-Object System.Net.WebClient
  WebClient.DownloadFile("https://github.com/microsoft/cascadia-code/releases/download/v2111.01/CascadiaCode-2111.01.zip", "$env:USERPROFILE\Downloads\Cascadia Code.zip")
  WebClient.DownloadFile("https://github.com/AaronFriel/nerd-fonts/releases/download/v2.1.0-rc.0/CaskaydiaCove.zip", "$env:USERPROFILE\Downloads\Caskaydia Cove.zip")
}

function createLinks {
  New-Item -ItemType "SymbolicLink" -Path "$env:USERPROFILE/.gitconfig" -Target "$env:USERPROFILE/.files/.gitconfig"
}

# === === ==== ==== running
installChocolatey
installApps
installWSL

getDotFiles
getFonts

createLinks

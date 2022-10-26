function installChocolatey {
  Set-ExecutionPolicy "Bypass" -Scope "CurrentUser" -Force
  [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
  Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

function installApps {
  foreach ($app in @("alacritty", "vscode", "neovim", "firefox", "git", "7zip")) {
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
  $WebClient = New-Object System.Net.WebClient
  $WebClient.DownloadFile("https://download.jetbrains.com/fonts/JetBrainsMono-2.242.zip?_gl=1*326859*_ga*MTUyNzAxOTIzMC4xNjY2NTcyMjA2*_ga_9J976DJZ68*MTY2NjU3MjIwNS4xLjEuMTY2NjU3Mjk3MS4wLjAuMA..&_ga=2.265432591.1467481788.1666572206-1527019230.1666572206", "$env:USERPROFILE\Downloads\JetBrains Mono.zip")
  $WebClient.DownloadFile("https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip", "$env:USERPROFILE\Downloads\JetBrainsMono Nerd Font.zip")
}

function createLinks {
  New-Item -ItemType "SymbolicLink" -Path "$env:USERPROFILE/.gitconfig" -Target "$env:USERPROFILE/.files/.gitconfig"
  New-Item -ItemType "Directory" "$env:APPDATA/alacritty"
  New-Item -ItemType "SymbolicLink" -Path "$env:APPDATA/alacritty/alacritty.yml" -Target "$env:USERPROFILE/.files/alacritty.yml"
}

function setPreferences {
  Set-ItemProperty -Force -Type "DWord" -Value 2 -Name "VisualFXSetting" "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects"
  
  Set-ItemProperty -Force -Type "DWord" -Value 0 -Name "EnableTransparency" "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
  Set-ItemProperty -Force -Type "DWord" -Value 0 -Name "SystemUsesLightTheme" "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
  Set-ItemProperty -Force -Type "DWord" -Value 0 -Name "AppsUseLightTheme" "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
  Set-ItemProperty -Force -Type "String" -Value 2 -Name "FontSmoothing" "HKCU:\Control Panel\Desktop" 
  
  Set-ItemProperty -Force -Type "DWord" -Value 0 -Name "AllowTelemetry" "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
  
  New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" | Out-Null 
  Set-ItemProperty -Force -Type "DWord" -Value 2 -Name "LetAppsRunInBackground" "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy"

  Set-ItemProperty -Force -Type "DWord" -Value 0 -Name "BingSearchEnabled" "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search"
  Set-ItemProperty -Force -Type "DWord" -Value 1 -Name "LaunchTo" "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
  Set-ItemProperty -Force -Type "DWord" -Value 0 -Name "ShowRecent" "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer"
  Set-ItemProperty -Force -Type "DWord" -Value 0 -Name "ShowFrequent" "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer"
}

# === === ==== ==== running
installChocolatey
installApps
installWSL

getDotFiles
getFonts

createLinks
setPreferences

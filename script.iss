[Setup]
AppName=Password Manager
AppVersion=1.0
DefaultDirName={pf}\PasswordManager
DefaultGroupName=Password Manager
OutputDir=.
OutputBaseFilename=PasswordManagerSetup
Compression=lzma
SolidCompression=yes
SetupIconFile="C:/Users/abbym/Documents/projects/password store/icon.png"

[Files]
Source: "dist\Password Manager.exe"; DestDir: "{app}"
Source: "passwords.txt"; DestDir: "{app}"
; Add other necessary files here

[Icons]
Name: "{commondesktop}\Password Manager"; Filename: "{app}\Password Manager.exe"

[Run]
Filename: "{app}\Password Manager.exe"; Description: "Launch Password Manager"; Flags: postinstall nowait

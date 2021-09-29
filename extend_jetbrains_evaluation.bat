REM Delete eval folder with licence key and options.xml which contains a reference to it
for %%I in ("WebStorm", "IntelliJ", "CLion", "Rider", "GoLand", "PhpStorm", "Resharper", "PyCharm") do (
    for /d %%a in ("%APPDATA%\JetBrains\%%I*") do (
        rd /s /q "%%a\eval"
        del /q "%%a\options\other.xml"
		del /q "%%a\options\updates.xml"
    )
)

REM Delete registry key and jetbrains folder (not sure if needet but however)
REM rmdir /s /q "%APPDATA%\JetBrains"
reg delete "HKEY_CURRENT_USER\Software\JavaSoft" /f

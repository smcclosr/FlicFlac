
SetWorkingDir %A_ScriptDir%
FileDelete FlicFlac.exe
IniWrite % "", FlicFlac.ini, Recent, Dir
IniWrite Center, FlicFlac.ini, Recent, WinX
IniWrite Center, FlicFlac.ini, Recent, WinY
IniWrite 1, FlicFlac.ini, Recent, SelectedFormat

; download ffmpeg if needed
if( Not FileExist("ffmpeg.exe") ) {
  RunWait PowerShell.exe -Command "%A_ScriptDir%\DownloadFfMpeg.ps1", %A_ScriptDir%
}

RunWait "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in FlicFlac.ahk /out FlicFlac.exe /icon "flicflac.ico"

# Since ffmpeg is a large file, we download it instead of keeping it in the
# repository.

# quit the script on error
$ErrorActionPreference = "Stop"
# remove the slow progress bar
$ProgressPreference = "SilentlyContinue"
# in case the user is missing 7-zip from their path, add it here
$env:Path += ";C:\Program Files\7-Zip"
# download ffmpeg from here
$FfMpegDir = "https://www.gyan.dev/ffmpeg/builds/"
$FfMpegFile = "ffmpeg-release-essentials.7z"
try {
    # download the zipped ffmpeg binary
    Write-Output "Downloading ffmpeg..."
    Invoke-WebRequest -Uri "$FfMpegDir/$FfMpegFile" -OutFile $FfMpegFile
    # extract it with 7-zip
    Write-Output "Extracting ffmpeg from archive..."
    7z e $FfMpegFile "*build/bin/ffmpeg.exe"
    Write-Output "ffmpeg download complete."
} finally {
    # remove 7-zip file when done
    Write-Output "Cleaning up ffmpeg archive..."
    if (Test-Path $FfMpegFile) {
        Remove-Item $FfMpegFile
    }
}

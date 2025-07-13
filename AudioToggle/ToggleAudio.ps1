try {
    Import-Module AudioDeviceCmdlets -ErrorAction Stop

    $device1 = "XXX"  # Headphones-ID
    $device2 = "XXX"  # Speaker-ID

    $statusFile = "$PSScriptRoot\\CurrentAudio.txt"

    $current = Get-AudioDevice -Playback

    if ($current.ID -eq $device1) {
        Set-AudioDevice -ID $device2
        "Speaker" | Set-Content $statusFile
    } else {
        Set-AudioDevice -ID $device1
        "Headphones" | Set-Content $statusFile
    }
} catch {
    "Error" | Set-Content $statusFile
}
# Set the start time
$startTime = Get-Date

# Set the duration limit (60 seconds)
$timeLimit = 60

# Load the required library for simulating mouse movements
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class MouseSimulator {
    [DllImport("user32.dll")]
    public static extern bool SetCursorPos(int x, int y);
}
"@

# Start the loop
while ($true) {
    # Calculate the elapsed time in seconds
    $elapsedTime = (New-TimeSpan -Start $startTime).TotalSeconds

    # Check if 60 seconds have passed
    if ($elapsedTime -ge $timeLimit) {
        Write-Host "1 minute has passed, stopping the script."
        break
    }

    # Move the mouse to different coordinates
    [MouseSimulator]::SetCursorPos(100, 100)
    [MouseSimulator]::SetCursorPos(200, 200)
    [MouseSimulator]::SetCursorPos(300, 300)
    [MouseSimulator]::SetCursorPos(400, 400)
    [MouseSimulator]::SetCursorPos(500, 500)

    # Wait for 0.5 seconds before moving the mouse again
    Start-Sleep -Seconds 0.5
}


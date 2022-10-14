# Multi targets Ping

$targets = @"
192.168.0.133

"@ -split "\r\n"

$interval = 500
$repeat   = 100

@(1..$repeat) | ForEach-Object {
    $targets | ForEach-Object {

        Start-Sleep -Milliseconds $interval
        try {

            $tc = Test-Connection $_ -count 1 -ErrorAction Stop

            $result = "ok"
        } catch [Exception] {

            $result = "ng"
        }

        $datetime = Get-Date -F "yyyy/MM/dd HH:mm:ss.fff"

        $row = $result + "," + $datetime  + "," + $tc.Address + "," + $tc.ResponseTime

        $row | ConvertFrom-Csv -Header @("Result","DateTime","Target","ResponseTime(ms)")
    }

} | Out-GridView -Title "Ping Results"

pause
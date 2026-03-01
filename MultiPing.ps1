# Multi targets Ping

$targets = @"
192.0.2.1
198.51.100.1
203.0.113.1
"@ -split "\r\n" | Where-Object { $_ -ne "" }

$interval = 500
$repeat   = 100

@(1..$repeat) | ForEach-Object {
    $targets | ForEach-Object {
        Start-Sleep -Milliseconds $interval

        $target = $_
        $datetime = Get-Date -F "yyyy/MM/dd HH:mm:ss.fff"

        try {
            $tc = Test-Connection $target -Count 1 -ErrorAction Stop
            $result = "ok"
            $address = $tc.Address
            $responseTime = $tc.ResponseTime
        } catch {
            $result = "ng"
            $address = $target
            $responseTime = "-"
        }

        $row = $result + "," + $datetime + "," + $address + "," + $responseTime
        $row | ConvertFrom-Csv -Header @("Result", "DateTime", "Target", "ResponseTime(ms)")
    }
} | Out-GridView -Title "Ping Results"

pause
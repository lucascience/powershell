for($i=0;$i -le 25;$i++) {

    if ($i -le 9) {
        $port = "1170" + $i
    } else {
        $port = "117" + $i
    }

    $server = 'localhost'
    $portToCheck = $port

    If ( Test-Connection $server -Count 1 -Quiet) {
    
        try {       
            $null = New-Object System.Net.Sockets.TCPClient -ArgumentList $server,$portToCheck
            $props = @{
                Server = $server
                PortOpen = 'Yes'
                Port=$port
            }
        }

        catch {
            $props = @{
                Server = $server
                PortOpen = 'No'
                Port=$port
            }
        }
    }

    Else {
        
        $props = @{
            Server = $server
            PortOpen = 'Server did not respond to ping'
            Port=$port
        }
    }

    New-Object PsObject -Property $props

}

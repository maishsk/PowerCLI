#Some nice GUI
function Get-Time { return $(get-date | foreach { $_.ToLongTimeString() } ) }
function prompt
{
    # Write the time 
    write-host "[" -noNewLine
    write-host $(Get-Time) -foreground yellow -noNewLine
    write-host "] " -noNewLine
    # Write the path
    write-host $($(Get-Location).Path.replace($home,"~").replace("\","/")) -foreground green -noNewLine
    write-host $(if ($nestedpromptlevel -ge 1) { '>>' }) -noNewLine
    return "> "
}


#Session log
$ErrorActionPreference="SilentlyContinue"
Stop-Transcript | out-null
$ErrorActionPreference = "Continue"
Start-Transcript ("C:\Users\msaidelk\Documents\log\" + (Get-Date -Format dd-MM-yyyy_HH-mm) + ".log")






#VI Variables
## Set config not to use proxy
#Set-PowerCLIConfiguration -ProxyPolicy Noproxy -Confirm:$false | out-null

#Credentials
#$vcenter = "vc.maishsk.local"
#$vicred = New-Object System.Management.Automation.PsCredential "MAISHSK\Maish", (Get-Content #"C:\Users\msaidelk\Documents\scripts\maish.cred" | ConvertTo-SecureString)
#$rootcred = New-Object System.Management.Automation.PsCredential "root", (Get-Content "C:\Users\msaidelk\Documents\scripts\root.cred" | ConvertTo-SecureString)




#Write-host "Connecting to vc.maishsk.local ...." 
#Connect-VIServer $vcenter -Credential $vicred  | Out-Null

#if ($? ) {
#	Write-Host -ForegroundColor Green "-------------------------------------"
#	Write-Host "Connected to to vc.maishsk.local Successfully"
#	Write-host "-------------------------------------"
#	""
#} else {
#	Write-Warning "Connection to to vc.maishsk.local Not Established. Check What is wrong!!!"
#}

write-host "Loading Scripts and Functions.."
foreach ($script in (Get-ChildItem Scripts:\My*.ps1)) {
Write-host $script.Name
. $script
}


## Extand Maximum History Count
$MaximumHistoryCount = 128
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Set-ExecutionPolicy -Scope CurrentUser
# List of bloatware apps to remove
$AppsList = @(
    "Microsoft.XboxApp",
    "Microsoft.Xbox.TCUI",
    "Microsoft.XboxGameCallableUI",
    "Microsoft.XboxGameOverlay",
    "Microsoft.XboxGamingOverlay",
    "Microsoft.XboxIdentityProvider",
    "Microsoft.XboxSpeechToTextOverlay",
    "Microsoft.SolitaireCollection",
    "Microsoft.3DBuilder"
    "Microsoft.BingNews",
    "Microsoft.GetHelp",
    "Microsoft.GetStarted",
    "Microsoft.GamingApp",
    "Microsoft.OutlookForWindows",
    "Microsoft.People",
    "Microsoft.YourPhone",
    "Microsoft.ZuneMusic",
    "Microsoft.ZuneVideo",
    "Microsoft.WindowsCommunicationsApps",
    "MSTeams",
    #Sponsored Windows 10/11 AppX Apps
    "*EclipseManager*",
    "*ActiproSoftwareLLC*",
    "*AdobeSystemsIncorporated.AdobePhotoshopExpress*",
    "*Duolingo-LearnLanguagesforFree*",
    "*PandoraMediaInc*",
    "*CandyCrush*",
    "*BubbleWitch3Saga*",
    "*Wunderlist*",
    "*Flipboard*",
    "*Twitter*",
    "*Facebook*",
    "*Spotify*",
    "*Minecraft*",
    "*Royal Revolt*",
    "*Sway*",
    "*Speed Test*",
    "*Netflix*",
    "*Roblox*",
    "*TikTok*"
)

# Remove each app
ForEach ($App in $AppsList)
{
    $PackageFullName = (Get-AppxPackage $App).PackageFullName
    $ProPackageFullName = (Get-AppxProvisionedPackage -online | Where-Object {$_.Displayname -eq $App}).PackageName
    write-host $PackageFullName
    Write-Host $ProPackageFullName
    if ($PackageFullName)
    {
        Write-Host "Removing Package: $App" -ForegroundColor Green
        remove-AppxPackage -package $PackageFullName
    }
    if ($ProPackageFullName)
    {
        Write-Host "Removing Provisioned Package: $ProPackageFullName" -ForegroundColor Green
        Remove-AppxProvisionedPackage -online -packagename $ProPackageFullName
    }
    
}
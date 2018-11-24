###Authenticaiton###
$userCredential = Get-StoredCredential -Target "vrdmn.sharepoint.com"
Connect-SPOService -Url "https://vrdmn-admin.sharepoint.com" -Credential $userCredential

#Cleanup any existing site scripts and site designs
Get-SPOSiteDesign | Remove-SPOSiteDesign
Get-SPOSiteScript | Remove-SPOSiteScript

###Site Scripts###
#Get the content of the JSON file and add it to the site script.
$siteScriptListContent = Get-Content 'SiteScripts\site-script-lists.json' -Raw 
$siteScriptList = Add-SPOSiteScript -Title "CnC Lists" -Description "Adds a custom document library to the site" -Content $siteScriptListContent

#Get the content of the JSON file and add it to the site script.
$siteScriptTriggerFlowContent = Get-Content 'SiteScripts\site-script-triggerFlow.json' -Raw 
$siteScriptTriggerFlow = Add-SPOSiteScript -Title "CnC Trigger Flow" -Description "Triggers a Microsoft Flow" -Content $siteScriptTriggerFlowContent

#Get the content of the JSON file and add it to the site script.
$siteScriptThemeContent = Get-Content 'SiteScripts\site-script-theme.json' -Raw 
$siteScriptTheme = Add-SPOSiteScript -Title "CnC Theme Script" -Description "Adds a custom theme to the site" -Content $siteScriptThemeContent

$siteScriptSPFxContent = Get-Content 'SiteScripts\site-script-spfxComponents.json' -Raw 
$siteScriptSPFx = Add-SPOSiteScript -Title "CnC SPFx Script" -Description "Adds SPFx components to the site" -Content $siteScriptSPFxContent

$siteScriptJoinToHubContent = Get-Content 'SiteScripts\site-script-joinToHub.json' -Raw 
$siteScriptJoinToHub = Add-SPOSiteScript -Title "CnC Join to Hub" -Description "Join site to Hub" -Content $siteScriptJoinToHubContent

$siteScriptSharingContent = Get-Content 'SiteScripts\site-script-externalSharing.json' -Raw 
$siteScriptSharing = Add-SPOSiteScript -Title "CnC External Sharing" -Description "Join site to Hub" -Content $siteScriptSharingContent

$siteScriptNavContent = Get-Content 'SiteScripts\site-script-navigation.json' -Raw 
$siteScriptNav = Add-SPOSiteScript -Title "Event Site" -Description "" -Content $siteScriptNavContent

$siteScriptEventListContent = Get-Content 'SiteScripts\site-script-events.json' -Raw 
$siteScriptEventList = Add-SPOSiteScript -Title "Event Site" -Description "" -Content $siteScriptEventListContent

###Site Designs###
#Create a basic site design only using the lists and theme site script.
Add-SPOSiteDesign -Title "CnC Office 365 Group site" -WebTemplate "64" -IsDefault -SiteScripts $siteScriptTheme.ID, $siteScriptList.ID, $siteScriptSharing.ID -Description "CnC custom site connected to Office 365 Group" -PreviewImageUrl "https://vrdmn.sharepoint.com/SiteAssets/cncsitepreview.png" -PreviewImageAltText "CnC custom site logo"

Add-SPOSiteDesign -Title "CnC Basic Communication site" -WebTemplate "68" -SiteScripts $siteScriptTheme.ID, $siteScriptList.ID, $siteScriptSPFx.ID, $siteScriptSharing.ID -Description "CnC basic communication site" -PreviewImageUrl "https://vrdmn.sharepoint.com/SiteAssets/cncsitepreview.png"

#Create an advanced site design by using the theme, lists and flow site scripts
Add-SPOSiteDesign -Title "CnC Advanced Communication site" -WebTemplate "68" -SiteScripts $siteScriptTheme.ID, $siteScriptList.ID, $siteScriptTriggerFlow.ID -Description "CnC advanced communication site" -PreviewImageUrl "https://vrdmn.sharepoint.com/SiteAssets/cncsitepreview.png"

Add-SPOSiteDesign -Title "CnC Department site" -WebTemplate "68" -SiteScripts $siteScriptJoinToHub.ID -Description "Department site will be joined to Hub" -PreviewImageUrl "https://vrdmn.sharepoint.com/SiteAssets/cncsitepreview.png"

Add-SPOSiteDesign -Title "CnC Event site" -WebTemplate "68" -SiteScripts $siteScriptEventList.ID, $siteScriptNav.ID -Description "Event site" -PreviewImageUrl "https://vrdmn.sharepoint.com/SiteAssets/cncsitepreview.png"



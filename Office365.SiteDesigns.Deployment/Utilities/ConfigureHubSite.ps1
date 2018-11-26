###Authenticaiton###
$userCredential = Get-StoredCredential -Target "vrdmn.sharepoint.com"
Connect-SPOService -Url "https://vrdmn-admin.sharepoint.com" -Credential $userCredential

#Register-SPOHubSite -Site "https://vrdmn.sharepoint.com/sites/Events" -Principals $null

$hubSiteDesign = Get-SPOSiteDesign | Where-Object {$_.Title -eq "CnC Event Site"}

Set-SPOHubSite -SiteDesignId $hubSiteDesign.ID -Identity "https://vrdmn.sharepoint.com/sites/Events"
Register-SPOHubSite -Site https://vrdmn.sharepoint.com/sites/SampleHub -Principals $null

$hubSiteDesign = Get-SPOSiteDesign | Where-Object {$_.Title -eq "CnC Basic Communication Site"}

Set-SPOHubSite -SiteDesignId $hubSiteDesign.ID -Identity "https://vrdmn.sharepoint.com/sites/SampleHub"
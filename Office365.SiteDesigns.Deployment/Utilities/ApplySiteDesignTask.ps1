
$siteDesignToApply = Get-SPOSiteDesign | Where-Object {$_.Title -eq "CnC Basic Communication Site"}

Add-SPOSiteDesignTask -SiteDesignId $siteDesignToApply.ID -WebUrl "https://vrdmn.sharepoint.com/sites/classic2"
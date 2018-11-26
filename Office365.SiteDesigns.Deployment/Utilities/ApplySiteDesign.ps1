###Authenticaiton###
$userCredential = Get-StoredCredential -Target "vrdmn.sharepoint.com"
Connect-SPOService -Url "https://vrdmn-admin.sharepoint.com" -Credential $userCredential

$siteDesignToApply = Get-SPOSiteDesign | Where-Object {$_.Title -eq "CnC Basic Communication Site"}

Invoke-SPOSiteDesign -Identity $siteDesignToApply.Id -WebUrl "https://vrdmn.sharepoint.com/sites/Test1/asubsite"
# SharePoint Online Site Designs code samples

### 1. Out of the box Site Scripts and Site Designs

PowerShell scripts which use the `Add-SPOSiteScript` cmdlet to deploy site scripts to the tenant and the `Add-SPOSiteDesign` cmdlet to combine site scripts to deploy them as Site Designs

### 2. Extend Site Designs with Microsoft Flow, Azure Functions and PnP Schema

Code for using the `triggerFlow` action in a Site Design to call a Flow and pass parameters to it. Flow passes the parameters to an Azure Function which then applies PnP schema to the site which executes the Site Design.

### 3. Apply Site Design to existing modern site

Using the `Invoke-SPOSiteDesign` cmdlet to apply a Site Design to an existing modern site.

### 4. Join site to a Hub site using a Site Design

Configure a Hub site on the tenant using the `Register-SPOHubSite` cmdlet and join the current site to a Hub site using the `joinHubSite` site design action

### 5. Sample SPFx solutions used to deploy from Site Designs

Hello world SPFx web part and Application Customizer (for footer) which is deployed to a site using the `installSolution` and `associateExtension` actions in a Site Design.

### 6. Modern themes

Creating and deploying modern themes with the `Add-SPOTheme` cmdlet
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Host;
using Microsoft.SharePoint.Client;
using OfficeDevPnP.Core;
using OfficeDevPnP.Core.Framework.Provisioning.Connectors;
using OfficeDevPnP.Core.Framework.Provisioning.Model;
using OfficeDevPnP.Core.Framework.Provisioning.ObjectHandlers;
using OfficeDevPnP.Core.Framework.Provisioning.Providers.Xml;
using System;
using System.IO;

namespace Office365.SiteDesigns.PnP
{
    public static class ApplyPnPTemplate
    {
        [FunctionName("ApplyPnPTemplate")]
        public static void Run([QueueTrigger("cncprovisioningqueue", Connection = "AzureWebJobsDashboard")]string myQueueItem, TraceWriter log, ExecutionContext executionContext)
        {
            log.Info($"C# Queue trigger function processed: {myQueueItem}");
            var authManager = new AuthenticationManager();
            //To do: store these in a secure location.
            var clientContext = authManager.GetAppOnlyAuthenticatedContext(myQueueItem, "009a20a5-e4ef-43cb-8b05-3a25dbd86cd3", "IxFBF7yrnV3nD29indPJWtfPun054YxFaxdvAalkvoY=");

            string currentDirectory = executionContext.FunctionDirectory;
            DirectoryInfo dInfo = new DirectoryInfo(currentDirectory);
            log.Info("Current directory:" + currentDirectory);
            var schemaDir = dInfo.Parent.FullName + "\\PnPSiteSchemas";
            log.Info("schemaDir:" + schemaDir);
            XMLTemplateProvider sitesProvider = new XMLFileSystemTemplateProvider(schemaDir, "");

            ProvisioningTemplate template = sitesProvider.GetTemplate("SiteCollectionSchema.xml");

            Web web = clientContext.Web;
            clientContext.Load(web, w => w.Url);
            clientContext.ExecuteQueryRetry();

            log.Info("Applying Provisioning template to site: " + clientContext.Web.Url);

            ProvisioningTemplateApplyingInformation ptai = new ProvisioningTemplateApplyingInformation
            {
                ProgressDelegate = (message, progress, total) =>
                {
                    log.Info(string.Format("{0:00}/{1:00} - {2}", progress, total, message));
                }
            };

            // Associate file connector for assets
            FileSystemConnector connector = new FileSystemConnector(Path.Combine(currentDirectory, "Files"), "");
            template.Connector = connector;

            web.ApplyProvisioningTemplate(template, ptai);
        }
    }
}

configuration Sharepoint
{
	# Import the module that defines custom resources
    Import-DscResource -Module xWebAdministration, PSDesiredStateConfiguration
	
	Node WebServer
	{
		WindowsFeature IIS
		{
			Ensure = "Present"
			Name = "Web-Server"
		}
		
		WindowsFeature ASP
		{
			Ensure = "Present"
			Name = "Web-Asp-Net45"
		}
		
		# Create the new Website
        xWebsite NewWebsite
        {
            Ensure          = 'Present'
            Name            = 'Sharepoint'
            State           = 'Started'
            PhysicalPath    = 'C:\inetpub'
            DependsOn       = '[WindowsFeature]IIS'
        }
	}
}

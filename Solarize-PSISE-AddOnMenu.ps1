# Add a menu entry under the Add-ons menu in PowerShell ISE to apply Solarize colors
# Clear existing
$psISE.CurrentPowerShellTab.AddOnsMenu.SubMenus.Clear()

# Create a sub-menu
$solMenu = $psISE.CurrentPowerShellTab.AddOnsMenu.Submenus.Add("Solarize",$null,$null)

# Add entries
$solMenu.Submenus.Add("Apply Dark palette",{.\Solarize-PSISE.ps1 -Dark},"Alt+Shift+D") | Out-Null
$solMenu.Submenus.Add("Apply Light palette",{.\Solarize-PSISE.ps1},"Alt+Shift+L") | Out-Null

# Documentation: http://technet.microsoft.com/en-us/library/dd819494.aspx
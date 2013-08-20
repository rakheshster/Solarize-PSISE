<#
.SYNOPSIS
Companion script to Solarize-PSISE. Running this script creates Add-on menu entries in PowerShell ISE for applying Solarized palette colors. 

.DESCRIPTION
Companion script to Solarize-PSISE. Running this script creates Add-on menu entries in PowerShell ISE for applying Solarized palette colors. 

Using switches one can also apply the palette.

.PARAMETER Apply
Apply the palette too. By default the light palette is applied.

.PARAMETER Dark
WOrks only if specified along with the Apply. If specified the dark palette is applied instead of the (default) light. 

.EXAMPLE
Solarize-PSISE-AddonMenu

Creates Add-on menu entries. Does not apply the colors. 

.EXAMPLE
Solarize-PSISE-AddonMenu -Apply

Creates Add-on menu entries and applies the light palette to PowerShell ISE. 

.EXAMPLE
Solarize-PSISE-AddonMenu -Apply -Dark

Creates Add-on menu entries and applies the dark palette to PowerShell ISE. 
#>

param(
  [parameter(Mandatory=$false)]
  [Switch]
  $Apply,

  [parameter(Mandatory=$false)]
  [Switch]
  $Dark
)

# Add a menu entry under the Add-ons menu in PowerShell ISE to apply Solarize colors
# Documentation: http://technet.microsoft.com/en-us/library/dd819494.aspx
$menuName = "Solarize"

# FYI - to clear sub-menus do
# $psISE.CurrentPowerShellTab.AddOnsMenu.Submenus.Clear()

# Create a sub-menu if it does not already exist
if (!($psISE.CurrentPowerShellTab.AddOnsMenu.Submenus.DisplayName -contains $menuName)) {
  $solMenu = $psISE.CurrentPowerShellTab.AddOnsMenu.Submenus.Add($menuName,$null,$null)

  # Add entries
  $solScript = "$(Split-Path (Get-Variable MyInvocation).Value.InvocationName)\Solarize-PSISE.ps1"
  $solMenu.Submenus.Add("Apply Dark palette",{Invoke-Expression "$solScript -Dark"},"Alt+Shift+D") | Out-Null
  $solMenu.Submenus.Add("Apply Light palette",{Invoke-Expression "$solScript"},"Alt+Shift+L") | Out-Null

  Write-Verbose "Created Submenu $menuName and entries"
} `
else { Write-Verbose "Submenu $menuName already exists. Not creating anything" }

# Apply the colors if the users has passed parameters to do so
if ($apply -and $dark) { Write-Verbose "Applying the dark palette"; Invoke-Expression "$solScript -Dark" }
if ($apply -and !$dark) { Write-Verbose "Applying the light palette"; Invoke-Expression "$solScript" }
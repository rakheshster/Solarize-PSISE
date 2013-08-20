# Solarize-PSISE
## What is it?
Solarized is a sixteen color palette (eight monotones, eight accent colors) designed for use with terminal and gui applications. You can read more about it [here](http://ethanschoonover.com/solarized). 

This is a port of the Solarized color scheme to the PowerShell ISE. 

## What's in the box?
There are two files. 

1. `Solarize-PSISE.ps1` which _when invoked from within PowerShell ISE_ sets the ISE colors from the Solarized palette. Depending on the switches passed to it this script can set colors from the dark or light palette. 
2. `Solarize-PSISE-AddOnMenu.ps1` which, in my opinion, is the script end users should concern themselves with. Invoking this script from within the PowerShell ISE, or adding it to the ISE `$profile`, gets you two menu options under the Add-ons menu item. These menu items let you apply the Solarized palette. If you wish to apply the palette along with creating the menu items it is possible via a switch.

Typing `help` (or `get-help`) followed by the script name will give you more details. In a nutshell `Solarize-PSISE.ps1` has just one switch `-Dark` that determines whether the dark or light palette is used. And `Solarize-PSISE-AddOnMenu.ps1` has two switches `-Apply` which tells it to also apply the palette, and `-Dark` which specifies that the dark palette is to be applied. 

## Installation
1. Copy both files to the same location. For example: `My Documents\Windows PowerShell\Solarize-PSISE`. 
2. Open your PowerShell ISE `$profile`. (The quickest way would be to launch the ISE, go to the console pane, and type `notepad $profile`. This will open Notepad with the `$profile` file and prompt you to create it if it doesn't already exist). 
3. Add a line such as the following to the `$profile` file: `\path\to\files\Solarize-PSISE-AddOnMenu.ps1 -Apply -Dark`
4. Close and open PowerShell ISE. You will notice the dark Solarized palette colors are applied. Also there will be a submenu under Add-ons with two menu items. 
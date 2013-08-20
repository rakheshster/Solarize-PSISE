<#
From http://ethanschoonover.com/solarized#usage-development
Base colors:
base03    #002b36
base02    #073642
base01    #586e75
base00    #657b83
base0     #839496
base1     #93a1a1
base2     #eee8d5
base3     #fdf6e3

The base colors are chosen depending upon the light or dark theme. 
base*3    background
base*2    background highlights 
base*1    optional emphasized content; comments/ secondary content
base*0    body text/ default code/ primary content

Dark theme uses base0[1-3],base[0-1].
  Background is base03. Highlights are base02. Comments are base01. Body text is base0. Emphasized text is base1. 

Light theme uses base[1-3],base0[0-1].
  Background is base3. Highlights are base2. Comments are base1. Body text is base00. Emphasized test is base01. 

Others colors as follows. These are common to both themes. 
yellow    #b58900
orange    #cb4b16
red       #dc322f
magenta   #d33682
violet    #6c71c4
blue      #268bd2
cyan      #2aa198
green     #859900

In PowerShell ISE, token colors can be set via $psISE.Options.TokenColors. 
Pane colors can be set via $psISE.Options.CommandPaneBackgroundColor etc. 
See http://technet.microsoft.com/en-us/library/dd819482.aspx
#>

# Defining a switch parameter which lets you flick between dark and light themes
# If $DarkTheme is set the dark theme is used; else it's the light theme.
param([switch]$DarkTheme)

# Global Definitions
## Variables for the colors codes
$base03   = "#002b36"
$base02   = "#073642"
$base01   = "#586e75"
$base00   = "#657b83"
$base0    = "#839496"
$base1    = "#93a1a1"
$base2    = "#eee8d5"
$base3    = "#fdf6e3"
$yellow   = "#b58900"
$orange   = "#cb4b16"
$red      = "#dc322f"
$magenta  = "#d33682"
$violet   = "#6c71c4"
$blue     = "#268bd2"
$cyan     = "#2aa198"
$green    = "#859900"

## Variables for the fonts
## These are the default PowerShell font and size; change if you want to.
## !!TODO!! allow users to specify this on the command line? Obviously check with the installed fonts to validate. 
$font     = "Lucida Console"
$fontsize = 10


# The actual action starts here.
# The Script pane is common to both PowerShell 2.0 and 3.0 ISE. Defining its colors & fonts here.
$psISE.Options.ScriptPaneBackgroundColor = if ($DarkTheme) { $base03 } else { $base3 }
$psISE.Options.ScriptPaneForegroundColor = if ($DarkTheme) { $base0 } else { $base00 }

$psISE.Options.FontName = $font
$psISE.Options.FontSize = $fontsize

# Attributes are items like [CmdletBinding()], [Parameter] etc in function definitions.
$psISE.Options.TokenColors.Item("Attribute") = $yellow

# Cmdlets, their arguments & parameters.
$psISE.Options.TokenColors.Item("Command") = if ($DarkTheme) { $base1 } else { $base01 }
$psISE.Options.TokenColors.Item("CommandArgument") = $blue
$psISE.Options.TokenColors.Item("CommandParameter") = $red

# Comments.
$psISE.Options.TokenColors.Item("Comment") = if ($DarkTheme) { $base01 } else { $base1 }

# Brackets etc.
$psISE.Options.TokenColors.Item("GroupEnd") = if ($DarkTheme) { $base1 } else { $base01 }
$psISE.Options.TokenColors.Item("GroupStart") = if ($DarkTheme) { $base1 } else { $base01 }

# Keywords (if, while, etc).
$psISE.Options.TokenColors.Item("Keyword") = $green

# Not really sure what this is, so setting this to the default color.
$psISE.Options.TokenColors.Item("LineContinuation") = if ($DarkTheme) { $base0 } else { $base00 }

# Not really sure what this is, but since it's a label I'm setting it to the highlight color.
$psISE.Options.TokenColors.Item("LoopLabel") = if ($DarkTheme) { $base1 } else { $base01 }

# Members.
$psISE.Options.TokenColors.Item("Member") = if ($DarkTheme) { $base0 } else { $base00 }

# Not really sure what this is, so setting this to the default color.
$psISE.Options.TokenColors.Item("NewLine") = if ($DarkTheme) { $base0 } else { $base00 }

# Numbers (even as array indexes).
$psISE.Options.TokenColors.Item("Number") = $cyan

# Operators (+, += etc).
$psISE.Options.TokenColors.Item("Operator") = if ($DarkTheme) { $base0 } else { $base00 }

# Not really sure what this is, so setting this to the default color.
$psISE.Options.TokenColors.Item("Position") = if ($DarkTheme) { $base0 } else { $base00 }

# Statement separators (semicolon etc).
$psISE.Options.TokenColors.Item("StatementSeparator") = if ($DarkTheme) { $base1 } else { $base01 }

# String.
$psISE.Options.TokenColors.Item("String") = $cyan

# Type defintions ([int32] etc).
$psISE.Options.TokenColors.Item("Type") = $violet

# Unknown items (I this is the color you will see while typing and before it's actually colored.
$psISE.Options.TokenColors.Item("Unknown") = if ($DarkTheme) { $base0 } else { $base00 }

# Variables.
$psISE.Options.TokenColors.Item("Variable") = $orange

# Now for the PowerShell ISE version specific stuff
switch ($PSVersionTable.PSVersion.Major) {
  2 
  {
    # PowerShell 2.0 ISE specific stuff go here. For instance, the Command pane & Output pane colors.
    # Command pane background colors.
    # Can't set the foreground color as that's taken from the Script pane foreground color.
    $psISE.Options.CommandPaneBackgroundColor = if ($DarkTheme) { $base03 } else { $base3 }
  
    # Output pane colors.
    $psISE.Options.OutputPaneBackgroundColor = $psISE.Options.OutputPaneTextBackgroundColor = $base03
    $psISE.Options.OutputPaneForegroundColor = $base1

  }
  3 
  {
    # PowerShell 3.0 ISE specific stuff go here. Does not have the Command pane & Output pane. 
    # Instead, it has a Console pane that is essentially the Command & Output panes combined. And it supports token colors! W00t!

    # Console pane colors.
    $psISE.Options.ConsolePaneBackgroundColor = $psISE.Options.ConsolePaneTextBackgroundColor = $base03
    $psISE.Options.ConsolePaneForegroundColor = $base1

    # Token colors in the console pane. Skipping comments as these are same as the token definitions in the Script pane (defined below).
    $psISE.Options.ConsoleTokenColors.Item("Attribute") = $yellow
    $psISE.Options.ConsoleTokenColors.Item("Command") = if ($DarkTheme) { $base1 } else { $base01 }
    $psISE.Options.ConsoleTokenColors.Item("CommandArgument") = $blue
    $psISE.Options.ConsoleTokenColors.Item("CommandParameter") = $red
    $psISE.Options.ConsoleTokenColors.Item("Comment") = if ($DarkTheme) { $base01 } else { $base1 }
    $psISE.Options.ConsoleTokenColors.Item("GroupEnd") = if ($DarkTheme) { $base1 } else { $base01 }
    $psISE.Options.ConsoleTokenColors.Item("GroupStart") = if ($DarkTheme) { $base1 } else { $base01 }
    $psISE.Options.ConsoleTokenColors.Item("Keyword") = $green
    $psISE.Options.ConsoleTokenColors.Item("LineContinuation") = if ($DarkTheme) { $base0 } else { $base00 }
    $psISE.Options.ConsoleTokenColors.Item("LoopLabel") = if ($DarkTheme) { $base1 } else { $base01 }
    $psISE.Options.ConsoleTokenColors.Item("Member") = if ($DarkTheme) { $base0 } else { $base00 }
    $psISE.Options.ConsoleTokenColors.Item("NewLine") = if ($DarkTheme) { $base0 } else { $base00 }
    $psISE.Options.ConsoleTokenColors.Item("Number") = $cyan
    $psISE.Options.ConsoleTokenColors.Item("Operator") = if ($DarkTheme) { $base0 } else { $base00 }
    $psISE.Options.ConsoleTokenColors.Item("Position") = if ($DarkTheme) { $base0 } else { $base00 }
    $psISE.Options.ConsoleTokenColors.Item("StatementSeparator") = if ($DarkTheme) { $base1 } else { $base01 }
    $psISE.Options.ConsoleTokenColors.Item("String") = $cyan
    $psISE.Options.ConsoleTokenColors.Item("Type") = $violet
    $psISE.Options.ConsoleTokenColors.Item("Unknown") = if ($DarkTheme) { $base0 } else { $base00 }
    $psISE.Options.ConsoleTokenColors.Item("Variable") = $orange
  }
  default
  {
    # Setting the background color of various messages to that of highlighted text of dark theme. 
    $psISE.Options.ErrorBackgroundColor = $base02
    $psISE.Options.WarningBackgroundColor = $base02
    $psISE.Options.VerboseBackgroundColor = $base02
    $psISE.Options.DebugBackgroundColor = $base02

    # I read somewhere that error messages are better off being in a different color than $red so as to not put you off.
    $psISE.Options.ErrorForegroundColor = $green
    $psISE.Options.WarningForegroundColor = $orange
    $psISE.Options.VerboseForegroundColor = $yellow
    $psISE.Options.DebugForegroundColor = $blue  
  }
}
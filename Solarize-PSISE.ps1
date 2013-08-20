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
$font     = "Lucida Console"
$fontsize = 12

## Set to $true if dark theme is preferred.
## !!TODO!! Tweak later.
$darktheme = $true

# The actual action starts here.
switch ($PSVersionTable.PSVersion.Major) {
  2 
  {
    ## Script pane & Command pane background colors.
    $psISE.Options.ScriptPaneBackgroundColor = if ($darktheme) { $base03 } else { $base3 }
    $psISE.Options.CommandPaneBackgroundColor = if ($darktheme) { $base03 } else { $base3 }


  }
  3
  {
    ## For PowerShell 3 we do the above and also colorize the tokens in the Output Pane
    ## Skipping comments coz it's the same as above anyway
    $psISE.Options.ConsoleTokenColors.Item("Attribute") = $yellow
    $psISE.Options.ConsoleTokenColors.Item("Command") = if ($darktheme) { $base1 } else { $base01 }
    $psISE.Options.ConsoleTokenColors.Item("CommandArgument") = $blue
    $psISE.Options.ConsoleTokenColors.Item("CommandParameter") = $red
    $psISE.Options.ConsoleTokenColors.Item("Comment") = if ($darktheme) { $base01 } else { $base1 }
    $psISE.Options.ConsoleTokenColors.Item("GroupEnd") = if ($darktheme) { $base1 } else { $base01 }
    $psISE.Options.ConsoleTokenColors.Item("GroupStart") = if ($darktheme) { $base1 } else { $base01 }
    $psISE.Options.ConsoleTokenColors.Item("Keyword") = $green
    $psISE.Options.ConsoleTokenColors.Item("LineContinuation") = if ($darktheme) { $base0 } else { $base00 }
    $psISE.Options.ConsoleTokenColors.Item("LoopLabel") = if ($darktheme) { $base1 } else { $base01 }
    $psISE.Options.ConsoleTokenColors.Item("Member") = if ($darktheme) { $base0 } else { $base00 }
    $psISE.Options.ConsoleTokenColors.Item("NewLine") = if ($darktheme) { $base0 } else { $base00 }
    $psISE.Options.ConsoleTokenColors.Item("Number") = $cyan
    $psISE.Options.ConsoleTokenColors.Item("Operator") = if ($darktheme) { $base0 } else { $base00 }
    $psISE.Options.ConsoleTokenColors.Item("Position") = if ($darktheme) { $base0 } else { $base00 }
    $psISE.Options.ConsoleTokenColors.Item("StatementSeparator") = if ($darktheme) { $base1 } else { $base01 }
    $psISE.Options.ConsoleTokenColors.Item("String") = $cyan
    $psISE.Options.ConsoleTokenColors.Item("Type") = $violet
    $psISE.Options.ConsoleTokenColors.Item("Unknown") = if ($darktheme) { $base0 } else { $base00 }
    $psISE.Options.ConsoleTokenColors.Item("Variable") = $orange
  }
  default
  {
    ## Attributes are items like [CmdletBinding()], [Parameter] etc in function definitions.
    $psISE.Options.TokenColors.Item("Attribute") = $yellow

    ## Cmdlets, their arguments & parameters.
    $psISE.Options.TokenColors.Item("Command") = if ($darktheme) { $base1 } else { $base01 }
    $psISE.Options.TokenColors.Item("CommandArgument") = $blue
    $psISE.Options.TokenColors.Item("CommandParameter") = $red

    ## Comments.
    $psISE.Options.TokenColors.Item("Comment") = if ($darktheme) { $base01 } else { $base1 }

    ## Brackets etc.
    $psISE.Options.TokenColors.Item("GroupEnd") = if ($darktheme) { $base1 } else { $base01 }
    $psISE.Options.TokenColors.Item("GroupStart") = if ($darktheme) { $base1 } else { $base01 }

    ## Keywords (if, while, etc).
    $psISE.Options.TokenColors.Item("Keyword") = $green

    ## !!LATER!! Not really sure what this is, so setting this to the default color.
    $psISE.Options.TokenColors.Item("LineContinuation") = if ($darktheme) { $base0 } else { $base00 }

    ## !!LATER!! Not really sure what this is, but since it's a label I'm setting it to the highlight color.
    $psISE.Options.TokenColors.Item("LoopLabel") = if ($darktheme) { $base1 } else { $base01 }

    ## Members.
    $psISE.Options.TokenColors.Item("Member") = if ($darktheme) { $base0 } else { $base00 }

    ## !!LATER!! Not really sure what this is, so setting this to the default color.
    $psISE.Options.TokenColors.Item("NewLine") = if ($darktheme) { $base0 } else { $base00 }

    ## Numbers (even as array indexes).
    $psISE.Options.TokenColors.Item("Number") = $cyan

    ## Operators (+, += etc).
    $psISE.Options.TokenColors.Item("Operator") = if ($darktheme) { $base0 } else { $base00 }

    ## !!LATER!! Not really sure what this is, so setting this to the default color.
    $psISE.Options.TokenColors.Item("Position") = if ($darktheme) { $base0 } else { $base00 }

    ## Statement separators (semicolon etc).
    $psISE.Options.TokenColors.Item("StatementSeparator") = if ($darktheme) { $base1 } else { $base01 }

    ## String.
    $psISE.Options.TokenColors.Item("String") = $cyan

    ## Type defintions ([int32] etc).
    $psISE.Options.TokenColors.Item("Type") = $violet

    ## Unknown items (this is the color you will see while typing and before it's actually colored.
    $psISE.Options.TokenColors.Item("Unknown") = if ($darktheme) { $base0 } else { $base00 }

    ## Variables.
    $psISE.Options.TokenColors.Item("Variable") = $orange
  }
}

## Output pane colors
## Sticking with the dark theme for output pane and its elements. 
## Setting background color as that of dark theme. And foreground color as emphasized text. 
if ($PSVersionTable.PSVersion.Major -eq 2) {
  $psISE.Options.OutputPaneBackgroundColor = $psISE.Options.OutputPaneTextBackgroundColor = $base03
  $psISE.Options.OutputPaneForegroundColor = $base1
}

if ($PSVersionTable.PSVersion.Major -eq 3) {
  $psISE.Options.ConsolePaneBackgroundColor = $base03
  $psISE.Options.ConsolePaneForegroundColor = $base1
}

## Other elements of the output pane 
## Setting the background to highlighted text of dark theme. 
$psISE.Options.ErrorBackgroundColor = $base02
$psISE.Options.WarningBackgroundColor = $base02
$psISE.Options.VerboseBackgroundColor = $base02
$psISE.Options.DebugBackgroundColor = $base02

### I read somewhere that error messages are better off being in a different color so as to not put you off.
### By default they are red and we humans hate red! :p
$psISE.Options.ErrorForegroundColor = $green
$psISE.Options.WarningForegroundColor = $orange
$psISE.Options.VerboseForegroundColor = $yellow
$psISE.Options.DebugForegroundColor = $blue
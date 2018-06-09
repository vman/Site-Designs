$themepallette = @{
"themePrimary" = "#ee970e";
"themeLighterAlt" = "#fefaf3";
"themeLighter" = "#fef5e7";
"themeLight" = "#fceace";
"themeTertiary" = "#f9d499";
"themeSecondary" = "#f2a323";
"themeDarkAlt" = "#d5890d";
"themeDark" = "#a66a0a";
"themeDarker" = "#825308";
"neutralLighterAlt" = "#f8f8f8";
"neutralLighter" = "#f4f4f4";
"neutralLight" = "#eaeaea";
"neutralQuaternaryAlt" = "#dadada";
"neutralQuaternary" = "#d0d0d0";
"neutralTertiaryAlt" = "#c8c8c8";
"neutralTertiary" = "#cef0fc";
"neutralSecondary" = "#21baf2";
"neutralPrimaryAlt" = "#0d9ed3";
"neutralPrimary" = "#0fb0eb";
"neutralDark" = "#0a7ba4";
"black" = "#086181";
"white" = "#ffffff";
"primaryBackground" = "#ffffff";
"primaryText" = "#0fb0eb";
"bodyBackground" = "#ffffff";
"bodyText" = "#0fb0eb";
"disabledBackground" = "#f4f4f4";
"disabledText" = "#c8c8c8";
}

Add-SPOTheme -Name "My Custom Theme" -Palette $themepallette -IsInverted $false
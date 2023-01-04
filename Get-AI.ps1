<#
.Synopsis
   Queries the openai.com API
.EXAMPLE
   Get-AI 'Write a bash while loop'
.EXAMPLE
   Get-AI -Query 'Write a PowerShell script to calculate leap years' -API 'Put_Your_API_Key_Here'
#>
function Get-AI
{
    [CmdletBinding()]
    [OutputType([string])]
    Param
    (
        # Enter the query to send
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        $Query,

        # Put your API key string here. 
        [Parameter(Mandatory=$false)]
        [string]
        $APIKey = 'Put_Your_API_Key_Here',

        # Put your Endpoint string here. 
        [Parameter(Mandatory=$false)]
        [string]
        $Endpoint = 'https://api.openai.com/v1/completions',

        # Put your Model string here. 
        [Parameter(Mandatory=$false)]
        [string]
        $Model = 'text-davinci-003',

        # Set the Temperature here. 
        [Parameter(Mandatory=$false)]
        [int]
        $Temperature = 0,

        # Set the Max Tokens here. 
        [Parameter(Mandatory=$false)]
        [int]
        $Max_tokens = 2048

    )

    Begin
    {
        $Headers = @{
            "Authorization" = "Bearer $APIKey"
            "Content-Type" = "application/json"
        }
        $Params = @"
        {
        "model": "$Model",
        "prompt": "$Query",
        "temperature": $Temperature,
        "max_tokens": $Max_tokens
        }
"@
    }
    Process
    {
        $Response = Invoke-WebRequest -Method POST -Uri $Endpoint -Body $Params -Headers $Headers -UseBasicParsing
    }
    End
    {
        # Cleanup Output
        $Output = $Response.Content | ConvertFrom-Json
        $Output.choices | Select-Object -ExpandProperty text
    }
}

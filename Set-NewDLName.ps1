<#
    .SYNOPSIS

    This function add a character to the DL name if exchange hybrid is enabled (allows for the dynamic group creation.)
    
    .DESCRIPTION

    This function add a character to the DL name if exchange hybrid is enabled (allows for the dynamic group creation.)

    .PARAMETER GlobalCatalogServer

    The global catalog to make the query against.

    .PARAMETER DN

    The original DN of the object.

    .PARAMETER DLName

    The name of the DL from the original configuration.

    .PARAMETER DLSamAccountName

    The original DN of the object.

    .OUTPUTS

    None

    .EXAMPLE

    set-newDLName -dlConfiguration dlConfiguration -globalCatalogServer globalCatalogServer

    #>
    Function set-newDLName
     {
        [cmdletbinding()]

        Param
        (
            [Parameter(Mandatory = $true)]
            [string]$globalCatalogServer,
            [Parameter(Mandatory = $true)]
            $dlName,
            [Parameter(Mandatory = $true)]
            $dlSAMAccountName,
            [Parameter(Mandatory = $true)]
            $DN
        )

        #Declare function variables.

        [string]$functionGroupName=$NULL #Holds the calculated name.
        [string]$functionGroupSAMAccountName=$NULL #Holds the calculated sam account name.

        #Start function processing.

        Out-LogFile -string "********************************************************************************"
        Out-LogFile -string "BEGIN SET-NEWDLNAME"
        Out-LogFile -string "********************************************************************************"

        #Log the parameters and variables for the function.

        Out-LogFile -string ("GlobalCatalogServer = "+$globalCatalogServer)
        OUt-LogFile -string ("DLName = "+$dlName)
        out-logfile -string ("DLSamAccontName = "+$dlSAMAccountName)
        out-logfile -string ("DN = "+$dn)

        #Establish new names

        [string]$functionGroupName = $dlName+"!"
        #[string]$functionGroupSAMAccountName = $dlSAMAccountName+"!"
        [string]$functionGroupSAMAccountName ="TEST"

        out-logfile -string ("New group name = "+$functionGroupName)
        out-logfile -string ("New group sam account name = "+$functionGroupSAMAccountName)
        
        #Get the specific user using ad providers.
        
        try 
        {
            Out-LogFile -string "Setting the new group SAM Account Name.."

            set-adgroup -identity $dn -replace @('samAccountName'=$functionGroupSAMAccountName) -server $globalCatalogServer
        }
        catch 
        {
            Out-LogFile -string $_ -isError:$TRUE
        }

        try
        {
            out-logfile -string "Setting the new group name.."

            rename-adobject -identity $dn -newName $functionGroupName -server $globalCatalogServer
        }
        catch
        {
            Out-LogFile -string $_ -isError:$true  
        }

        Out-LogFile -string "END Set-NewDLName"
        Out-LogFile -string "********************************************************************************"
    }
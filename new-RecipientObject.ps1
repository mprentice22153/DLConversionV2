<#
    .SYNOPSIS

    This function creates a normalized recipient object.
    
    .DESCRIPTION

    This function creates a normalized recipient object.

    .PARAMETER alias

    The alias of the object to be returned.

    .PARAMETER name

    The name of the object to be returned.

    .PARAMETER primarySMTPAddressOrUPN

    The primary SMTP address or UPN of the object.

    .PARAMETER GUID

    The object GUID of the object.

    .PARAMETER RecipientType

    The recipient object class from active directory.

    .PARAMETER GroupType

    The group type if the object is a group.

    .PARAMETER RecipientOruser

    Determines if the object is mail enabled or just a user.

    .PARAMETER externalDirectoryObjectID

    The azure object id.

    .PARAMETER isAlreadyMigrated 

    Flag to indicate if group was already migrated.

    .PARAMETER isError

    Flag to determine if the object is in error.

    .PARAMETER isErrorMessage

    Error message if object is in error.

    .OUTPUTS

    The canonical name of a given object.

    .EXAMPLE

    new-recipientObject -alias $alias -name $name -primarySMTPAddressOrUPN $primarySMTPAddressOrUPN -GUID $guid -RecipientType $recipientType -groupType $groupType -recipientOrUser $recipientOrUser -externalDirectoryObjectID $externalDirectoryObjectID -isAlreadyMigrated $TRUE -isError $FALSE -isErrorMessage $errorMessage

    #>
    Function new-recipientObject
     {
        [cmdletbinding()]

        Param
        (
            [Parameter(Mandatory = $true)]
            [AllowNull()]
            [AllowEmptyString()]
            [string]$alias,
            [Parameter(Mandatory = $true)]
            [AllowNull()]
            [AllowEmptyString()]
            [string]$name,
            [Parameter(Mandatory = $true)]
            [AllowNull()]
            [AllowEmptyString()]
            [string]$primarySMTPAddressOrUPN,
            [Parameter(Mandatory = $true)]
            [AllowNull()]
            [AllowEmptyString()]
            [string]$GUID,
            [Parameter(Mandatory = $true)]
            [AllowNull()]
            [AllowEmptyString()]
            [string]$recipientType,
            [Parameter(Mandatory = $true)]
            [AllowNull()]
            [AllowEmptyString()]
            [string]$GroupType,
            [Parameter(Mandatory = $true)]
            [AllowNull()]
            [AllowEmptyString()]
            [string]$RecipientOrUser,
            [Parameter(Mandatory = $true)]
            [AllowNull()]
            [AllowEmptyString()]
            [string]$ExternalDirectoryObjectID,
            [Parameter(Mandatory = $true)]
            [AllowNull()]
            [boolean]$isAlreadyMigrated,
            [Parameter(Mandatory = $true)]
            [AllowNull()]
            [boolean]$isError,
            [Parameter(Mandatory = $true)]
            [AllowNull()]
            [AllowEmptyString()]
            [string]$isErrorMessage

        )

        #Declare function variables.

        $functionObject=$NULL #This is used to hold the object that will be returned.

        #Start function processing.

        Out-LogFile -string "********************************************************************************"
        Out-LogFile -string "BEGIN new-recipientObject"
        Out-LogFile -string "********************************************************************************"

        #Log the parameters and variables for the function.

        Out-LogFile -string ("Alias = "+$alias)
        Out-LogFile -string ("Name = "+$name)
        Out-LogFile -string ("PrimarySMTPAddressOrUPN = "+$primarySMTPAddressOrUPN)
        Out-LogFile -string ("GUID = "+$GUID)
        Out-LogFile -string ("RecipientType = "+$RecipientType)
        Out-LogFile -string ("GroupType = "+$groupType)
        Out-LogFile -string ("RecipientOrUser = "+$recipientOrUser)
        Out-LogFile -string ("ExternalDirectoryObjectID = "+$externalDirectoryObjectID)
        Out-LogFile -string ("isAlreadyMigrated = "+$isAlreadyMigrated)
        Out-LogFile -string ("isError = "+$isError)
        Out-LogFile -string ("isErrorMessage = "+$isErrorMessage)
        
        $functionObject = New-Object PSObject -Property @{
            Alias = $alias
            Name = $name
            PrimarySMTPAddressOrUPN = $primarySMTPAddressOrUPN
            GUID = $guid
            RecipientType = $recipientType
            GroupType = $groupType
            RecipientOrUser = $RecipientOrUser
            ExternalDirectoryObjectID = $ExternalDirectoryObjectID
            isAlreadyMigrated = $isAlreadyMigrated
            isError=$isError
            isErrorMessage=$isErrorMessage
        }

        out-logfile $functionObject

        Out-LogFile -string "********************************************************************************"
        Out-LogFile -string "BEGIN new-recipientObject"
        Out-LogFile -string "********************************************************************************"
        
        return $functionObject
    }
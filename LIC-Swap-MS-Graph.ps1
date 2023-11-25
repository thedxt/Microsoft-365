# MS Graph LIC Swap
# Author: Daniel Keer
# Author URI: https://thedxt.ca

# change this to the LIC you want to remove
$remove_LIC = "SPB"

#change this to the LIC you want to add
$add_LIC = "O365_BUSINESS_PREMIUM"

#getting the LIC details
$SKU_RM = Get-MgSubscribedSku -All | Where SkuPartNumber -eq $remove_LIC

$SKU_ADD = Get-MgSubscribedSku -All | Where SkuPartNumber -eq $add_LIC

#get all users that have that LIC
$UserList = Get-MgUser -all -Filter "assignedLicenses/any(x:x/skuId eq $($SKU_RM.SkuId) )"

#Loop to process the list of users
Foreach ($User in $UserList) {

#remove the LIC (added out null to supress the output) you need the add lic as that is required
Set-MgUserLicense -UserId $user.Id -AddLicenses @{}  -RemoveLicenses @($SKU_RM.SkuId) | Out-Null
Write-host "Removed $remove_LIC from" $User.UserPrincipalName

#add the LIC (added out null to supress the output) you need the remove lic as that is required
Set-MgUserLicense -UserId $user.Id -AddLicenses @{SkuId = $SKU_ADD.SkuId}  -RemoveLicenses @() | Out-Null
Write-host "Added $add_LIC to" $User.UserPrincipalName
}

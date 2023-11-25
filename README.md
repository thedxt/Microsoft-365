# Microsoft 365
scripts related to Microsoft 365

## LIC-Swap-MS-Graph.ps1

PowerShell script that swaps Microsoft 365 licences using Microsoft Graph.

* Change `remove_LIC` and `add_LIC` varriable to what you need.
* Finds all the users that have the `remove_LIC` SKU.
* For-each loop of the results and removes the license and outputs the license removed and the UPN of the user it was removed from. Then it adds the `add_LIC` SKU to the user and outputs the license added and the UPN of the user it was added to.

[More detailed documentation](https://thedxt.ca/2023/11/swap-365-licenses-with-ms-graph/)

Prerequisites
* MS Graph PowerShell Module needs to be installed


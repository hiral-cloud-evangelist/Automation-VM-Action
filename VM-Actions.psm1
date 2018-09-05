# Input Parameters for
# - VmName: name of the vm to perform action to
# - ResourceGroupName: resource group where the vm belongs to
# - VmAction:action to perform (startup or shutdown)
Param(
 [string]$VmName,
 [string]$ResourceGroupName,
# [ValidateSet("Startup", "Shutdown","Restart")]
 [string]$VmAction
)
Write-Output 'started'
Try
{
# Authenticate with your Automation Account
$Conn = Get-AutomationConnection -Name AzureRunAsConnection
Add-AzureRMAccount -ServicePrincipal -Tenant $Conn.TenantID `
-ApplicationID $Conn.ApplicationID -CertificateThumbprint $Conn.CertificateThumbprint

Get-AzureRmResourceGroup -Name $ResourceGroupName -ErrorVariable notPresent -ErrorAction SilentlyContinue

if ($notPresent)
{
    # ResourceGroup doesn't exist
    $message = 'Input Parameter Error: ' + $ResourceGroupName + '  Resource group does not exist'
    Write-Output $message
}
else
{
     

# $VMNameQuery = Get-VM -name $VmName  

# if ($VmName) { 

# $Exists = get-vm -name $VmName -ErrorAction SilentlyContinue  
# If ($Exists){  
#      Write "VM is there"  


# Startup VM
if ($VmAction -eq "Startup") {
    Start-AzureRmVM -Name $VmName -ResourceGroupName $ResourceGroupName
}
 
# Shutdown VM
elseif ($VmAction -eq "Shutdown") {
    Stop-AzureRmVM -Name $VmName -ResourceGroupName $ResourceGroupName -Force
}

# Restart VM
elseif ($VmAction -eq "Restart") {
    Restart-AzureRmVM -Name $VmName -ResourceGroupName $ResourceGroupName 
}

else
{
    $message = 'Input Parameter : Please provide valid actionname; valid action names are 1. Startup (to start VM), 2. Shutdown (to shutdown vm), 3. Restart (Restart VM) '
    Write-Output $message
}

}  
# Else {  
#      $message = 'Input Parameter :  VM does not exist'
#     Write-Output $message

      
# }


# }
}
catch{
    $ErrorMessage = 'Error : ' + $_.Exception.Message
      Write-Output $ErrorMessage
}
Get-Command -Module PKI


$thumbprint = "179526E4FF42D64C40D20F9740883CAC405EC654"
Get-ChildItem -Path cert:\LocalMachine\My -Recurse | Where-Object { $_.Thumbprint -eq $thumbprint } | Select-Object *
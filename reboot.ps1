# This command below is used to retireve the properties within the 
# config.txt file and use them within this script.
#
# Use the command '$table.Get_Item({KEY})' to get a value from the config.txt file.
Get-Content "config.txt" | foreach-object -begin { $table = @{} } -process { $k = [regex]::split($_, '='); if (($k[0].CompareTo("") -ne 0) -and ($k[0].StartsWith("[") -ne $True)) { $table.Add($k[0], $k[1]) } }

$Command = "echo Hello World!"

# Creates credentials by making the plain text password secure first.
$secpasswd = ConvertTo-SecureString $table.Get_Item("Password") -AsPlainText -Force
$Credentials = New-Object System.Management.Automation.PSCredential($table.Get_Item("Username"), $secpasswd)

# Connects Over SSH.
$SessionID = New-SSHSession -ComputerName $table.Get_Item("IP") -Credential $Credentials -AcceptKey

# Invokes The Command Over SSH.
Invoke-SSHCommand -Index $sessionid.sessionid -Command $Command
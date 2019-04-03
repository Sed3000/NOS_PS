#User list format: Firstname | Lastname | Maildomain | SAM | OU | Password | Description

$Users = Import-Csv -Path "C:\users\swhite\documents\40users.csv"            
foreach ($User in $Users)            
{            
    $Displayname = $User.'Firstname' + " " + $User.'Lastname'            
    $UserFirstname = $User.'Firstname'            
    $UserLastname = $User.'Lastname'            
    $OU = $User.'OU'            
    $SAM = $User.'SAM'            
    $UPN = $user.'SAM' + "@" + $User.'Maildomain'            
    $Description = $User.'Description'            
    $Password = $User.'Password' 
    #echo $Displayname " "$SAM " " $UPN " " $Password " " $OU          
    New-ADUser -Name "$Displayname" -DisplayName "$Displayname" -SamAccountName $SAM -UserPrincipalName $UPN -GivenName "$UserFirstname" -Surname "$UserLastname" -Description "$Description" -AccountPassword (ConvertTo-SecureString $Password -AsPlainText -Force) -Enabled $true -ChangePasswordAtLogon $false –PasswordNeverExpires $true -path $OU      
} 

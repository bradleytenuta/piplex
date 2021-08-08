### Logging into PI and moving files over

You can add a IP address to this file so you dont have to type in the IP everytime: 'C:\Windows\System32\drivers\etc'.

#### Logging in

1. Open up powershell and connect to the rasberry PI with the following command: 'ssh <IP_Address> -l bradleytenuta'

#### Copying files over SSH

1. Go to the file that contains the folders of films to copy. Use the following command to copy over files while logged in: 'scp -r \* bradleytenuta@Bradley-Pi:~/piplex/mnt/ext_1/Movies/'

-   -r means recursive
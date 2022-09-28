import os

with open('exhibitions.conf','w+') as f:
	for item in os.listdir("extracts"):
		f.write(
            '''
            <VirtualHost *:80>
                    ServerAdmin i@sjcorp.com.tw
                    DocumentRoot "/var/www/html/{}/public/"
                    ServerName "www.{}"
                    ServerAlias "{}"
                    ErrorLog "logs/{}-error.log"
                    CustomLog "logs/{}.log" combined
                    <Directory "/var/www/html/{}/public/">
                        Options FollowSymLinks
                        AllowOverride All
                        Require all granted
                    </Directory>
            </VirtualHost>'''.format(item,item,item,item,item,item)
        )

for f in $1/*
do
    dirname="$(basename $f)"
    echo $dirname
    echo "
    <VirtualHost *:80>
            ServerAdmin xxxx
            DocumentRoot \"/var/www/html/$dirname/public/\"
            ServerName \"www.$dirname\"
            ServerAlias \"$dirname\"
            ErrorLog \"logs/$dirname-error.log\"
            CustomLog \"logs/$dirname.log\" combined
            <Directory \"/var/www/html/$dirname/public/\">
                Options FollowSymLinks
                AllowOverride All
                Require all granted
            </Directory>
    </VirtualHost>" >> exhibitions.conf
done
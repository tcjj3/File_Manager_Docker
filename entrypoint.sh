#!/bin/sh






/etc/init.d/cron restart







cat << EOF > /etc/caddy/Caddyfile
0.0.0.0:5006 {
    root /usr/local/bin/file_manager
    tls off
    gzip
    browse
}
EOF










# Path to save "filebrowser.db"
#cd /usr/local/bin/file_manager
cd /opt/file_manager_config






/usr/local/bin/caddy --conf=/etc/caddy/Caddyfile &
/usr/local/bin/filebrowser -r /usr/local/bin/file_manager -p 9999 -a 0.0.0.0












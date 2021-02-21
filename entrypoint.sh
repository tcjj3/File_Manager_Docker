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










cd /usr/local/bin/file_manager






/usr/local/bin/caddy --conf=/etc/caddy/Caddyfile &
/usr/local/bin/filebrowser -r /usr/local/bin/file_manager -p 9999 -a 0.0.0.0













```
config interface 'loopback'
        option ifname 'lo'
        option proto 'static'
        option ipaddr '127.0.0.1'
        option netmask '255.0.0.0'

config globals 'globals'
        option ula_prefix 'fd72:a8fc:85b0::/48'

config interface 'lan'
        option type 'bridge'
        option ifname 'eth0'
        option proto 'static'
        option ipaddr '192.168.1.1'
        option netmask '255.255.255.0'
        option ip6assign '60
```

```
config interface 'loopback'
        option ifname 'lo'
        option proto 'static'
        option ipaddr '127.0.0.1'
        option netmask '255.0.0.0'

config globals 'globals'
        option ula_prefix 'fd72:a8fc:85b0::/48'

config interface 'lan'
        option type 'bridge'
#        option ifname 'eth0'
        option proto 'static'
        option ipaddr '192.168.6.1'
        option netmask '255.255.255.0'
        option ip6assign '60'

config interface wan
        option proto 'dhcp'
        option ifname 'eth0'
```

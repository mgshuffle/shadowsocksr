#!/bin/bash

ssrusrport=199;
ssrusrname=riko;
ssrkey=yigougou;

echo 'adding usr port'
echo $(firewall-cmd --permanent --zone=public --add-port=$ssrusrport/tcp)
echo 'firewall reloading'
echo $(firewall-cmd --reload)

bash initcfg.sh
sed -i "s/API_INTERFACE = .\+\?\#/API_INTERFACE = \'mudbjson\' \#/g" userapiconfig.py

echo 'init ssr'
python mujson_mgr.py -a -u $ssrusrname -p $ssrusrport -k $ssrkey -m aes-256-cfb;

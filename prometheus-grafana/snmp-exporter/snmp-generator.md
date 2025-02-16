


```
http://192.168.0.123:9116/snmp?target=192.168.1.106&auth=public_v2&module=if_mib

```


### snmp-exporter

from https://github.com/prometheus/snmp_exporter/blob/main/Dockerfile
'''yaml
EXPOSE      9116
ENTRYPOINT  [ "/bin/snmp_exporter" ]
CMD         [ "--config.file=/etc/snmp_exporter/snmp.yml" ]
'''


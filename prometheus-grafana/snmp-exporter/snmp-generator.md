


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

### grafana


#### Grafana Dashboard ####
Total Traffic
sum(irate(ifHCInOctets{instance="$Device"}[$__rate_interval]) * 8)
sum(irate(ifHCOutOctets{instance="$Device"}[$__rate_interval]) * 8)

IN & OUT per interface
irate(ifHCInOctets{instance="192.168.0.84",ifIndex="2"}[$__rate_interval]) * 8
irate(ifHCOutOctets{instance="192.168.0.84",ifIndex="2"}[$__rate_interval]) * 8

Uptime
sysUpTime{instance="$Device"} * 10

System name
sysName{instance="$Device"}



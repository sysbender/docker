nginxdemos/hello

run portainer:

```

```

docker run --rm -it --privileged --net container:hello nicolaka/netshoot


sudo docker network create \
--driver ipvlan \
--subnet 192.168.123.0/24 \
--opt parent=eth0 \
--opt ipvlan_mode=l3 \
ipvlan123



=============proxmox
```shell
docker network create -d ipvlan     --subnet=192.168.86.0/24     -o ipvlan_mode=l3 -o parent=ens18 ipnet86


# Test 192.168.214.0/24 connectivity
 docker run --net=ipnet86 --ip=192.168.86.201 -itd alpine /bin/sh


# Test L3 connectivity from 10.1.214.0/24 to 192.168.214.0/24
 docker run --net=ipnet86 --ip=192.168.86.202 -it --rm alpine ping -c 2 192.168.86.201

# Test L3 connectivity from 192.168.214.0/24 to 10.1.214.0/24
 docker run --net=ipnet210 --ip=10.1.214.9 -it --rm alpine ping -c 2 192.168.214.10

 ```



https://docs.kernel.org/networking/ipvlan.html

 ```shell
 #  Following will create IPvlan link with eth0 as master in L3 bridge mode:

 ip link add link eth0 name ipvl0 type ipvlan

 ```


 ## macvlan

 ```
docker network rm macnet
docker network create -d macvlan --subnet=192.168.0.0/24 --gateway=192.168.0.1 macnet


docker network create -d macvlan   --subnet=192.168.0.0/24   --gateway=192.168.0.1   -o parent=ens18   macnet

 ```
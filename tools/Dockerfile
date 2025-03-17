# Use the traefik/whoami image as the base image
FROM traefik/whoami:latest


RUN apk --update add openssh nmap nmap-scripts curl tcpdump bind-tools jq nmap-ncat && \
sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config && rm -rf /var/cache/apk/*

# # Install net-tools (ifconfig, netstat)
# RUN apk update && apk add --no-cache net-tools

# # Install iputils (ping)
# RUN apk add --no-cache iputils

# Install curl
RUN apk add --no-cache curl

# Install wget
RUN apk add --no-cache wget

# Install traceroute
RUN apk add --no-cache traceroute

# Install bind-tools (dig, nslookup)
RUN apk add --no-cache bind-tools

# Install nmap
RUN apk add --no-cache nmap

# Install iproute2
RUN apk add --no-cache iproute2

# Install tcpdump
RUN apk add --no-cache tcpdump

# Optional: Set the default command
CMD ["whoami"]

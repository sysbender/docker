cd ~
mkdir certs
cd certs
# Gen ssl certs:
openssl req -new -newkey rsa:4096 -nodes -keyout key.pem -out cert.csr \
  -subj "/C=CA/ST=Quebec/L=Montreal/O=HomeLab/OU=QA/CN=localhost"

openssl x509 -req -sha256 -days 365 -in cert.csr -signkey key.pem -out cert.pem

chmod 600 cert.csr
chmod 600 cert.pem
chmod 600 key.pem
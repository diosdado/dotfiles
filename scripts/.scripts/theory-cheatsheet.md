

# openssl
```bash
# list all commands
openssl help

# tools for cryptogrphy, certificates, certificate authorities, certificate signatures, etc

# view man page for each subcommand
man req

# edit configuration to store default values to pre-populate various fields
vi /etc/ssl/openssl.cnf

```




<br>




# public key cryptography

- sender encrypts with public key of recipient, recipient decrypts its private key
- digital signature: signed by the private key, and public key validates with the public key
- CA: Certificate Authority
- A certificate is a public key signed by a CA
- Process
    - a browser recognizes a web address starting with https
    - web browser asks the server for ita public key, signed by CA
    - web server sends the public key to the web browser
    - web browser verifies the key of the server with the public key of the CS that signed the key
    - if key is valid, web browesr and web server stablish a secure connection



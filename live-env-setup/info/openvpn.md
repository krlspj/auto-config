## When errors running openvpn from CLI
if file comes from vpngate, add this configuration lines like in the example:
```
client
dev tun
proto tcp
remote public-vpn-253.opengw.net 443
resolv-retry infinite
nobind
persist-key
persist-tun
cipher AES-128-CBC
auth SHA1
remote-cert-tls server
data-ciphers AES-256-GCM:AES-128-GCM:AES-128-CBC
verb 3
```
**remote-cert-tls server**
**data-ciphers AES-256-GCM:AES-128-GCM:AES-128-CBC**

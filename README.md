Setup NGINX WITH HTTPS

Before the script, you need to add a record in domain host( where did you buy the domain like godaddy,...)

With domain, add this record for mark domain for IP
```bash
    A @ xxx.xxx.xxx.xxx 
```
With subdomain, add this record for mark domain for IP
for example domain: api.abc.com

```bash
    CNAME api abc.com
```

Now comeback to the terminal

setup for index.html/react
```bash
    chmod +x setup-index-html.sh
```

```bash
    setup-index-html.sh
```

Setup for foward port/nextJS
```bash
    chmod +x setup-forward-port.sh
```

```bash
    setup-forward-port.sh
```
# apache-with-git-branches

The `apache-with-git-branches` project is a template to allow developers working on a PHP website to work easily on multiple branches at the same time.

## Prerequisites

- Docker will need to be installed.
- You'll to configure your DNS (ZONE file), if your website is `my-project.com`, I would have an A record for `*.harry.my-project.com` pointing to `192.168.1.10` which is my workstation.

If you don't have a domain, you can do it yourself in your hosts file, simply add `127.0.0.1 1234-fix-broken-contact-form.harry.my-project.com 1235-fix-broken-another-form.harry.my-project.com` and so on to your `/etc/hosts` file in Linux or OSx and for Windows in `c:\Windows\System32\Drivers\etc\hosts` - read more on how to do this [here](https://docs.rackspace.com/support/how-to/modify-your-hosts-file).

## HOWTO

0. Deploy locally this image/container (see `Deploy` below)
1. Create a ticket in GitLab or GitHub, call something like `FIX - broken contact form`
2. Associate a branch to this ticket, calling it `1234-fix-broken-contact-form` where 1234 is the ticket id - in GitLab a lot of this is done automatically
3. Clone this branch in your project directory on your workstation (in my example i've done this in `C:\Users\me\my-project\1234-fix-broken-contact-form`)

## Deploy

```
docker build -t apache-with-git-branches ./

docker run -it --rm -h test --name test -p 80:80 -p 443:443 -v c:/Users/me/Apps/apache-with-git-branches:/var/www/project apache-with-git-branches
```
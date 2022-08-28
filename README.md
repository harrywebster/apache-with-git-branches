# apache-with-git-branches

The `apache-with-git-branches` project is a template to allow developers working on a PHP website to work easily on multiple branches at the same time.

## Prerequisites

- Docker will need to be installed.
- You may wish to configure your DNS (ZONE file), if your website is `my-project.com`, I would have an A record for `*.dev.my-project.com` pointing to `127.0.0.1` or if you want others to be able to see your work on the same network `*.harry.my-project.com` resolving to your internal IP address (eg `192.168.1.x`).

If you don't have a domain yet, or in the case of proof-of-concept projects never will, you can use `branch-name.localhost.testmy.cloud`... `ANYTHING.localhost.testmy.cloud` will resolve to localhost (yourself).

NB: if you're using your own domain, you will need to update the domain in `etc/apache2/sites-enabled/000-default.conf` and `app/public/index.php`


## HOWTO

0. Deploy locally this image/container (see `Deploy` below)
1. Create a ticket in GitLab or GitHub, call something like `FIX - broken contact form`
2. Associate a branch to this ticket, calling it `1234-fix-broken-contact-form` where 1234 is the ticket id - in GitLab a lot of this is done automatically
3. Clone this branch in your project directory on your workstation (in my example i've done this in `C:\Users\me\my-project\1234-fix-broken-contact-form`)

## Deploy

```
docker build -t apache-with-git-branches ./

docker run -it --rm -h test --name test -p 80:80 -p 443:443 -v C:/Users/me/github/apache-with-git-branches:/var/www/project apache-with-git-branches
```

If you wish to run the Docker container in the background use this run command:
```
docker run -dit --rm -h test --name test -p 80:80 -p 443:443 -v c:/Users/me/Apps/apache-with-git-branches:/var/www/project apache-with-git-branches
```

... and to attach/debug/monitor run `docker exec -it test /bin/bash`.
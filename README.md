# Humble CLI

## Give it a try now!

**Mac OSx:**

```
bash <(curl -s https://raw.githubusercontent.com/marcopeg/humble-cli/master/remote-setup.sh)
```

**Ubuntu Server:**

```
bash <(wget -qO- https://raw.githubusercontent.com/marcopeg/humble-cli/master/remote-setup.sh)
```

**HumbleCLI** is distributed as a GitHub repository of _bash scripts_ that are linked to your `/usr/local/bin` folder to be globally available.

> It is pretty much the same approach that _Hombebrew_ had chosen, you can trust us :-)

### Update:

```
humble update-cli
```

### Uninstall

```
~/.humble-cli/uninstall.sh
```

### Documentation:

We are working hard on our inline documentation.  
It's just like any other _cli_ help support:

```
humble help [command]
```

## WHY?

`docker-compose` is so cool, uh? But you may want to provide your app with **environment based settings and services** for development, testing, production, etc.

Then you probably run commands like that:

```
// Development
MAIN_PORT=8080 API_KEY=testKey docker-compose -f docker-compose.yml -f docker-compose.development.yml up -d --build

// Production
MAIN_PORT=80 API_KEY=hdew79weydq7rsgf3455dfh docker-compose -f docker-compose.yml -f docker-compose.production.yml up -d --build
```

I don't know about you but **I grew tired of those long commands** which I used to store in my project's readme and copy/paste to my terminal. It just doesn't work well.

`docker-compose` already fetches environment variables from a `.env` file in the project's _CWD_, so why don't **make `.env` more useful and extensible**?

```
// .env
HUMBLE_ENV=development
MAIN_PORT=8080
API_KEY=testKey
```

```
// Project's root folder:
- .env
- docker-compose.yml
- docker-compose.development.yml
- docker-compose.production.yml
- /services
```

```
// Start up my project
humble up -d
```

> `humble` reads through your `.env` file and figures out which info to 
> give to `docker-compose` on your behalf. That's just about it!

- your boot command is part of your codebase
- you can easily setup different environments
- **every tiny bit of configuration is environment driven** so you can keep your source-code and production settings apart from each other
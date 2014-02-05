MojoTech Blog
====
This repo consists of the source code (theme + ghost) for the  mojotech.com blog.
Feel free to remix and reuse. Feel free to open PR's back into this repo to improve it.


## Dev
* install vagrant
* vagrant up dev
* view at [http://localhost:8080/](http://localhost:8080/)
* create an account / content at [http://localhost:8080/ghost](http://localhost:8080/ghost)

## Deploying
* install vagrant
* install vagrant-digitalocean plugin
* acquire the deploy ssh and api keys
* set DIGITAL_OCEAN_CLIENT_ID and DIGITAL_OCEAN_API_KEY environment variables
* vagrant up production --provider=digital_ocean

## Seeding with data
A common problem is ""well now that I have it running how can I get content into the blog?"

* Visit [tumblr-to-ghost.herokuapp.com/](http://tumblr-to-ghost.herokuapp.com/‎
)
* [http://localhost:8080/ghost/debug](http://localhost:8080/ghost/debug)

MojoTech Blog
====
This repo consists of the source code (theme + ghost) for the  mojotech.com blog.
Feel free to remix and reuse. Feel free to open PR's back into this repo to improve it.


## Dev
* `npm install`
* `node start`
* create an account / content at [http://localhost:8080/ghost](http://localhost:8080/ghost)
* set the theme to mojo
* `compass watch content/themes/mojo/`
  - commit both your sass changes and compiled css

## Deploying
* install vagrant
* install vagrant-digitalocean plugin
* acquire the deploy ssh and api keys
* set DIGITAL_OCEAN_CLIENT_ID and DIGITAL_OCEAN_API_KEY environment variables
* vagrant up production --provider=digital_ocean

* redeploying
  * vagrant provision production

* to be able to deploy your public key must be in ~/.ssh/authorized_keys on the droplet

## Seeding with data
A common problem is ""well now that I have it running how can I get content into the blog?"

* Visit [tumblr-to-ghost.herokuapp.com/](http://tumblr-to-ghost.herokuapp.com/‎
)
* [http://localhost:8080/ghost/debug](http://localhost:8080/ghost/debug)

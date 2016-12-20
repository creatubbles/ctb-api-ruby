# Example web application

This is a little example web application illustrating how to use the Creatubbles Ruby API.

## Installation on local

1. Get application ID & secret from Creatubbles with `https://ctbex.dev/callback` as callback URL
2. Install puma-dev, for instance using `brew install puma-dev`. We need this so we can use SSL and a local domain
3. Create `.env` file with `export CREATUBBLES_CLIENT_ID=...` and `export CREATUBBLES_CLIENT_SECRET=...`
4. `bundle install`
5. link example directory to `~/.puma-dev/ctbex`
6. open `https://ctbex.dev/`

# ctb-api-ruby

Creatubbles Ruby API

## API

The API implementation follows the official API documentation published here: https://partners.creatubbles.com/api/

Only a subset of actions are supported at the moment. Have a look at the included scripts to see the bindings in action.


## ctb_uploader script

Script to upload files to Creatubbles from the command line. Run it to get help:

```
$ ./bin/ctb_uploader
Usage: ctb_uploader <file> [OPTIONS]

file
     path to file you'd like to upload; has to be a supported file type

Environment
     CREATUBBLES_CLIENT_ID: application client ID
     CREATUBBLES_CLIENT_SECRET: application client secret
     CREATUBBLES_USERNAME: user's email
     CREATUBBLES_PASSWORD: user's password
     CREATUBBLES_API_URL: API URL (default: https://api.creatubbles.com/v2/)

Options
    -u, --username EMAIL             user's email
    -p, --password password          user's password
    -n, --name NAME                  creation name
    -d, --description TEXT           description text
    -g, --gallery GALLERY_ID         add creation to gallery
    -h, --help                       help
```

It's recommended to set the required credentials in the enviroment:

- `CREATUBBLES_CLIENT_ID`, `CREATUBBLES_CLIENT_SECRET`: the OAuth client ID and secret
- `CREATUBBLES_USERNAME`, `CREATUBBLES_PASSWORD`: the user's email and password for login (actually optional for using the API - but uploading requires user credentials, soe make sure to supply them)
- `CREATUBBLES_API_URL`: you usually won't need to change.

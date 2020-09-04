# intro 
api app via nodejs 
ref. https://www.codementor.io/olatundegaruba/nodejs-restful-apis-in-10-minutes-q0sgsfhbd


# install nvm node npm yarn
require nvm ref. bit.ly/361kgIF

```bash
# install latest lts node+npm - lts aka long term support
nvm install lts/*
nvm use     lts/*
nvm install-latest-npm

node --version; which node
npm  --version; which npm

# install :yarn under current :node ref. https://stackoverflow.com/a/53094675/248616 
npm install -g yarn  # g aka global
```

# create empty package.json
yarn init -y
yarn install

# install packages
`express` to create web server 
`nodemon` to keep track of file changes and auto-restart the server
 
```bash
yarn add express
yarn add nodemon
```

# api run 0th
add blank api app in `server.js`
add task `start` to package.json

run it
```bash
yarn start  # ctrl-c to stop

# aka
./bin/run-api.sh  # ctrl-c to stop
```


# api run
```bash
# install package
yarn install

# run api
./bin/run-api.sh  # ctrl-c to stop
```


# call endpoint as api been run
httpie is required here
```bash
http :3000/health

http :3000/hello
http :3000/hello/
http :3000/hello/nn
```

or can just go with pure curl or Postman 

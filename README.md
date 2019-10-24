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
npm install -g yarn

# create empty package.json
yarn init -y
yarn install
```

# api app via nodejs 
ref. https://www.codementor.io/olatundegaruba/nodejs-restful-apis-in-10-minutes-q0sgsfhbd

`express` to create the server 
`nodmon`  to keep track of changes to files and automatically restart the server
 
```bash
yarn add express
yarn add nodemon
```
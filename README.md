# install nvm
ref. https://itnext.io/nvm-the-easiest-way-to-switch-node-js-environments-on-your-machine-in-a-flash-17babb7d5f1b
ref. https://www.sitepoint.com/quick-tip-multiple-versions-node-nvm/
```bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
nvm --version # should print the version as a proof of successful installation
```

# install nodejs
```bash
nvm ls-remote       # list all versions

nvm ls              # list installed versions

nvm install 8.12.0  # install a version
nvm install node    # install latest

```

# switch nodejs version 
```bash
nvm use 8.12.0            # use this version for local folder
nvm use node              # use latest version for local folder

nvm alias default 8.12.0  # set this version as default version
```

# view current status
```bash
nvm current       # view current version
nvm which 8.12.0  # view path of the binary nodejs
nvm which current # view path of current nodejs version

```

# misc
```bash
nvm alias awesome-version 8.9.4 # name/make-alias for this specific version
nvm unalias awesome-version     # remove the alias

nvm run 8.12.0 --version #TODO
nvm exec 8.12.0 node --version #TODO
```

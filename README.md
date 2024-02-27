# Vultr Marketplace

> 🔔 [Subscribe](https://chv.to/newsletter) to don't miss any update regarding Chevereto.

[![Chevereto](LOGO.svg)](https://chevereto.com)

[![Community](https://img.shields.io/badge/chv.to-community-blue?style=flat-square)](https://chv.to/community)

This repository provides the Chevereto [Vultr Marketplace](https://www.vultr.com/marketplace/apps/chevereto?ref=8880327) application.

## Install Packer

Install [Packer](https://learn.hashicorp.com/tutorials/packer/get-started-install-cli):

* Ubuntu

```sh
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install packer
```

* macOS

```sh
brew tap hashicorp/tap
brew install hashicorp/tap/packer
```

Init packer:

```sh
packer init .
```

## Running

Provide [Vultr API key](https://www.vultr.com/api):

```sh
export VULTR_API_KEY=token_here
```

Run:

```sh
packer build marketplace-image.json
```

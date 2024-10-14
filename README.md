# Vultr Marketplace

> 🔔 [Subscribe](https://chevereto.com/go/newsletter) to don't miss any update regarding Chevereto.

[![Chevereto](LOGO.svg)](https://chevereto.com)

[![Community](https://img.shields.io/badge/chevereto.com/go-community-blue?style=flat-square)](https://chevereto.com/go/community)

This repository provides the Chevereto [Vultr Marketplace](https://chevereto.com/go/vultr) application.

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

# Chromia Container Templates: Chromia tools, Rell, Postgres, and more.

> The Simple Chromia template contains Java (from the base image), the Chromia tooling, a Postgres instance for storage, plus various useful tools. It is suitable for use with Github CodeSpaces and similar hosted environments, although as always valuable private keys should not be stored there.
> To provide feedback please open an issue [on our Github](https://github.com/ChromiaProject/devcontainers-chromia/issues).

## Functionality

This container offers the following functionality:
* Java (from its base)
* NodeJS+npm (since it's need for everything these days 🙂)
* Chromia tooling: [chr](https://docs.chromia.com/cli/introduction) and [pmc](https://docs.chromia.com/providers/pmc/)
* Postgres (with a default database for Chromia)

## Repo and Template Structure

This repository will contain a _collection_ of templates. Similar to the [`devcontainers/templates`](https://github.com/devcontainers/templates) repo, this repository has a `src` folder.  Each Template has its own sub-folder, containing at least a `devcontainer-template.json` and `.devcontainer/devcontainer.json`. 

```
├── src
│   ├── simple-chromia
│   │   ├── devcontainer-template.json
│   │   └──| .devcontainer
│   │      └── devcontainer.json
|   ├── ...
│   │   ├── devcontainer-template.json
│   │   └──| .devcontainer
│   │      └── devcontainer.json
├── test
│   ├── simple-chromia
│   │   └── test.sh
│   └──test-utils
│      └── test-utils.sh
...
```

### Options

The template inherits its optionality from its [base container](https://hub.docker.com/r/microsoft/devcontainers-java)


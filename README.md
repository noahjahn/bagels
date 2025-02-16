# bagels Dockerized

The [Bagels](https://github.com/EnhancedJax/Bagels) TUI setup to be run locally with Docker (so you don't need python or uv installed)

## Requirements

1. Github public repository read-only PAT (here are the steps if you don't have one already)
   a. In GitHub under settings > developer settings > personal access tokens > fine-grained tokens
   b. Generate a new token
   c. Set a name (something like `ghcr-public-read-only`)
   d. Keep your user as the resource owner
   e. Set an expiration (because this token won't have any write access, it's probably okay to set it to not expire)
   f. Keep the repository access as "Public Repositories (read-only)"
   g. You don't need to add any other permissions
   h. Generate the token and store it securely for your records
2. Docker

## Setup

1. Clone this repo somewhere your user has access. I prefer my home directory: ~

```
git clone git@github.com:noahjahn/utils.git ~/bagels
```

2. Add the directory to your users' PATH

3. Login to the GitHub container registry

```
docker login ghcr.io
```

Username: <your-github-username>
Password: <your-github-pat>

_your PAT should be kept private, don't share it with anyone_

2. Add the directory to your users' `PATH`

- the file is different depending on your OS. Examples:

  - .bash_profile
  - .bashrc
  - .profile
  - .zshrc
  - .zprofile

- be sure to change the file path if you didn't clone this repo to your home directory

```bash
if [ -d "$HOME/bagels/bin" ] ; then
    PATH="$PATH:$HOME/bagels/bin"
fi
```

## Usage

```
$ bagels help
```

```
Usage:  bagels [OPTIONS] [COMMANDS]

Run Bagels TUI

Options:
  -d, --data-dir        string  The path to the data directory. Used to preserve data

Commands:
  help          Display usage and how to use the script
```

The data directory option defaults to "$HOME/bagels/data".

So, you can just run `bagels` to start the app.

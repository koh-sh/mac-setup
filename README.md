# mac-setup

# Procedure

## install command developer tools

```bash
xcode-select --install
```

## clone this repo and make all

```bash
git clone https://github.com/koh-sh/mac-setup.git
cd mac-setup && make all
```

## Open each applications and set configs

### All

Set "Launch on start", and allow at Accesibility

### Chrome

login with Google account and disable `Show warning before quitting with ⌘Q`

### VSCode

Login with GitHub and sync settings

### Clipy

set main shortcut

### ShowyEdge

set blue for japanese

### Safari

Allow Full disk access for the using Terminal
and run make safari

```bash
make safari
```

### Mail

open app and login Google

## Mac System configs

### File Vault

set enabled

### japanese input

TODO: automation

- Disable Live Conversion
- Enable Windows-like shortcuts

### Other settings

run make mac-system

```bash
make mac-system
```

but it is not well tested, check each setting one by one

## install other apps

- [LogiTune](https://www.logicool.co.jp/ja-jp/video-collaboration/software/logi-tune-software.html)
- [Logi Options+](https://www.logicool.co.jp/ja-jp/software/logi-options-plus.html)

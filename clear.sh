#!/bin/bash

 git rm -r --cache "EFI/APPLE"
 git rm -r --cache "EFI/Microsoft"
 git rm -r --cache "$RECYCLE.BIN"
 git rm -r --cache ".PKInstallSandboxManager"
 git rm -r --cache ".Spotlight-V100"
 git rm -r --cache ".TemporaryItems"
 git rm -r --cache ".Trashes"
 git rm -r --cache "._README.md"
 git rm -r --cache ".fseventsd"


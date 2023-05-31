# Getting to know which package is needed for a given missing file

## Problem
```bash
! Package fontenc Error: Encoding file `ly1enc.def' not found.
```

## Solution
```bash
tlmgr info ly1enc.def
```
results in the package name `ly1`
to find out if it is part of a larger package, use
```bash
tlmgr info ly1
```
and if so, install the package with
```bash
tlmgr install collection-fontsextra
```
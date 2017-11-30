## Setup

```
git submodule init
git submodule update
```

## Build

linux - using zathura pdf viewer
`latexmk -r latexmkrc.linux`

osx - using Skim pdf viewer
`latexmk -r latexmkrc.osx`

To run `latexmk` in continuous build and preview mode append `-pvc` the `latexmk`
command.

If all goes well, `latexmk` creates `out/engparSC17.pdf`.

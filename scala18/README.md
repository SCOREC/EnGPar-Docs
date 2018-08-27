## Workshop Information

Workshop Details: https://www.csm.ornl.gov/srt/conferences/Scala/2018/

SC Session: https://sc18.supercomputing.org/presentation/?id=wksp123&sess=sess158

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

If all goes well, `latexmk` creates `out/engpar_scala18.pdf`.

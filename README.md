# engpar_imr18

IMR submission info and template
http://imr.sandia.gov/27imr/PaperSubmission.html

## Setup

clone the scorec-refs repo submodule

```
git submodule init
git submodule update
```

## Build

```latexmk -r latexmk.<linux|osx|rhel7>```

will produce an `out` directory with the `engpar_imr18.pdf`

### Rhel7

The SCOREC rhel7 systems are missing the `framed.sty` latex package.  It has
been added to the repo to support the build until the latex system install is
updated.


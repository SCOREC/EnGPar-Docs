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

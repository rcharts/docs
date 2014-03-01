Documentation for rCharts
=========================

This repository contains the source files used to generate documentation for [rCharts](http://rcharts.io). The documentation is built by [ReadTheDocs](http://readthedocs.org) and can be viewed [here](http://rcharts.readthedocs.org).

How it Works?
-------------

The source files are written in `Rrst`, which is a reproducible reStructured Text format, supported by [knitr](http://yihui.name/knitr). The `.Rrst` files are knit into `.rst` files by a [custom script](knit). The documentation can be built locally using [sphinx](http://sphinx-doc.org/), by using the [Makefile](Makefile).

```bash
$ git clone https://github.com/rcharts/docs.git
$ cd docs
$ make rst && make html && make latexpdf
```

How to Contribute
-----------------

I am still figuring out the best way for others to contribute to this effort. I will update this section once I come up with a minimal set of guidelines.




dat <- paste(readLines('nvd3/charts.R'), collapse = '\n')
examples <- strsplit(dat, '\n## ----')[[1]]
examples2 <- lapply(Filter(function(x) x!= "", examples), function(example){
  ex = strsplit(example, '-+\n')[[1]]
  ex_nm = strsplit(ex, ",")[[1]][1]
  c(ex[2], ex_nm)
})

names(examples2) = sapply(examples2, '[[', 2)
examples3 = lapply(examples2, '[[', 1)


create_examples_json = function(rfiles){
  dat <- lapply(rfiles, function(rfile){
  	paste(readLines(rfile), collapse = '\n')
  })
  dat <- do.call(function(...) paste(..., collapse = '\n'), dat)
  examples <- strsplit(dat, '\n## ----')[[1]]
  examples2 <- lapply(Filter(function(x) x!= "", examples), function(example){
    ex = strsplit(example, '-+\n')[[1]]
    ex_nm = strsplit(ex, ",")[[1]][1]
    c(ex[2], ex_nm)
  })

  names(examples2) = sapply(examples2, '[[', 2)
  examples3 = lapply(examples2, '[[', 1)
  rjson::toJSON(examples3)
}
# Load libraries
library(sparklyr)
library(tidyverse)
library(leaflet)
library(DT)
library("nycflights13")
library("Lahman")

library(sparklyr)
sc <- spark_connect(master = "local")

if ("package:h2o" %in% search()) { detach("package:h2o", unload=TRUE) }
if ("h2o" %in% rownames(installed.packages())) { remove.packages("h2o") }

# Next, we download packages that H2O depends on.
pkgs <- c("statmod","RCurl","jsonlite")
for (pkg in pkgs) {
  if (! (pkg %in% rownames(installed.packages()))) { install.packages(pkg) }
}

# Now we download, install and initialize the H2O package for R.
install.packages("h2o", type="source", repos="http://h2o-release.s3.amazonaws.com/h2o/rel-vajda/3/R")

# Finally, let's load H2O and start up an H2O cluster
library(h2o)
h2o.init()
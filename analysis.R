library(tidyverse)
library(knitr)
library(ggplot2)
library(readxl)
library(prettydoc)

health_insurance_coverage <- read.csv("states.csv")

global_database <- read_excel("GHED_data.XLSX")

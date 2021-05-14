library(tidyverse)
library(knitr)
library(ggplot2)
library(readxl)
library(prettydoc)

health_insurance_coverage <- read.csv("data/states.csv")

GHED_data <- read_excel("data/GHED_data.XLSX")

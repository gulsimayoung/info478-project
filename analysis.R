library(tidyverse)
library(knitr)
library(ggplot2)
library(readxl)
library(prettydoc)
library(stringr)

# load data
health_insurance_coverage <- read.csv("data/states.csv")

GHED_data <- read_excel("data/GHED_data.XLSX")

# rename columns
health_insurance_coverage <- rename(health_insurance_coverage,
                            uninsured_2010=Uninsured.Rate..2010.,                              
                            uninsured_2015=Uninsured.Rate..2015.,
                            uninsured_change=Uninsured.Rate.Change..2010.2015.,
                            avg_tax_2016=Average.Monthly.Tax.Credit..2016.,
                            expansion=State.Medicaid.Expansion..2016.)


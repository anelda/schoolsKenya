# Load packages
library(dplyr)
library(sf)
library(stringr)
library(janitor)
library(here)

# Download SHP formatted data as rar archive from https://datacatalog.worldbank.org/dataset/kenya-schools
# https://energydata.info/dataset/2fda191d-c3c6-4002-8c82-daa02008a9e3/resource/8e5899a5-2c3a-4fca-92d0-27368582a1df/download/shp.rar
# Extract .rar outside of R into the data-raw directory
# On linux use install unrar then `unrar e shp.rar `

# Read data
ken_schools <- sf::st_read(here("data-raw", "Schools.shp"))

ken_schools <- ken_schools %>%
  # Tidy column names
  janitor::clean_names() %>%
  # Change school_nam to a more intuitive spelling
  dplyr::rename(school_name = "school_nam") %>%
  # Tidy values as some text was in all caps and others in Titlecase
  dplyr::mutate(school_name = stringr::str_to_title(school_name),
                county = stringr::str_to_title(county),
                district = stringr::str_to_title(district),
                zone = stringr::str_to_title(zone),
                sub_county = stringr::str_to_title(sub_county),
                ward = stringr::str_to_title(ward)
  ) %>%
  # Tharaka-Nithi county occurs in two formats - either with or without the hyphen, standardised the name according to https://tharakanithi.go.ke/
  dplyr::mutate(county = dplyr::case_when(county == "Tharaka-Nithi" ~ "Tharaka Nithi",
                                          TRUE ~ as.character(county)))

# Write new data object
save(ken_schools, file = "data/ken_schools.rda")


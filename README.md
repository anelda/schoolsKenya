# schoolsKenya


R package that provides access to school location information from Kenya Ministry of Education.

The package was developed as part of a contribution made by the afrimapr project to the @WiGISKe #DataViz challenge
looking at teenage pregnancies since 2016.

## Data source

The data was obtained as SHP file from https://datacatalog.worldbank.org/dataset/kenya-schools on 26 July 2020.
The original data was provided to the World Bank Data Catalogue by the Ministry of Education of Kenya and was last updated in 2016.

_CAVEAT_: Upon closer inspection it appears as if there are also data from Open Data Kenya, 2007 in the SHP file. This data have counties such as Nairobi North, Nairobi East, and Nairobi South that complicates spatial data analysis with current county boundaries where there's only Nairobi County.

_Note:_ The json file provided at the same location appears to only have data for primary schools

## Data processing

- The .rar archive was downloaded from the link provided above.
- The .shp file was opened in R as follows:

  ``` 
  > library(sf)
  > ken_schools <- st_read("Schools.shp")
  ```
  
- Data was cleaned as follows:

  ```
  > library(tidyverse)
  > library(stringr)

  > ken_schools <- ken_schools %>% 
      # Tidy column names
      rename(status = "Status",
         level = "LEVEL",
         objectid = "OBJECTID",
         county = "County",
         code = "CODE",
         school_name = "SCHOOL_NAM",
         district = "DISTRICT",
         zone = "ZONE",
         sub_county = "SUB_COUNTY",
         ward = "Ward",
         longitude = "X_Coord",
         latitude = "Y_Coord",
         source = "Source"
      ) %>% 
      # Tidy values as some text was in all caps and others in Titlecase
      mutate(school_name = str_to_title(school_name),
            county = str_to_title(county),
            district = str_to_title(district),
            zone = str_to_title(zone),
            sub_county = str_to_title(sub_county),
            ward = str_to_title(ward)
      ) %>%
      # Tharaka-Nithi county occurs in two formats - either with or without the hyphen, standardised the name
      mutate(county = case_when(county == "Tharaka Nithi" ~ "Tharaka-Nithi",
                            TRUE ~ as.character(county)))

    ```
  - Data was written to an R data file:
    
    ```
    > save(ken_schools, file = "data/ken_schools.rda")
    ```

## Installation

```
library(devtools)
install_github("anelda/schoolsKenya")

```

## Usage

```
> library(schoolsKenya)
> head(ken_schools)
  objectid code school_name   level status  county        district     zone      sub_county      ward longitude latitude                      source
1        1    1    Bakwanin Primary Public Baringo Baringo Central  Kabasis Baringo Central     Sacho  35.79708  0.40955 Ministry of Education, 2016
2        2    2     Bekibon Primary Public Baringo Baringo Central   Tenges   Baringo South   Marigat  35.88406  0.33640 Ministry of Education, 2016
3        3    3     Bokorin Primary Public Baringo Baringo Central Kabarnet Baringo Central Kapropita  35.77177  0.53218 Ministry of Education, 2016
4        4    4   Borowonin Primary Public Baringo Baringo Central Kabarnet Baringo Central Kapropita  35.77864  0.44487 Ministry of Education, 2016
5        5    5       Bosin Primary Public Baringo Baringo Central  Kabasis Baringo Central     Sacho  35.79545  0.43809 Ministry of Education, 2016
6        6    6      Buiwon Primary Public Baringo Baringo Central   Tenges   Baringo South   Marigat  35.90716  0.36680 Ministry of Education, 2016
              geometry
1 143417.2, 10045338.9
2 153107.7, 10037237.7
3 140602.8, 10058916.0
4 141363.8, 10049249.9
5 143236.9, 10048498.5
6     155683, 10040602
> 

```

# schoolsKenya

[![License: CC0-1.0](https://img.shields.io/badge/License-CC0%201.0-lightgrey.svg)](http://creativecommons.org/publicdomain/zero/1.0/)


R package that provides access to school location information from Kenya Ministry of Education.

The package was developed as part of a contribution made by the afrimapr project to the [@WiGISKe #DataViz challenge](https://twitter.com/WiGISKe/status/1286553995159441409) looking at teenage pregnancies since 2016.

## Data source

The data was obtained as SHP file from https://datacatalog.worldbank.org/dataset/kenya-schools on 26 July 2020.
The original data was provided to the World Bank Data Catalogue by the Ministry of Education of Kenya and was last updated in 2016.

_CAVEAT_: Upon closer inspection it appears as if there are also data from Open Data Kenya, 2007 in the SHP file. This data have counties such as Nairobi North, Nairobi East, and Nairobi South that complicates spatial data analysis with current county boundaries where there's only Nairobi County.

_Note:_ The json file provided at the same location appears to only have data for primary schools

## Data processing

- The .rar archive was downloaded from the link provided above.
- Raw data (unrar-ed shp.rar) is available in [data-raw/](data-raw/).
- The data cleaning script is available in [data-raw/get_schools.R](data-raw/get_schools.R).

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

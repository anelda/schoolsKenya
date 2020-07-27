# schoolsKenya


R package that provides access to school location information from Kenya Ministry of Education.

The package was developed as part of a contribution made by the afrimapr project to the @WiGISKe #DataViz challenge
looking at teenage pregnancies since 2016.

## Data source

The data was obtained as JSON file from https://datacatalog.worldbank.org/dataset/kenya-schools on 26 July 2020.
The original data was provided to the World Bank Data Catalogue by the Ministry of Education of Kenya and was last updated in 2016.

## Installation

```
library(devtools)
install_github("anelda/schoolsKenya")

```

## Usage

```
> library(schoolsKenya)
> head(ken_schools)
  Status             geometry   LEVEL OBJECTID  County CODE SCHOOL_NAM        DISTRICT     ZONE      SUB_COUNTY      Ward  X_Coord Y_Coord
1 Public 143417.2, 10045338.9 Primary        1 Baringo    1   BAKWANIN BARINGO CENTRAL  KABASIS Baringo Central     Sacho 35.79708 0.40955
2 Public 153107.7, 10037237.7 Primary        2 Baringo    2    BEKIBON BARINGO CENTRAL   TENGES   Baringo South   Marigat 35.88406 0.33640
3 Public 140602.8, 10058916.0 Primary        3 Baringo    3    BOKORIN BARINGO CENTRAL KABARNET Baringo Central Kapropita 35.77177 0.53218
4 Public 141363.8, 10049249.9 Primary        4 Baringo    4  BOROWONIN BARINGO CENTRAL KABARNET Baringo Central Kapropita 35.77864 0.44487
5 Public 143236.9, 10048498.5 Primary        5 Baringo    5      BOSIN BARINGO CENTRAL  KABASIS Baringo Central     Sacho 35.79545 0.43809
6 Public     155683, 10040602 Primary        6 Baringo    6     BUIWON BARINGO CENTRAL   TENGES   Baringo South   Marigat 35.90716 0.36680
                       Source
1 Ministry of Education, 2016
2 Ministry of Education, 2016
3 Ministry of Education, 2016
4 Ministry of Education, 2016
5 Ministry of Education, 2016
6 Ministry of Education, 2016
> 

```
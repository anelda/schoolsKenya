#' Primary and Secondary Schools in Kenya
#'
#' A dataset obtained from the World Bank data catalogue containing
#' location information for about 39,000 primary and secondary schools
#' in the private and public sector in Kenya
#'
#' @format An sf object with 37,930 observations and 14 variables:
#'\describe{
#'  \item{objectid}{A numerical value}
#'  \item{code}{A numerical value}
#'  \item{school_name}{The name of the school as character string}
#'  \item{level}{Factor with two levels - Primary and Secondary}
#'  \item{status}{Factor with two levels - Private and Public}
#'  \item{county}{County name as character string}
#'  \item{district}{District name as character string}
#'  \item{zone}{Zone name as character string}
#'  \item{sub_county}{Sub county name as character string}
#'  \item{ward}{Ward name as character string}
#'  \item{x_coord}{Longitude coordinates as numerical value}
#'  \item{y_coord}{Latitude coordinates as numerical value}
#'  \item{source}{Data source as factor with two levels - Ministry of Education, 2016 and Open Data Kenya, 2007}
#'  \item{geometry}{sfc_POINT of length 37,930}
#'}
#'@source \url{https://datacatalog.worldbank.org/dataset/kenya-schools}
"ken_schools"

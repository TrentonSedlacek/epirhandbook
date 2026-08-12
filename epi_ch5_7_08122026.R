# Chapter 5


##########################################
# List of useful epidemiology R packages #
##########################################

# This script uses the p_load() function from pacman R package, 
# which installs if package is absent, and loads for use if already installed


# Ensures the package "pacman" is installed
if (!require("pacman")) install.packages("pacman")


# Packages available from CRAN
##############################
pacman::p_load(
     
     # learning R
     ############
     learnr,   # interactive tutorials in RStudio Tutorial pane
     swirl,    # interactive tutorials in R console
        
     # project and file management
     #############################
     here,     # file paths relative to R project root folder
     rio,      # import/export of many types of data
     openxlsx, # import/export of multi-sheet Excel workbooks 
     
     # package install and management
     ################################
     pacman,   # package install/load
     renv,     # managing versions of packages when working in collaborative groups
     remotes,  # install from github
     
     # General data management
     #########################
     tidyverse,    # includes many packages for tidy data wrangling and presentation
          #dplyr,      # data management
          #tidyr,      # data management
          #ggplot2,    # data visualization
          #stringr,    # work with strings and characters
          #forcats,    # work with factors 
          #lubridate,  # work with dates
          #purrr       # iteration and working with lists
     linelist,     # cleaning linelists
     naniar,       # assessing missing data
     
     # statistics  
     ############
     janitor,      # tables and data cleaning
     gtsummary,    # making descriptive and statistical tables
     rstatix,      # quickly run statistical tests and summaries
     broom,        # tidy up results from regressions
     lmtest,       # likelihood-ratio tests
     easystats,
          # parameters, # alternative to tidy up results from regressions
          # see,        # alternative to visualise forest plots 
     
     # epidemic modeling
     ###################
     epicontacts,  # Analysing transmission networks
     EpiNow2,      # Rt estimation
     EpiEstim,     # Rt estimation
     projections,  # Incidence projections
     incidence2,   # Make epicurves and handle incidence data
     i2extras,     # Extra functions for the incidence2 package
     epitrix,      # Useful epi functions
     distcrete,    # Discrete delay distributions
     
     
     # plots - general
     #################
     #ggplot2,         # included in tidyverse
     cowplot,          # combining plots  
     # patchwork,      # combining plots (alternative)     
     RColorBrewer,     # color scales
     ggnewscale,       # to add additional layers of color schemes

     
     # plots - specific types
     ########################
     DiagrammeR,       # diagrams using DOT language
     incidence2,       # epidemic curves
     gghighlight,      # highlight a subset
     ggrepel,          # smart labels
     plotly,           # interactive graphics
     gganimate,        # animated graphics 

     
     # gis
     ######
     sf,               # to manage spatial data using a Simple Feature format
     tmap,             # to produce simple maps, works for both interactive and static maps
     OpenStreetMap,    # to add OSM basemap in ggplot map
     spdep,            # spatial statistics 
     
     # routine reports
     #################
     rmarkdown,        # produce PDFs, Word Documents, Powerpoints, and HTML files
     reportfactory,    # auto-organization of R Markdown outputs
     officer,          # powerpoints
     
     # dashboards
     ############
     flexdashboard,    # convert an R Markdown script into a dashboard
     shiny,            # interactive web apps
     
     # tables for presentation
     #########################
     knitr,            # R Markdown report generation and html tables
     flextable,        # HTML tables
     #DT,              # HTML tables (alternative)
     #gt,              # HTML tables (alternative)
     #huxtable,        # HTML tables (alternative) 
     
     # phylogenetics
     ###############
     ggtree,           # visualization and annotation of trees
     ape,              # analysis of phylogenetics and evolution
     treeio            # to visualize phylogenetic files
 
)


# # Packages to download from Github (not available on CRAN)
# ##########################################################
#
# # Development version of epicontacts (for transmission chains with a time x-axis)
# pacman::p_install_gh("reconhub/epicontacts@timeline")
#
# # The package for this handbook, which includes all the example data  
# pacman::p_install_gh("appliedepi/epirhandbook")
#
#
#



# Chapter 6

# linelist <- import(here("data", "linelist_raw.xlsx"))

# export(linelist, here("data","clean", "my_linelist.rds"))

# ggsave(here("outputs", "epicurves", "epicurve_2021-02-15.png"))



# Chapter 7

pacman::p_load(
  rio,            # import/export
  here,           # file pathways
  tidyverse)      # data management, summary, and visualization

# linelist <- import(here("data", "linelists", "ebola_linelist.xlsx"))

# linelist <- import(here("data", "linelists", "ebola_linelist.xlsx"))

# linelist <- import("C:/Users/Laura/Documents/analysis/data/linelists/ebola_linelist.xlsx")

# # Manual selection of a file. When this command is run, a POP-UP window will appear. 
# # The file path selected will be supplied to the import() command.
#
# my_data <- import(file.choose())

# linelist <- import("linelist_cleaned.csv")

# linelist <- import(here("data", "linelists", "linelist_cleaned.xlsx"))

# linelist <- import("C:/Users/Laura/Documents/tuberculosis/data/linelists/linelist_cleaned.rds")

# my_data <- import("my_excel_file.xlsx", which = "Sheetname")

# # Demonstration: importing a specific Excel sheet when using relative pathways with the 'here' package
# linelist_raw <- import(here("data", "linelist.xlsx"), which = "Sheet1")`  

# linelist <- import(here("data", "my_linelist.xlsx"), na = "99")

# linelist <- import(here("data", "my_linelist.csv"), na = c("Missing", "", " "))

# linelist_raw <- import("linelist_raw.xlsx", skip = 1)  # does not import header row

# HIDDEN FROM READER
####################
# Create second header row of "data dictionary" and insert into row 2. Save as new dataframe.
linelist_2headers <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds") %>%  # FIX: swapped their local file for the github copy
        mutate(across(everything(), as.character)) %>% 
        add_row(.before = 1,
                #row_num = "000",
                case_id = "case identification number assigned by MOH",
                generation = "transmission chain generation number",
                date_infection = "estimated date of infection, mm/dd/yyyy",
                date_onset = "date of symptom onset, YYYY-MM-DD",
                date_hospitalisation = "date of initial hospitalization, mm/dd/yyyy",
                date_outcome = "date of outcome status determination",
                outcome = "either 'Death' or 'Recovered' or 'Unknown'",
                gender = "either 'm' or 'f' or 'unknown'",
                hospital = "Name of hospital of first admission",
                lon = "longitude of residence, approx",
                lat = "latitude of residence, approx",
                infector = "case_id of infector",
                source = "context of known transmission event",
                age = "age number",
                age_unit = "age unit, either 'years' or 'months' or 'days'",
                fever = "presence of fever on admission, either 'yes' or 'no'",
                chills = "presence of chills on admission, either 'yes' or 'no'",
                cough = "presence of cough on admission, either 'yes' or 'no'",
                aches = "presence of aches on admission, either 'yes' or 'no'",
                vomit = "presence of vomiting on admission, either 'yes' or 'no'",
                time_admission = "time of hospital admission HH:MM")

# # import first time; store the column names
# linelist_raw_names <- import("linelist_raw.xlsx") %>% names()  # save true column names
#
# # import second time; skip row 2, and assign column names to argument col_names =
# linelist_raw <- import("linelist_raw.xlsx",
#                        skip = 2,
#                        col_names = linelist_raw_names
#                        ) 

# # import first time; sotre column names
# linelist_raw_names <- import("linelist_raw.csv") %>% names() # save true column names
#
# # note argument for csv files is 'col.names = '
# linelist_raw <- import("linelist_raw.csv",
#                        skip = 2,
#                        col.names = linelist_raw_names
#                        ) 

# # assign/overwrite headers using the base 'colnames()' function
# colnames(linelist_raw) <- linelist_raw_names

dict <- linelist_2headers %>%             # begin: linelist with dictionary as first row
  head(1) %>%                             # keep only column names and first dictionary row                
  pivot_longer(cols = everything(),       # pivot all columns to long format
               names_to = "Column",       # assign new column names
               values_to = "Description")

# names(my_data) <- paste(names(my_data), my_data[1, ], sep = "_")

# pacman::p_load("googlesheets4")

# Gsheets_demo <- read_sheet("https://docs.google.com/spreadsheets/d/1scgtzkVLLHAe5a6_eFQEwkZcc14yFUx1KgOMZ4AKUfY/edit#gid=0")

# Gsheets_demo <- read_sheet("1scgtzkVLLHAe5a6_eFQEwkZcc14yFUx1KgOMZ4AKUfY")

# create the dataset manually by row
manual_entry_rows <- tibble::tribble(
  ~colA, ~colB,
  "a",   1,
  "b",   2,
  "c",   3
  )

# define each vector (vertical column) separately, each with its own name
PatientID <- c(235, 452, 778, 111)
Treatment <- c("Yes", "No", "Yes", "Yes")
Death     <- c(1, 0, 1, 0)

# combine the columns into a data frame, by referencing the vector names
manual_entry_cols <- data.frame(PatientID, Treatment, Death)

# linelist <- clipr::read_clip_tbl()  # imports current clipboard as data frame
# linelist <- clipr::read_clip()      # imports as character vector

# df_from_clipboard <- read.table(
#   file = "clipboard",  # specify this as "clipboard"
#   sep = "t",           # separator could be tab, or commas, etc.
#   header=TRUE)         # if there is a header row

# FIX: not in the book. It assumes you already have these files, so grab them off github first
linelists_dir <- file.path(tempdir(), "linelists")
dir.create(linelists_dir, showWarnings = FALSE)
for (f in c("20201007linelist.csv",
            "case_linelist20201006.csv",
            "case_linelist_2020-10-02.csv",
            "case_linelist_2020-10-03.csv",
            "case_linelist_2020-10-04.csv",
            "case_linelist_2020-10-05.csv",
            "case_linelist_2020-10-08.xlsx")) {
  download.file(
    paste0("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/example/linelists/", f),
    file.path(linelists_dir, f), mode = "wb")
}

# FIX: swapped the book's folder path for the temp folder above
linelist_filenames <- dir(linelists_dir) # get file names from folder
linelist_filenames                                              # print

linelist_dates_raw <- stringr::str_extract(linelist_filenames, "[0-9].*[0-9]") # extract numbers and any characters in between
linelist_dates_raw  # print

linelist_dates_clean <- lubridate::ymd(linelist_dates_raw)
linelist_dates_clean

index_latest_file <- which.max(linelist_dates_clean)
index_latest_file

# load packages
pacman::p_load(
  tidyverse,         # data management
  stringr,           # work with strings/characters
  lubridate,         # work with dates
  rio,               # import / export
  here,              # relative file paths
  fs)                # directory interactions

# extract the file name of latest file
# FIX: same folder swap as above
latest_file <- dir(linelists_dir) %>%  # file names from "linelists" sub-folder          
  str_extract("[0-9].*[0-9]") %>%                  # pull out dates (numbers)
  ymd() %>%                                        # convert numbers to dates (assuming year-month-day format)
  which.max() %>%                                  # get index of max date (latest file)
  dir(linelists_dir)[[.]]              # return the filename of latest linelist

latest_file  # print name of latest file

# here("data", "example", "linelists", latest_file) 

# # import
# import(here("data", "example", "linelists", latest_file)) # import 

# latest_file <- dir_info(here("data", "example", "linelists")) %>%  # collect file info on all files in directory
#   arrange(desc(modification_time)) %>%      # sort by modification time
#   head(1) %>%                               # keep only the top (latest) file
#   pull(path) %>%                            # extract only the file path
#   import()                                  # import the file
#

# # load packages
# pacman::p_load(httr, jsonlite, tidyverse)

# # prepare the request
# path <- "http://api.ratings.food.gov.uk/Establishments"
# request <- GET(url = path,
#              query = list(
#                localAuthorityId = 188,
#                BusinessTypeId = 7844,
#                pageNumber = 1,
#                pageSize = 5000),
#              add_headers("x-api-version" = "2"))
#
# # check for any server error ("200" is good!)
# request$status_code
#
# # submit the request, parse the response, and convert to a data frame
# response <- content(request, as = "text", encoding = "UTF-8") %>%
#   fromJSON(flatten = TRUE) %>%
#   pluck("establishments") %>%
#   as_tibble()

# # set credentials for authorization
# url <- "https://godatasampleURL.int/"           # valid Go.Data instance url
# username <- "username"                          # valid Go.Data username 
# password <- "password"                          # valid Go,Data password 
# outbreak_id <- "xxxxxx-xxxx-xxxx-xxxx-xxxxxxx"  # valid Go.Data outbreak ID
#
# # get access token
# url_request <- paste0(url,"api/oauth/token?access_token=123") # define base URL request
#
# # prepare request
# response <- POST(
#   url = url_request,  
#   body = list(
#     username = username,    # use saved username/password from above to authorize                               
#     password = password),                                       
#     encode = "json")
#
# # execute request and parse response
# content <-
#   content(response, as = "text") %>%
#   fromJSON(flatten = TRUE) %>%          # flatten nested JSON
#   glimpse()
#
# # Save access token from response
# access_token <- content$access_token    # save access token to allow subsequent API calls below
#
# # import outbreak contacts
# # Use the access token 
# response_contacts <- GET(
#   paste0(url,"api/outbreaks/",outbreak_id,"/contacts"),          # GET request
#   add_headers(
#     Authorization = paste("Bearer", access_token, sep = " ")))
#
# json_contacts <- content(response_contacts, as = "text")         # convert to text JSON
#
# contacts <- as_tibble(fromJSON(json_contacts, flatten = TRUE))   # flatten JSON to tibble

# export(linelist, "my_linelist.xlsx") # will save to working directory

# export(linelist, here("data", "clean", "my_linelist.csv"))

# # export the linelist data frame to your system's clipboard
# clipr::write_clip(linelist)

# export(linelist, here("data", "clean", "my_linelist.rds"))

# rio::export(my_list, my_dataframe, my_vector, "my_objects.Rdata")

# rio::import_list("my_list.Rdata")

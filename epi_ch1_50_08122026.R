################################################################################
# The Epidemiologist R Handbook - all R code as a standalone script
# Chapters 1-50, in book order (https://www.epirhandbook.com/en/)
#
# How to use:
# - Code the handbook actually executes is active. Code the book only displays
#   (placeholder paths, install demos, intentional errors) is commented out.
# - Hidden data-loading code from the book's source files is included so each
#   chapter runs on its own; local file paths were switched to GitHub URLs
#   (marked "# FIX:"), so an internet connection is required.
# - Run the Chapter 5 p_load() block once first to install all packages.
# - Run interactively, chapter by chapter - chapters re-import their own data.
# - Chapters 24 (Epidemic modeling) and 28 (GIS basics) may not fully run;
#   see the NOTE at the top of each.
# - Chapters 1-3 taken from epi_ch1_3_07312026.R.
################################################################################

# Chapter 1

# linelist %>% 
#   group_by(hospital) %>%  # group rows by hospital
#   slice_max(date, n = 1, with_ties = F) # if there's a tie (of date), take the first row

# linelist %>% 
#   group_by(hospital) %>% # group rows by hospital
#   slice_max(
#     date,                # keep row per group with maximum date value 
#     n = 1,               # keep only the single highest row 
#     with_ties = F)       # if there's a tie (of date), take the first row

sessioninfo::session_info()

# Chapter 2

# # install the latest version of the Epi R Handbook package
# pacman::p_install_gh("appliedepi/epirhandbook")

# # load the package for use
# pacman::p_load(epirhandbook)

# # download the offline handbook to your computer
# download_book()

# # install the latest version of the Epi R Handbook package
# pacman::p_install_gh("appliedepi/epirhandbook")

# # load the package for use
# pacman::p_load(epirhandbook)

# # download all the example data into a folder on your computer
# get_data("all")
#
# # download only the linelist example data into a folder on your computer
# get_data(file = "linelist_cleaned.rds")
#

# # download a specific file into a folder on your computer
# get_data("linelist_cleaned.rds")

# pacman::p_load(rio) # install/load the rio package
#
# # import the file directly from Github
# cleaning_dict <- import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/cleaning_dict.csv")

# pacman::p_load(rio) # install/load the rio package
#
# # import the file directly from Github
# likert_data <- import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/likert_data.csv")

# ape::read.tree("Shigella_tree.txt")

# # install/load the rio package
# pacman::p_load(rio) 
#
# ##############
# # Country A
# ##############
# # import demographics for country A directly from Github
# A_demo <- import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/standardization/country_demographics.csv")
#
# # import deaths for country A directly from Github
# A_deaths <- import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/standardization/deaths_countryA.csv")
#
# ##############
# # Country B
# ##############
# # import demographics for country B directly from Github
# B_demo <- import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/standardization/country_demographics_2.csv")
#
# # import deaths for country B directly from Github
# B_deaths <- import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/standardization/deaths_countryB.csv")
#
#
# ###############
# # Reference Pop
# ###############
# # import demographics for country B directly from Github
# standard_pop_data <- import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/standardization/world_standard_population_by_sex.csv")

# Chapter 3

# import the cleaned ebola linelist
linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL
pacman::p_load(apyramid)

# install.packages('tinytex')
# tinytex::install_tinytex()
# # to uninstall TinyTeX, run tinytex::uninstall_tinytex()

sqrt(49)

# Print summary statistics of column 'age' in the dataset 'linelist'
summary(linelist$age)

## create an age group variable by specifying categorical breaks
linelist$age_group <- cut(linelist$age, breaks = c(0, 5, 10, 15, 20, 30, 45, 60))

# Create an age pyramid
age_pyramid(data = linelist, age_group = "age_cat5", split_by = "gender")

# Create an age pyramid
age_pyramid(
  data = linelist,        # use case linelist
  age_group = "age_cat5", # provide age group column
  split_by = "gender"     # use gender column for two sides of pyramid
  )

# # This command will produce the exact same graphic as above
# age_pyramid(linelist, "age_cat5", "gender")

age_pyramid(
  linelist,                    # use case linelist
  "age_cat5",                  # age group column
  "gender",                    # split by gender
  proportional = TRUE,         # percents instead of counts
  pal = c("orange", "purple")  # colors
  )

# my_function <- function( ARGUMENTS HERE ){ CODE HERE }

# staff_calc(daily_cases = 150)

# case_incidence <- tibble(
#   dates = seq.Date(from = as.Date("2020-05-01"), to = as.Date("2020-05-21"), by = 1),
#   projected_incidence = c(102,110,50,37,106,190,146,138,135,111,60,43,189,184,185,80,44,97,254,291,288),
#   staff_needed = staff_calc(projected_incidence)
# )
#
# ggplot(case_incidence, aes(x = dates))+
#   geom_line(aes(y = projected_incidence))+
#   geom_line(aes(y = staff_needed))

# Install (if necessary) and load packages for use
pacman::p_load(rio, tidyverse, here, janitor)  # FIX: janitor not installed

# # install a single package with base R
# install.packages("tidyverse")
#
# # install multiple packages with base R
# install.packages(c("tidyverse", "rio", "here"))

# # load packages for use, with base R
# library(tidyverse)
# library(rio)
# library(here)

# # install/load the epicontacts package from its Github repository
# p_load_gh("reconhub/epicontacts")

# # install the "timeline" branch of the epicontacts package from Github
# p_load_gh("reconhub/epicontacts@timeline")

# packageurl <- "https://cran.r-project.org/src/contrib/Archive/dsr/dsr_0.2.2.tar.gz"
# install.packages(packageurl, repos=NULL, type="source")

# remotes::install_local("~/Downloads/dplyr-master.zip")

# install.packages("~/Downloads/dplyr-master.zip", repos=NULL, type="source")

# # This command uses the package "rio" and its function "import()" to import a dataset
# linelist <- rio::import("linelist.xlsx", which = "Sheet1")

# detach(package:PACKAGE_NAME_HERE, unload=TRUE)

# # A comment can be on a line by itself
# # import data
# linelist <- import("linelist_raw.xlsx") %>%   # a comment can also come after code
# # filter(age > 50)                          # It can also be used to deactivate / remove a line of code
#   count()
#

# setwd("C:/Documents/R Files/My analysis")

# knitr::opts_knit$set(root.dir = 'desired/directorypath')

# # Import csv linelist from the data/linelist/clean/ sub-folders of an R project
# linelist <- import(here("data", "clean", "linelists", "marin_country.csv"))

current_week <- "2018-W10"   # this command creates the object current_week by assigning it a value
current_week                 # this command prints the current value of current_week object in the console

current_week <- "2018-W51"   # assigns a NEW value to the object current_week
current_week                 # prints the current value of current_week in the console

# # linelist is created and assigned the value of the imported CSV file
# linelist <- import("my_linelist.csv")

# printed to R console only
table(linelist$gender, linelist$outcome)

# save
gen_out_table <- table(linelist$gender, linelist$outcome)

# print
gen_out_table

# # create new "bmi" column using base R syntax
# linelist$bmi <- linelist$wt_kg / (linelist$ht_cm/100)^2

# # create new "bmi" column using dplyr syntax
# linelist <- linelist %>% 
#   mutate(bmi = wt_kg / (ht_cm/100)^2)

class(linelist)         # class should be a data frame or tibble

class(linelist$age)     # class should be numeric

class(linelist$gender)  # class should be character

num_vector <- c(1,2,3,4,5) # define vector as all numbers
class(num_vector)          # vector is numeric class
num_vector[3] <- "three"   # convert the third element to a character
class(num_vector)          # vector is now character class

# define the stand-alone vector of character values
explanatory_vars <- c("gender", "fever", "chills", "cough", "aches", "vomit")

# print the values in this named vector
explanatory_vars

# # Retrieve the length of the vector age_years
# length(linelist$age) # (age is a column in the linelist data frame)
#

my_vector <- c("a", "b", "c", "d", "e", "f")  # define the vector
my_vector[5]                                  # print the 5th element

# All of the summary
summary(linelist$age)

# Just the second element of the summary, with name (using only single brackets)
summary(linelist$age)[2]

# Just the second element, without name (using double brackets)
summary(linelist$age)[[2]]

# Extract an element by name, without showing the name
summary(linelist$age)[["Median"]]


# # View a specific row (2) from dataset, with all columns (don't forget the comma!)
# linelist[2,]
#
# # View all rows, but just one column
# linelist[, "date_onset"]
#
# # View values from row 2 and columns 5 through 10
# linelist[2, 5:10] 
#
# # View values from row 2 and columns 5 through 10 and 18
# linelist[2, c(5:10, 18)] 
#
# # View rows 2 through 20, and specific columns
# linelist[2:20, c("date_onset", "outcome", "age")]
#
# # View rows and columns based on criteria
# # *** Note the dataframe must still be named in the criteria!
# linelist[linelist$age > 25 , c("date_onset", "outcome", "age")]
#
# # Use View() to see the outputs in the RStudio Viewer pane (easier to read) 
# # *** Note the capital "V" in View() function
# View(linelist[2:20, "date_onset"])
#
# # Save as a new object
# new_table <- linelist[2:20, c("date_onset")] 

# # View first 100 rows
# linelist %>% head(100)
#
# # Show row 5 only
# linelist %>% filter(row_number() == 5)
#
# # View rows 2 through 20, and three specific columns (note no quotes necessary on column names)
# linelist %>% filter(row_number() %in% 2:20) %>% select(date_onset, outcome, age)

# define demo list
my_list <- list(
  # First element in the list is a character vector
  hospitals = c("Central", "Empire", "Santa Anna"),
  
  # second element in the list is a data frame of addresses
  addresses   = data.frame(
    street = c("145 Medical Way", "1048 Brown Ave", "999 El Camino"),
    city   = c("Andover", "Hamilton", "El Paso")
    )
  )

my_list

my_list[1] # this returns the element in class "list" - the element name is still displayed

my_list[[1]] # this returns only the (unnamed) character vector

my_list[["hospitals"]] # you can also index by name of the list element

my_list[[1]][3] # this returns the third element of the "hospitals" character vector

my_list[[2]][1] # This returns the first column ("street") of the address data frame


# rm(object_name)

# rm(list = ls(all = TRUE))

# # A fake example of how to bake a cake using piping syntax
#
# cake <- flour %>%       # to define cake, start with flour, and then...
#   add(eggs) %>%   # add eggs
#   add(oil) %>%    # add oil
#   add(water) %>%  # add water
#   mix_together(         # mix together
#     utensil = spoon,
#     minutes = 2) %>%    
#   bake(degrees = 350,   # bake
#        system = "fahrenheit",
#        minutes = 35) %>%  
#   let_cool()            # let it cool down

# # Create or overwrite object, defining as aggregate counts by age category (not printed)
# linelist_summary <- linelist %>% 
#   count(age_cat)

# Print the table of counts in the console, but don't save it
linelist %>% 
  count(age_cat)

# linelist <- linelist %>%
#   filter(age > 50)
#
# linelist %<>% filter(age > 50)

# # a fake example of how to bake a cake using this method (defining intermediate objects)
# batter_1 <- left_join(flour, eggs)
# batter_2 <- left_join(batter_1, oil)
# batter_3 <- left_join(batter_2, water)
#
# batter_4 <- mix_together(object = batter_3, utensil = spoon, minutes = 2)
#
# cake <- bake(batter_4, degrees = 350, system = "fahrenheit", minutes = 35)
#
# cake <- let_cool(cake)

# # an example of combining/nesting mutliple functions together - difficult to read
# cake <- let_cool(bake(mix_together(batter_3, utensil = spoon, minutes = 2), degrees = 350, system = "fahrenheit", minutes = 35))

# linelist <- linelist %>% 
#   mutate(age_months = age_years * 12)

# linelist %<>% mutate(age_months = age_years * 12)

# linelist_cleaned <- linelist %>%
#   mutate(case_def = case_when(
#     is.na(rdt_result) & is.na(other_case_in_home)            ~ NA_character_,
#     rdt_result == "Positive"                                 ~ "Confirmed",
#     rdt_result != "Positive" & other_cases_in_home == "Yes"  ~ "Probable",
#     TRUE                                                     ~ "Suspected"
#   ))

rdt_result <- c("Positive", "Suspected", "Positive", NA)   # two positive cases, one suspected, and one unknown
is.na(rdt_result)  # Tests whether the value of rdt_result is NA

# # turn off scientific notation
# options(scipen=999)

# use the appropriate rounding function for your work
round(c(2.5, 3.5))

janitor::round_half_up(c(2.5, 3.5))

# If supplying raw numbers to a function, wrap them in c()
mean(1, 6, 12, 10, 5, 0)    # !!! INCORRECT !!!  

mean(c(1, 6, 12, 10, 5, 0)) # CORRECT

my_vector <- c("a", "b", "c", "d")

"a" %in% my_vector
"h" %in% my_vector

# to negate, put an exclamation in front
!"a" %in% my_vector
!"h" %in% my_vector

# affirmative <- c("1", "Yes", "YES", "yes", "y", "Y", "oui", "Oui", "Si")
#
# linelist <- linelist %>% 
#   mutate(child_hospitaled = case_when(
#     hospitalized %in% affirmative & age < 18 ~ "Hospitalized Child",
#     TRUE                                      ~ "Not"))

affirmative <- c("1", "Yes", "YES", "yes", "y", "Y", "oui", "Oui", "Si")
affirmative

# condense to 
affirmative_str_search <- paste0(affirmative, collapse = "|")  # option with base R
affirmative_str_search <- str_c(affirmative, collapse = "|")   # option with stringr package

affirmative_str_search


# Chapter 4 - Transition to R

# import the linelist into R
linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL



# Chapter 5 - Suggested packages

# FIX: uncommented so the packages install (book only displays this)

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



# Chapter 6 - R projects

# linelist <- import(here("data", "linelist_raw.xlsx"))

# export(linelist, here("data","clean", "my_linelist.rds"))

# ggsave(here("outputs", "epicurves", "epicurve_2021-02-15.png"))



# Chapter 7 - Import and export

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
linelist_2headers <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds") %>%  # FIX: local file -> URL
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

# FIX: not in book, downloads the example files used below
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

# FIX: here("data", "example", "linelists") -> linelists_dir
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
# FIX: here("data", "example", "linelists") -> linelists_dir
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



# Chapter 8 - Cleaning data and core functions

pacman::p_load(
  rio,        # importing data  
  here,       # relative file pathways  
  janitor,    # data cleaning and tables
  lubridate,  # working with dates
  matchmaker, # dictionary-based cleaning
  epikit,     # age_categories() function
  tidyverse   # data management and visualization
)

# HIDDEN FROM READER
# actually load the data using here()
linelist_raw <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_raw.xlsx")  # FIX: local file -> URL

# linelist_raw <- import("linelist_raw.xlsx")

# skimr::skim(linelist_raw)

skimr::skim_without_charts(linelist_raw)

names(linelist_raw)

# pipe the raw dataset through the function clean_names(), assign result as "linelist"  
linelist <- linelist_raw %>% 
  janitor::clean_names()

# see the new column names
names(linelist)

# CLEANING 'PIPE' CHAIN (starts with raw data and pipes it through cleaning steps)
##################################################################################
linelist <- linelist_raw %>%
    
    # standardize column name syntax
    janitor::clean_names() %>% 
    
    # manually re-name columns
           # NEW name             # OLD name
    rename(date_infection       = infection_date,
           date_hospitalisation = hosp_date,
           date_outcome         = date_of_outcome)

names(linelist)

# rename(newNameForFirstColumn  = 1,
#        newNameForSecondColumn = 2)

# linelist_raw %>% 
#   select(# NEW name             # OLD name
#          date_infection       = `infection date`,    # rename and KEEP ONLY these columns
#          date_hospitalisation = `hosp date`)

# linelist_raw <- openxlsx::readWorkbook("linelist_raw.xlsx", fillMergedCells = TRUE)

names(linelist)

# linelist dataset is piped through select() command, and names() prints just the column names
linelist %>% 
  select(case_id, date_onset, date_hospitalisation, fever) %>% 
  names()  # display the column names

# move date_onset and date_hospitalisation to beginning
linelist %>% 
  select(date_onset, date_hospitalisation, everything()) %>% 
  names()

# select columns that are class Numeric
linelist %>% 
  select(where(is.numeric)) %>% 
  names()

# select columns containing certain characters
linelist %>% 
  select(contains("date")) %>% 
  names()

# searched for multiple character matches
linelist %>% 
  select(matches("onset|hosp|fev")) %>%   # note the OR symbol "|"
  names()

linelist %>% 
  select(any_of(c("date_onset", "village_origin", "village_detection", "village_residence", "village_travel"))) %>% 
  names()

linelist %>% 
  select(-c(date_onset, fever:vomit)) %>% # remove date_onset and all columns from fever to vomit
  names()

# linelist$date_onset <- NULL   # deletes column with base R syntax 

# Create a new linelist with id and age-related columns
linelist_age <- select(linelist, case_id, contains("age"))

# display the column names
names(linelist_age)

# CLEANING 'PIPE' CHAIN (starts with raw data and pipes it through cleaning steps)
##################################################################################

# begin cleaning pipe chain
###########################
linelist <- linelist_raw %>%
    
    # standardize column name syntax
    janitor::clean_names() %>% 
    
    # manually re-name columns
           # NEW name             # OLD name
    rename(date_infection       = infection_date,
           date_hospitalisation = hosp_date,
           date_outcome         = date_of_outcome) %>% 
    
    # ABOVE ARE UPSTREAM CLEANING STEPS ALREADY DISCUSSED
    #####################################################

    # remove column
    select(-c(row_num, merged_header, x28))

linelist <- linelist %>% 
  distinct()

# CLEANING 'PIPE' CHAIN (starts with raw data and pipes it through cleaning steps)
##################################################################################

# begin cleaning pipe chain
###########################
linelist <- linelist_raw %>%
    
    # standardize column name syntax
    janitor::clean_names() %>% 
    
    # manually re-name columns
           # NEW name             # OLD name
    rename(date_infection       = infection_date,
           date_hospitalisation = hosp_date,
           date_outcome         = date_of_outcome) %>% 
    
    # remove column
    select(-c(row_num, merged_header, x28)) %>% 
  
    # ABOVE ARE UPSTREAM CLEANING STEPS ALREADY DISCUSSED
    #####################################################
    
    # de-duplicate
    distinct()

# linelist <- linelist %>% 
#   mutate(new_col = 10)

linelist <- linelist %>% 
  mutate(bmi = wt_kg / (ht_cm/100)^2)

new_col_demo <- linelist %>%                       
  mutate(
    new_var_dup    = case_id,             # new column = duplicate/copy another existing column
    new_var_static = 7,                   # new column = all values the same
    new_var_static = new_var_static + 5,  # you can overwrite a column, and it can be a calculation using other variables
    new_var_paste  = stringr::str_glue("{hospital} on ({date_hospitalisation})") # new column = pasting together values from other columns
    ) %>% 
  select(case_id, hospital, date_hospitalisation, contains("new"))        # show only new columns, for demonstration purposes

# # HIDDEN FROM READER
# # removes new demo columns created above
# # linelist <- linelist %>% 
# #   select(-contains("new_var"))

class(linelist$age)

class(linelist$date_onset)

# linelist <- linelist %>% 
#   mutate(age = as.numeric(age))

# # age normalized to mean of ALL rows
# linelist %>% 
#   mutate(age_norm = age / mean(age, na.rm=T))
#
# # age normalized to mean of hospital group
# linelist %>% 
#   group_by(hospital) %>% 
#   mutate(age_norm = age / mean(age, na.rm=T))

# linelist <- linelist %>% 
#   mutate(across(.cols = c(temp, ht_cm, wt_kg), .fns = as.character))

# #to change all columns to character class
# linelist <- linelist %>% 
#   mutate(across(.cols = everything(), .fns = as.character))

# #to change all columns to character class
# linelist <- linelist %>% 
#   mutate(across(.cols = contains("date"), .fns = as.character))

# linelist <- linelist %>% 
#   mutate(across(.cols = where(is.POSIXct), .fns = as.Date))

village_detection <- c("a", "b", NA,  NA)
village_residence <- c("a", "c", "a", "d")

village <- coalesce(village_detection, village_residence)
village    # print

# linelist <- linelist %>% 
#   mutate(village = coalesce(village_detection, village_residence))

sum(c(2,4,15,10))     # returns only one number
cumsum(c(2,4,15,10))  # returns the cumulative sum at each step

cumulative_case_counts <- linelist %>%  # begin with case linelist
  count(date_onset) %>%                 # count of rows per day, as column 'n'   
  mutate(cumulative_cases = cumsum(n))  # new column, of the cumulative sum at each row

head(cumulative_case_counts, 10)

# linelist$bmi = linelist$wt_kg / (linelist$ht_cm / 100) ^ 2)

# CLEANING 'PIPE' CHAIN (starts with raw data and pipes it through cleaning steps)
##################################################################################

# begin cleaning pipe chain
###########################
linelist <- linelist_raw %>%
    
    # standardize column name syntax
    janitor::clean_names() %>% 
    
    # manually re-name columns
           # NEW name             # OLD name
    rename(date_infection       = infection_date,
           date_hospitalisation = hosp_date,
           date_outcome         = date_of_outcome) %>% 
    
    # remove column
    select(-c(row_num, merged_header, x28)) %>% 
  
    # de-duplicate
    distinct() %>% 
  
    # ABOVE ARE UPSTREAM CLEANING STEPS ALREADY DISCUSSED
    ###################################################
    # add new column
    mutate(bmi = wt_kg / (ht_cm/100)^2) %>% 
  
    # convert class of columns
    mutate(across(contains("date"), as.Date), 
           generation = as.numeric(generation),
           age        = as.numeric(age)) 

# # fix incorrect values                   # old value       # new value
# linelist <- linelist %>% 
#   mutate(date_onset = recode(date_onset, "2014-14-15" = "2014-04-15"))

table(linelist$hospital, useNA = "always")  # print table of all unique values, including missing  

linelist <- linelist %>% 
  mutate(hospital = recode(hospital,
                     # for reference: OLD = NEW
                      "Mitylira Hopital"  = "Military Hospital",
                      "Mitylira Hospital" = "Military Hospital",
                      "Military Hopital"  = "Military Hospital",
                      "Port Hopital"      = "Port Hospital",
                      "Central Hopital"   = "Central Hospital",
                      "other"             = "Other",
                      "St. Marks Maternity Hopital (SMMH)" = "St. Mark's Maternity Hospital (SMMH)"
                      ))

table(linelist$hospital, useNA = "always")

# # Example: change gender of one specific observation to "Female" 
# linelist <- linelist %>% 
#   mutate(gender = replace(gender, case_id == "2195", "Female"))

# linelist$gender[linelist$case_id == "2195"] <- "Female"

# linelist <- linelist %>% 
#   mutate(source_known = ifelse(!is.na(source), "known", "unknown"))

# # Create a date of death column, which is NA if patient has not died.
# linelist <- linelist %>% 
#   mutate(date_death = if_else(outcome == "Death", date_outcome, NA_real_))

linelist <- linelist %>% 
  mutate(age_years = case_when(
       age_unit == "years"  ~ age,       # if age unit is years
       age_unit == "months" ~ age/12,    # if age unit is months, divide age by 12
       is.na(age_unit)      ~ age))      # if age unit is missing, assume years
                                         # any other circumstance, assign NA (missing)

# linelist <- linelist %>% 
#      mutate(case_status = case_when(
#
#           # if patient had lab test and it is positive,
#           # then they are marked as a confirmed case 
#           ct_blood < 20                   ~ "Confirmed",
#
#           # given that a patient does not have a positive lab result,
#           # if patient has a "source" (epidemiological link) AND has fever, 
#           # then they are marked as a suspect case
#           !is.na(source) & fever == "yes" ~ "Suspect",
#
#           # any other patient not addressed above 
#           # is marked for follow up
#           TRUE                            ~ "To investigate"))

linelist <- linelist %>% 
  mutate(hospital = replace_na(hospital, "Missing"))

# linelist %>% 
#   mutate(hospital = fct_na_value_to_level(hospital, level = "(Missing)"))

linelist <- linelist %>% 
  mutate(hospital = na_if(hospital, "Missing"))

# # Convert temperatures above 40 to NA 
# linelist <- linelist %>% 
#   mutate(temp = replace(temp, temp > 40, NA))
#
# # Convert onset dates earlier than 1 Jan 2000 to missing
# linelist <- linelist %>% 
#   mutate(date_onset = replace(date_onset, date_onset > as.Date("2000-01-01"), NA))

cleaning_dict <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/cleaning_dict.csv")  # FIX: local file -> URL

# cleaning_dict <- import("cleaning_dict.csv")

linelist <- linelist %>%     # provide or pipe your dataset
     matchmaker::match_df(
          dictionary = cleaning_dict,  # name of your dictionary
          from = "from",               # column with values to be replaced (default is col 1)
          to = "to",                   # column with final values (default is col 2)
          by = "col"                   # column with column names (default is col 3)
  )

# CLEANING 'PIPE' CHAIN (starts with raw data and pipes it through cleaning steps)
##################################################################################

# begin cleaning pipe chain
###########################
linelist <- linelist_raw %>%
    
    # standardize column name syntax
    janitor::clean_names() %>% 
    
    # manually re-name columns
           # NEW name             # OLD name
    rename(date_infection       = infection_date,
           date_hospitalisation = hosp_date,
           date_outcome         = date_of_outcome) %>% 
    
    # remove column
    select(-c(row_num, merged_header, x28)) %>% 
  
    # de-duplicate
    distinct() %>% 
  
    # add column
    mutate(bmi = wt_kg / (ht_cm/100)^2) %>%     

    # convert class of columns
    mutate(across(contains("date"), as.Date), 
           generation = as.numeric(generation),
           age        = as.numeric(age)) %>% 
    
    # add column: delay to hospitalisation
    mutate(days_onset_hosp = as.numeric(date_hospitalisation - date_onset)) %>% 
    
   # ABOVE ARE UPSTREAM CLEANING STEPS ALREADY DISCUSSED
   ###################################################

    # clean values of hospital column
    mutate(hospital = recode(hospital,
                      # OLD = NEW
                      "Mitylira Hopital"  = "Military Hospital",
                      "Mitylira Hospital" = "Military Hospital",
                      "Military Hopital"  = "Military Hospital",
                      "Port Hopital"      = "Port Hospital",
                      "Central Hopital"   = "Central Hospital",
                      "other"             = "Other",
                      "St. Marks Maternity Hopital (SMMH)" = "St. Mark's Maternity Hospital (SMMH)"
                      )) %>% 
    
    mutate(hospital = replace_na(hospital, "Missing")) %>% 

    # create age_years column (from age and age_unit)
    mutate(age_years = case_when(
          age_unit == "years" ~ age,
          age_unit == "months" ~ age/12,
          is.na(age_unit) ~ age,
          TRUE ~ NA_real_))

#check the class of the linelist variable age
class(linelist$age_years)

# examine the distribution
hist(linelist$age_years)

summary(linelist$age_years, na.rm=T)

# Simple example
################
pacman::p_load(epikit)                    # load package

linelist <- linelist %>% 
  mutate(
    age_cat = age_categories(             # create new column
      age_years,                            # numeric column to make groups from
      breakers = c(0, 5, 10, 15, 20,        # break points
                   30, 40, 50, 60, 70)))

# show table
table(linelist$age_cat, useNA = "always")

# Include upper ends for the same categories
############################################
linelist <- linelist %>% 
  mutate(
    age_cat = age_categories(
      age_years, 
      breakers = c(0, 6, 11, 16, 21, 31, 41, 51, 61, 71)))

# show table
table(linelist$age_cat, useNA = "always")

# With ceiling set to TRUE
##########################
linelist <- linelist %>% 
  mutate(
    age_cat = age_categories(
      age_years, 
      breakers = c(0, 5, 10, 15, 20, 30, 40, 50, 60, 70),
      ceiling = TRUE)) # 70 is ceiling, all above become NA

# show table
table(linelist$age_cat, useNA = "always")

linelist <- linelist %>% 
  mutate(
    age_cat = age_categories(
      age_years, 
      lower = 0,
      upper = 100,
      by = 10))

# show table
table(linelist$age_cat, useNA = "always")

# Create new variable, by cutting the numeric age variable
# lower break is excluded but upper break is included in each category
linelist <- linelist %>% 
  mutate(
    age_cat = cut(
      age_years,
      breaks = c(0, 5, 10, 15, 20,
                 30, 50, 70, 100),
      include.lowest = TRUE         # include 0 in lowest group
      ))

# tabulate the number of observations per group
table(linelist$age_cat, useNA = "always")

# Cross tabulation of the numeric and category columns. 
table("Numeric Values" = linelist$age_years,   # names specified in table for clarity.
      "Categories"     = linelist$age_cat,
      useNA = "always")                        # don't forget to examine NA values

linelist <- linelist %>% 
  
  # cut() creates age_cat, automatically of class Factor      
  mutate(age_cat = cut(
    age_years,
    breaks = c(0, 5, 10, 15, 20, 30, 50, 70, 100),          
    right = FALSE,
    include.lowest = TRUE,        
    labels = c("0-4", "5-9", "10-14", "15-19", "20-29", "30-49", "50-69", "70-100")),
         
    # make missing values explicit
    age_cat = fct_na_value_to_level(
      age_cat,
      level = "Missing age")  # you can specify the label
  )    

# table to view counts
table(linelist$age_cat, useNA = "always")

# # Make break points from 0 to 90 by 5
# age_seq = seq(from = 0, to = 90, by = 5)
# age_seq
#
# # Make labels for the above categories, assuming default cut() settings
# age_labels = paste0(age_seq + 1, "-", age_seq + 5)
# age_labels
#
# # check that both vectors are the same length
# length(age_seq) == length(age_labels)

quantile(linelist$age_years,               # specify numeric vector to work on
  probs = c(0, .25, .50, .75, .90, .95),   # specify the percentiles you want
  na.rm = TRUE)                            # ignore missing values 

linelist %>%                                # begin with linelist
  mutate(deciles = cut(age_years,           # create new column decile as cut() on column age_years
    breaks = quantile(                      # define cut breaks using quantile()
      age_years,                               # operate on age_years
      probs = seq(0, 1, by = 0.1),             # 0.0 to 1.0 by 0.1
      na.rm = TRUE),                           # ignore missing values
    include.lowest = TRUE)) %>%             # for cut() include age 0
  janitor::tabyl(deciles)                   # pipe to table to display

# make groups with ntile()
ntile_data <- linelist %>% 
  mutate(even_groups = ntile(age_years, 10))

# make table of counts and proportions by group
ntile_table <- ntile_data %>% 
  janitor::tabyl(even_groups)
  
# attach min/max values to demonstrate ranges
ntile_ranges <- ntile_data %>% 
  group_by(even_groups) %>% 
  summarise(
    min = min(age_years, na.rm=T),
    max = max(age_years, na.rm=T)
  )

# combine and print - note that values are present in multiple groups
left_join(ntile_table, ntile_ranges, by = "even_groups")

# CLEANING 'PIPE' CHAIN (starts with raw data and pipes it through cleaning steps)
##################################################################################

# begin cleaning pipe chain
###########################
linelist <- linelist_raw %>%
    
    # standardize column name syntax
    janitor::clean_names() %>% 
    
    # manually re-name columns
           # NEW name             # OLD name
    rename(date_infection       = infection_date,
           date_hospitalisation = hosp_date,
           date_outcome         = date_of_outcome) %>% 
    
    # remove column
    select(-c(row_num, merged_header, x28)) %>% 
  
    # de-duplicate
    distinct() %>% 

    # add column
    mutate(bmi = wt_kg / (ht_cm/100)^2) %>%     

    # convert class of columns
    mutate(across(contains("date"), as.Date), 
           generation = as.numeric(generation),
           age        = as.numeric(age)) %>% 
    
    # add column: delay to hospitalisation
    mutate(days_onset_hosp = as.numeric(date_hospitalisation - date_onset)) %>% 
    
    # clean values of hospital column
    mutate(hospital = recode(hospital,
                      # OLD = NEW
                      "Mitylira Hopital"  = "Military Hospital",
                      "Mitylira Hospital" = "Military Hospital",
                      "Military Hopital"  = "Military Hospital",
                      "Port Hopital"      = "Port Hospital",
                      "Central Hopital"   = "Central Hospital",
                      "other"             = "Other",
                      "St. Marks Maternity Hopital (SMMH)" = "St. Mark's Maternity Hospital (SMMH)"
                      )) %>% 
    
    mutate(hospital = replace_na(hospital, "Missing")) %>% 

    # create age_years column (from age and age_unit)
    mutate(age_years = case_when(
          age_unit == "years" ~ age,
          age_unit == "months" ~ age/12,
          is.na(age_unit) ~ age)) %>% 
  
    # ABOVE ARE UPSTREAM CLEANING STEPS ALREADY DISCUSSED
    ###################################################   
    mutate(
          # age categories: custom
          age_cat = epikit::age_categories(age_years, breakers = c(0, 5, 10, 15, 20, 30, 50, 70)),
        
          # age categories: 0 to 85 by 5s
          age_cat5 = epikit::age_categories(age_years, breakers = seq(0, 85, 5)))

# linelist <- linelist %>% 
#   add_row(row_num = 666,
#           case_id = "abc",
#           generation = 4,
#           `infection date` = as.Date("2020-10-10"),
#           .before = 2)

# linelist <- linelist %>% 
#   filter(gender == "f")   # keep only rows where gender is equal to "f"

# linelist %>% 
#   drop_na(case_id, age_years)  # drop rows with missing values for case_id or age_years

# # View first 100 rows
# linelist %>% head(100)     # or use tail() to see the n last rows
#
# # Show row 5 only
# linelist %>% filter(row_number() == 5)
#
# # View rows 2 through 20, and three specific columns
# linelist %>% filter(row_number() %in% 2:20) %>% select(date_onset, outcome, age)

hist(linelist$date_onset, breaks = 50)

table(Hospital  = linelist$hospital,                     # hospital name
      YearOnset = lubridate::year(linelist$date_onset),  # year of date_onset
      useNA     = "always")                              # show missing values

linelist <- linelist %>% 
  # keep rows where onset is after 1 June 2013 OR where onset is missing and it was a hospital OTHER than Hospital A or B
  filter(date_onset > as.Date("2013-06-01") | (is.na(date_onset) & !hospital %in% c("Hospital A", "Hospital B")))

nrow(linelist)

table(Hospital  = linelist$hospital,                     # hospital name
      YearOnset = lubridate::year(linelist$date_onset),  # year of date_onset
      useNA     = "always")                              # show missing values

# # dataframe <- filter(dataframe, condition(s) for rows to keep)
#
# linelist <- filter(linelist, !is.na(case_id))

# # dataframe <- dataframe[row conditions, column conditions] (blank means keep all)
#
# linelist <- linelist[!is.na(case_id), ]

# View(linelist)

# View(linelist %>%
#        filter(case_id %in% c("11f8ea", "76b97a", "47a5f5")) %>%
#        select(date_onset, date_hospitalisation))

# View(linelist[linelist$case_id %in% c("11f8ea", "76b97a", "47a5f5"), c("date_onset", "date_hospitalisation")])

# CLEANING 'PIPE' CHAIN (starts with raw data and pipes it through cleaning steps)
##################################################################################

# begin cleaning pipe chain
###########################
linelist <- linelist_raw %>%
    
    # standardize column name syntax
    janitor::clean_names() %>% 
    
    # manually re-name columns
           # NEW name             # OLD name
    rename(date_infection       = infection_date,
           date_hospitalisation = hosp_date,
           date_outcome         = date_of_outcome) %>% 
    
    # remove column
    select(-c(row_num, merged_header, x28)) %>% 
  
    # de-duplicate
    distinct() %>% 

    # add column
    mutate(bmi = wt_kg / (ht_cm/100)^2) %>%     

    # convert class of columns
    mutate(across(contains("date"), as.Date), 
           generation = as.numeric(generation),
           age        = as.numeric(age)) %>% 
    
    # add column: delay to hospitalisation
    mutate(days_onset_hosp = as.numeric(date_hospitalisation - date_onset)) %>% 
    
    # clean values of hospital column
    mutate(hospital = recode(hospital,
                      # OLD = NEW
                      "Mitylira Hopital"  = "Military Hospital",
                      "Mitylira Hospital" = "Military Hospital",
                      "Military Hopital"  = "Military Hospital",
                      "Port Hopital"      = "Port Hospital",
                      "Central Hopital"   = "Central Hospital",
                      "other"             = "Other",
                      "St. Marks Maternity Hopital (SMMH)" = "St. Mark's Maternity Hospital (SMMH)"
                      )) %>% 
    
    mutate(hospital = replace_na(hospital, "Missing")) %>% 

    # create age_years column (from age and age_unit)
    mutate(age_years = case_when(
          age_unit == "years" ~ age,
          age_unit == "months" ~ age/12,
          is.na(age_unit) ~ age)) %>% 
  
    mutate(
          # age categories: custom
          age_cat = epikit::age_categories(age_years, breakers = c(0, 5, 10, 15, 20, 30, 50, 70)),
        
          # age categories: 0 to 85 by 5s
          age_cat5 = epikit::age_categories(age_years, breakers = seq(0, 85, 5))) %>% 
    
    # ABOVE ARE UPSTREAM CLEANING STEPS ALREADY DISCUSSED
    ###################################################
    filter(
          # keep only rows where case_id is not missing
          !is.na(case_id),  
          
          # also filter to keep only the second outbreak
          date_onset > as.Date("2013-06-01") | (is.na(date_onset) & !hospital %in% c("Hospital A", "Hospital B")))

linelist %>%
  rowwise() %>%
  mutate(num_symptoms = sum(c(fever, chills, cough, aches, vomit) == "yes")) %>% 
  ungroup() %>% 
  select(fever, chills, cough, aches, vomit, num_symptoms) # for display

linelist %>%
  rowwise() %>%
  mutate(num_NA_dates = sum(is.na(c_across(contains("date"))))) %>% 
  ungroup() %>% 
  select(num_NA_dates, contains("date")) # for display

linelist %>%
  rowwise() %>%
  mutate(latest_date = max(c_across(contains("date")), na.rm=T)) %>% 
  ungroup() %>% 
  select(latest_date, contains("date"))  # for display

# linelist %>% 
#    arrange(hospital, desc(date_onset))

# HIDDEN
#
# convert one remaining old outbreak row to missing for ease
linelist <- linelist %>% 
  mutate(
    date_hospitalisation = case_when(
      date_hospitalisation < as.Date("2013-01-01") ~ as.Date(NA),
      TRUE                                         ~ date_hospitalisation),
    date_outcome = case_when(
      date_outcome < as.Date("2013-01-01") ~ as.Date(NA),
      TRUE                                 ~ date_outcome)
    )

#min(linelist$date_hospitalisation, na.rm=T)
#min(linelist$date_outcome, na.rm=T)

# REARRANGE COLUMNS FOR EXPORT
linelist <- linelist %>% 
  select(case_id:gender, age, age_unit, age_years, age_cat, age_cat5, everything())



# Chapter 9 - Working with dates

# Checks if package is installed, installs if necessary, and loads package for current session

pacman::p_load(
  lubridate,  # general package for handling and converting dates  
  parsedate,  # has function to "guess" messy dates
  aweek,      # another option for converting dates to weeks, and weeks to dates
  zoo,        # additional date/time functions
  here,       # file management
  rio,        # data import/export
  tidyverse)  # data management and visualization  

linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL


# linelist <- import("linelist_cleaned.xlsx")
#

# get the system date - this is a DATE class
Sys.Date()

# get the system time - this is a DATETIME class
Sys.time()

# # Convert to class date
# linelist <- linelist %>% 
#   mutate(date_onset = as.Date(date_of_onset, format = "%d/%m/%Y"))

# install/load lubridate 
pacman::p_load(lubridate)

# read date in year-month-day format
ymd("2020-10-11")
ymd("20201011")

# read date in month-day-year format
mdy("10/11/2020")
mdy("Oct 11 20")

# read date in day-month-year format
dmy("11 10 2020")
dmy("11 October 2020")

# linelist <- linelist %>%
#   mutate(date_onset = lubridate::dmy(date_onset))

# # Check the class of the column
# class(linelist$date_onset)  

two_digit_years <- c("15", "15", "16", "17")
str_glue("20{two_digit_years}")

# linelist <- linelist %>% 
#   mutate(onset_date = make_date(year = onset_year, month = onset_month, day = onset_day))

# # An example of providing the Excel 'origin date' when converting Excel number dates
# data_cleaned <- data %>% 
#   mutate(date_onset = as.numeric(date_onset)) %>%   # ensure class is numeric
#   mutate(date_onset = as.Date(date_onset, origin = "1899-12-30")) # convert to date using Excel origin

parsedate::parse_date(c("03 January 2018",
                        "07/03/1982",
                        "08/20/85"))

# # An example using parse_date() on the column date_onset
# linelist <- linelist %>%      
#   mutate(date_onset = parse_date(date_onset))

ymd_h("2020-01-01 16hrs")
ymd_h("2020-01-01 4PM")

dmy_hm("01 January 2020 16:20")

mdy_hms("01 January 2020, 16:20:40")

mdy_hms("01 January 2020, 16:20:40 PST")


# # packages
# pacman::p_load(tidyverse, lubridate, stringr)
#
# # time_admission is a column in hours:minutes
# linelist <- linelist %>%
#
#   # when time of admission is not given, assign the median admission time
#   mutate(
#     time_admission_clean = ifelse(
#       is.na(time_admission),         # if time is missing
#       median(time_admission),        # assign the median
#       time_admission                 # if not missing keep as is
#   ) %>%
#
#     # use str_glue() to combine date and time columns to create one character column
#     # and then use ymd_hm() to convert it to datetime
#   mutate(
#     date_time_of_admission = str_glue("{date_hospitalisation} {time_admission_clean}") %>% 
#       ymd_hm()
#   )
#

# raw character times
time1 <- "13:45" 
time2 <- "15:20"

# Times converted to a datetime class
time1_clean <- strptime(time1, format = "%H:%M")
time2_clean <- strptime(time2, format = "%H:%M")

# Difference is of class "difftime" by default, here converted to numeric hours 
as.numeric(time2_clean - time1_clean)   # difference in hours


linelist <- linelist %>%
  mutate(hour_admit = hour(strptime(time_admission, format = "%H:%M"))) %>%
  mutate(time_period = case_when(
    hour_admit > 06 & hour_admit < 12 ~ "Morning",
    hour_admit >= 12 & hour_admit < 17 ~ "Afternoon",
    hour_admit >= 17 & hour_admit < 21 ~ "Evening",
    hour_admit >=21 | hour_admit <= 6 ~ "Night"))

# create object of class Date
example_date <- ymd("2020-03-01")

month(example_date)  # month number
day(example_date)    # day (number) of the month
wday(example_date)   # day number of the week (1-7)

# example_datetime <- ymd_hm("2020-03-01 14:45")
#
# hour(example_datetime)     # extract hour
# minute(example_datetime)   # extract minute
# second(example_datetime)   # extract second

# add 3 days to this date
example_date + days(3)
  
# add 7 weeks and subtract two days from this date
example_date + weeks(7) - days(2)

# find the interval between this date and Feb 20 2020 
output <- example_date - ymd("2020-02-20")
output    # print
class(output)

# pacman::p_load(lubridate, tidyverse)   # load packages
#
# linelist <- linelist %>%
#
#   # convert date of onset from character to date objects by specifying dmy format
#   mutate(date_onset = dmy(date_onset),
#          date_hospitalisation = dmy(date_hospitalisation)) %>%
#
#   # filter out all cases without onset in march
#   filter(month(date_onset) == 3) %>%
#
#   # find the difference in days between onset and hospitalisation
#   mutate(days_onset_to_hosp = date_hospitalisation - date_of_onset)

# # calculate the median number of days to hospitalisation for all cases where data are available
# median(linelist_delay$days_onset_to_hosp, na.rm = T)

# today's date, with formatting
format(Sys.Date(), format = "%d %B %Y")

# easy way to get full date and time (default formatting)
date()

# formatted combined date, time, and time zone using str_glue() function
str_glue("{format(Sys.Date(), format = '%A, %B %d %Y, %z  %Z, ')}{format(Sys.time(), format = '%H:%M:%S')}")

# Using format to display weeks
format(Sys.Date(), "%Y Week %W")

# create new column 
test_zoo <- linelist %>% 
     mutate(yearmonth = zoo::as.yearmon(date_onset))

# print table
table(test_zoo$yearmon)

# create new column
test_format <- linelist %>% 
     mutate(yearmonth = format(date_onset, "%b %Y"))

# print table
table(test_format$yearmon)

# Make aggregated dataset of weekly case counts
weekly_counts <- linelist %>% 
  drop_na(date_onset) %>%             # remove cases missing onset date
  mutate(weekly_cases = floor_date(   # make new column, week of onset
    date_onset,
    unit = "week")) %>%            
  count(weekly_cases) %>%           # group data by week and count rows per group (creates column 'n')
  tidyr::complete(                  # ensure all weeks are present, even those with no cases reported
    weekly_cases = seq.Date(          # re-define the "weekly_cases" column as a complete sequence,
      from = min(weekly_cases),       # from the minimum date
      to = max(weekly_cases),         # to the maxiumum date
      by = "week"),                   # by weeks
    fill = list(n = 0))             # fill-in NAs in the n counts column with 0

# assign the current time to a column
time_now <- Sys.time()
time_now

# use with_tz() to assign a new timezone to the column, while CHANGING the clock time
time_london_real <- with_tz(time_now, "Europe/London")

# use force_tz() to assign a new timezone to the column, while KEEPING the clock time
time_london_local <- force_tz(time_now, "Europe/London")


# note that as long as the computer that was used to run this code is NOT set to London time,
# there will be a difference in the times 
# (the number of hours difference from the computers time zone to london)
time_london_real - time_london_local


counts <- import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/example/district_weekly_count_data.xlsx") %>%  # FIX: local file -> URL
  filter(District == "Nibari") %>% 
  mutate(Date = as.Date(Date),
         week_start = lubridate::floor_date(Date, "week")) %>%
  group_by(week_start) %>% 
  summarize(cases_wk = sum(Cases, na.rm=T)) %>% 
  complete(week_start = seq.Date(min(week_start), max(week_start), by = "week"), fill = list(cases_wk = 0))

counts <- counts %>% 
  mutate(cases_prev_wk = lag(cases_wk, n = 1))

counts <- counts %>% 
  mutate(cases_prev_wk = lag(cases_wk, n = 1),
         case_diff = cases_wk - cases_prev_wk)



# Chapter 10 - Characters and strings

# install/load packages
pacman::p_load(
  stringr,    # many functions for handling strings
  tidyverse,  # for optional data manipulation
  tools)      # alternative for converting to title case


# import the linelist into R
linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL

# # import case linelist 
# linelist <- import("linelist_cleaned.rds")

str_c("String1", "String2", "String3")

str_c("String1", "String2", "String3", sep = ", ")

first_names <- c("abdul", "fahruk", "janice") 
last_names  <- c("hussein", "akinleye", "okeke")

# sep displays between the respective input strings, while collapse displays between the elements produced
str_c(first_names, last_names, sep = " ", collapse = ";  ")

# For newlines to print correctly, the phrase may need to be wrapped in cat()
cat(str_c(first_names, last_names, sep = " ", collapse = ";\n"))

str_glue("Data include {nrow(linelist)} cases and are current to {format(Sys.Date(), '%d %b %Y')}.")

str_glue("Linelist as of {current_date}.\nLast case hospitalized on {last_hospital}.\n{n_missing_onset} cases are missing date of onset and not shown",
         current_date = format(Sys.Date(), '%d %b %Y'),
         last_hospital = format(as.Date(max(linelist$date_hospitalisation, na.rm=T)), '%d %b %Y'),
         n_missing_onset = nrow(linelist %>% filter(is.na(date_onset)))
         )


# make case data frame
case_table <- data.frame(
  zone        = c("Zone 1", "Zone 2", "Zone 3", "Zone 4", "Zone 5"),
  new_cases   = c(3, 0, 7, 0, 15),
  total_cases = c(40, 4, 25, 10, 103)
  )

case_table %>% 
  str_glue_data("{zone}: {new_cases} ({total_cases} total cases)")

str_c(case_table$zone, case_table$new_cases, sep = " = ", collapse = ";  ")

str_c("New Cases: ", str_c(case_table$zone, case_table$new_cases, sep = " = ", collapse = ";  "))

df <- data.frame(
  case_ID = c(1:6),
  symptoms  = c("jaundice, fever, chills",     # patient 1
                "chills, aches, pains",        # patient 2 
                "fever",                       # patient 3
                "vomiting, diarrhoea",         # patient 4
                "bleeding from gums, fever",   # patient 5
                "rapid pulse, headache"),      # patient 6
  outcome = c("Recover", "Death", "Death", "Recover", "Recover", "Recover"))

df_split <- separate(df, symptoms, into = c("sym_1", "sym_2", "sym_3"), extra = "merge")

df_split %>% 
  unite(
    col = "all_symptoms",         # name of the new united column
    c("sym_1", "sym_2", "sym_3"), # columns to unite
    sep = ", ",                   # separator to use in united column
    remove = TRUE,                # if TRUE, removes input cols from the data frame
    na.rm = TRUE                  # if TRUE, missing values are removed before uniting
  )

str_split(string = "jaundice, fever, chills",
          pattern = ",")

pt1_symptoms <- str_split("jaundice, fever, chills", ",")

pt1_symptoms[[1]][2]  # extracts 2nd value from 1st (and only) element of the list

symptoms <- c("jaundice, fever, chills",     # patient 1
              "chills, aches, pains",        # patient 2 
              "fever",                       # patient 3
              "vomiting, diarrhoea",         # patient 4
              "bleeding from gums, fever",   # patient 5
              "rapid pulse, headache")       # patient 6

str_split(symptoms, ",")                     # split each patient's symptoms

str_split(symptoms, ",", simplify = TRUE)

str_split(symptoms, ",", simplify = TRUE, n = 2)

# str_split_fixed(symptoms, ",", n = 2)

# third symptoms combined into second new column
df %>% 
  separate(symptoms, into = c("sym_1", "sym_2"), sep=",", extra = "merge")

# third symptoms are lost
df %>% 
  separate(symptoms, into = c("sym_1", "sym_2"), sep=",")

# strings
health_zones <- c("Alba", "Takota", "Delta")

# return the alphabetical order
str_order(health_zones)

# return the strings in alphabetical order
str_sort(health_zones)

n_beds <- 10
n_masks <- 20

paste0("Regional hospital needs ", n_beds, " beds and ", n_masks, " masks.")

str_to_upper("California")

str_to_lower("California")

str_to_title("go to the US state of california ")

tools::toTitleCase("This is the US state of california")

str_to_sentence("the patient must be transported")

# ICD codes of differing length
ICD_codes <- c("R10.13",
               "R10.819",
               "R17")

# ICD codes padded to 7 characters on the right side
str_pad(ICD_codes, 7, "right")

# Pad with periods instead of spaces
str_pad(ICD_codes, 7, "right", pad = ".")

# Add leading zeros to two digits (e.g. for times minutes/hours)
str_pad("4", 2, pad = "0") 

# example using a numeric column named "hours"
# hours <- str_pad(hours, 2, pad = "0")

original <- "Symptom onset on 4/3/2020 with vomiting"
str_trunc(original, 10, "center")

# ICD codes of differing length
ICD_codes   <- c("R10.13",
                 "R10.819",
                 "R17")

# truncate to maximum length of 6
ICD_codes_2 <- str_trunc(ICD_codes, 6)
ICD_codes_2

# expand to minimum length of 6
ICD_codes_3 <- str_pad(ICD_codes_2, 6, "right")
ICD_codes_3

# ID numbers with excess spaces on right
IDs <- c("provA_1852  ", # two excess spaces
         "provA_2345",   # zero excess spaces
         "provA_9460 ")  # one excess space

# IDs trimmed to remove excess spaces on right side only
str_trim(IDs)

# original contains excess spaces within string
str_squish("  Pt requires   IV saline\n") 

pt_course <- "Symptom onset 1/4/2020 vomiting chills fever. Pt saw traditional healer in home village on 2/4/2020. On 5/4/2020 pt symptoms worsened and was admitted to Lumta clinic. Sample was taken and pt was transported to regional hospital on 6/4/2020. Pt died at regional hospital on 7/4/2020."

str_wrap(pt_course, 40)

cat(str_wrap(pt_course, 40))

# start and end third from left (3rd letter from left)
str_sub("pneumonia", 3, 3)

# 0 is not present
str_sub("pneumonia", 0, 0)

# 6th from left, to the 1st from right
str_sub("pneumonia", 6, -1)

# 5th from right, to the 2nd from right
str_sub("pneumonia", -5, -2)

# 4th from left to a position outside the string
str_sub("pneumonia", 4, 15)

# strings to evaluate
chief_complaints <- c("I just got out of the hospital 2 days ago, but still can barely breathe.",
                      "My stomach hurts",
                      "Severe ear pain")

# extract 1st to 3rd words of each string
word(chief_complaints, start = 1, end = 3, sep = " ")

word <- "pneumonia"

# convert the third and fourth characters to X 
str_sub(word, 3, 4) <- "XX"

# print
word

words <- c("pneumonia", "tubercolosis", "HIV")

# convert the third and fourth characters to X 
str_sub(words, 3, 4) <- "XX"

words

str_length("abc")

str_detect(string = "primary school teacher", pattern = "teach")

str_detect(string = "primary school teacher", pattern = "teach", negate = TRUE)

str_detect(string = "Teacher", pattern = regex("teach", ignore_case = T))

# a vector/column of occupations 
occupations <- c("field laborer",
                 "university professor",
                 "primary school teacher & tutor",
                 "tutor",
                 "nurse at regional hospital",
                 "lineworker at Amberdeen Fish Factory",
                 "physican",
                 "cardiologist",
                 "office worker",
                 "food service")

# Detect presence of pattern "teach" in each string - output is vector of TRUE/FALSE
str_detect(occupations, "teach")

sum(str_detect(occupations, "teach"))

sum(str_detect(string = occupations, pattern = "teach|professor|tutor"))

# search terms
occupation_med_frontline <- str_c("medical", "medicine", "hcw", "healthcare", "home care", "home health",
                                "surgeon", "doctor", "doc", "physician", "surgery", "peds", "pediatrician",
                               "intensivist", "cardiologist", "coroner", "nurse", "nursing", "rn", "lpn",
                               "cna", "pa", "physician assistant", "mental health",
                               "emergency department technician", "resp therapist", "respiratory",
                                "phlebotomist", "pharmacy", "pharmacist", "hospital", "snf", "rehabilitation",
                               "rehab", "activity", "elderly", "subacute", "sub acute",
                                "clinic", "post acute", "therapist", "extended care",
                                "dental", "dential", "dentist", sep = "|")

occupation_med_frontline

sum(str_detect(string = occupations, pattern = occupation_med_frontline))

# lengths <- c("2.454,56", "1,2", "6.096,5")
#
# as.numeric(gsub(pattern = ",",                # find commas     
#                 replacement = ".",            # replace with periods
#                 x = gsub("\\.", "", lengths)  # vector with other periods removed (periods escaped)
#                 )
#            )                                  # convert outcome to numeric

outcome <- c("Karl: dead",
            "Samantha: dead",
            "Marco: not dead")

str_replace_all(string = outcome, pattern = "dead", replacement = "deceased")

# df <- df %>% 
#   mutate(is_educator = case_when(
#     # term search within occupation, not case sensitive
#     str_detect(occupations,
#                regex("teach|prof|tutor|university",
#                      ignore_case = TRUE))              ~ "Educator",
#     # all others
#     TRUE                                               ~ "Not an educator"))

# df <- df %>% 
#   # value in new column is_educator is based on conditional logic
#   mutate(is_educator = case_when(
#
#     # occupation column must meet 2 criteria to be assigned "Educator":
#     # it must have a search term AND NOT any exclusion term
#
#     # Must have a search term
#     str_detect(occupations,
#                regex("teach|prof|tutor|university", ignore_case = T)) &              
#
#     # AND must NOT have an exclusion term
#     str_detect(occupations,
#                regex("admin", ignore_case = T),
#                negate = TRUE                        ~ "Educator"
#
#     # All rows not meeting above criteria
#     TRUE                                            ~ "Not an educator"))

str_locate("I wish", "sh")

phrases <- c("I wish", "I hope", "he hopes", "He hopes")

str_locate(phrases, "h" )     # position of *first* instance of the pattern
str_locate_all(phrases, "h" ) # position of *every* instance of the pattern

str_extract_all(occupations, "teach|prof|tutor")

str_extract(occupations, "teach|prof|tutor")

str_subset(occupations, "teach|prof|tutor")

str_count(occupations, regex("teach|prof|tutor", ignore_case = TRUE))

# test string for quantifiers
test <- "A-AA-AAA-AAAA"

str_extract_all(test, "A{2}")

str_extract_all(test, "A{2,4}")

str_extract_all(test, "A+")

str_extract_all(test, "")

pt_note <- "Patient arrived at Broward Hospital emergency ward at 18:00 on 6/12/2005. Patient presented with radiating abdominal pain from LR quadrant. Patient skin was pale, cool, and clammy. Patient temperature was 99.8 degrees farinheit. Patient pulse rate was 100 bpm and thready. Respiratory rate was 29 per minute."

str_extract_all(pt_note, "[A-Za-z]+")

str_extract_all(pt_note, "[0-9]{1,2}")



# Chapter 11 - Factors

pacman::p_load(
  rio,           # import/export
  here,          # filepaths
  lubridate,     # working with dates
  forcats,       # factors
  aweek,         # create epiweeks with automatic factor levels
  janitor,       # tables
  tidyverse      # data mgmt and viz
  )

# import the linelist into R
linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL

# # import your dataset
# linelist <- import("linelist_cleaned.rds")

linelist <- linelist %>% 
  mutate(delay_cat = case_when(
    # criteria                                   # new value if TRUE
    days_onset_hosp < 2                        ~ "<2 days",
    days_onset_hosp >= 2 & days_onset_hosp < 5 ~ "2-5 days",
    days_onset_hosp >= 5                       ~ ">5 days",
    is.na(days_onset_hosp)                     ~ NA_character_,
    TRUE                                       ~ "Check me"))  

table(linelist$delay_cat, useNA = "always")

ggplot(data = linelist)+
  geom_bar(mapping = aes(x = delay_cat))

linelist <- linelist %>%
  mutate(delay_cat = fct_relevel(delay_cat))

levels(linelist$delay_cat)

linelist <- linelist %>%
  mutate(delay_cat = fct_relevel(delay_cat, "<2 days", "2-5 days", ">5 days"))

levels(linelist$delay_cat)

ggplot(data = linelist)+
  geom_bar(mapping = aes(x = delay_cat))

linelist %>% 
  mutate(delay_cat = fct_expand(delay_cat, "Not admitted to hospital", "Transfer to other jurisdiction")) %>% 
  tabyl(delay_cat)   # print table

linelist %>% 
  mutate(delay_cat = fct_drop(delay_cat)) %>% 
  tabyl(delay_cat)

# re-define level order
linelist <- linelist %>% 
  mutate(delay_cat = fct_relevel(delay_cat, c("<2 days", "2-5 days", ">5 days")))

# # re-define level order
# linelist %>% 
#   mutate(delay_cat = fct_relevel(delay_cat, "<2 days", after = 1)) %>% 
#   tabyl(delay_cat)

linelist <- linelist %>% 
  mutate(delay_cat = fct_relevel(delay_cat, c("2-5 days", "<2 days", ">5 days")))


# Alpha-numeric default order - no adjustment within ggplot
ggplot(data = linelist)+
    geom_bar(mapping = aes(x = delay_cat))

# Factor level order adjusted within ggplot
ggplot(data = linelist)+
  geom_bar(mapping = aes(x = fct_relevel(delay_cat, c("<2 days", "2-5 days", ">5 days"))))

# ordered by frequency
ggplot(data = linelist, aes(x = fct_infreq(delay_cat)))+
  geom_bar()+
  labs(x = "Delay onset to admission (days)",
       title = "Ordered by frequency")

# reversed frequency
ggplot(data = linelist, aes(x = fct_rev(fct_infreq(delay_cat))))+
  geom_bar()+
  labs(x = "Delay onset to admission (days)",
       title = "Reverse of order by frequency")

# boxplots ordered by original factor levels
ggplot(data = linelist)+
  geom_boxplot(
    aes(x = delay_cat,
        y = ct_blood, 
        fill = delay_cat))+
  labs(x = "Delay onset to admission (days)",
       title = "Ordered by original alpha-numeric levels")+
  theme_classic()+
  theme(legend.position = "none")


# boxplots ordered by median CT value
ggplot(data = linelist)+
  geom_boxplot(
    aes(x = fct_reorder(delay_cat, ct_blood, "median"),
        y = ct_blood,
        fill = delay_cat))+
  labs(x = "Delay onset to admission (days)",
       title = "Ordered by median CT value in group")+
  theme_classic()+
  theme(legend.position = "none")

epidemic_data <- linelist %>%         # begin with the linelist   
    filter(date_onset < as.Date("2014-09-21")) %>%    # cut-off date, for visual clarity
    count(                                            # get case counts per week and by hospital
      epiweek = lubridate::floor_date(date_onset, "week"),  
      hospital                                            
    ) 
  
ggplot(data = epidemic_data)+                       # start plot
  geom_line(                                        # make lines
    aes(
      x = epiweek,                                  # x-axis epiweek
      y = n,                                        # height is number of cases per week
      color = fct_reorder2(hospital, epiweek, n)))+ # data grouped and colored by hospital, with factor order by height at end of plot
  labs(title = "Factor levels (and legend display) by line height at end of plot",
       color = "Hospital")                          # change legend title

linelist %>% 
  mutate(delay_cat = fct_na_value_to_level(delay_cat, level = "Missing delay")) %>% 
  tabyl(delay_cat)

linelist <- linelist %>% 
  mutate(delay_cat = fct_relevel(delay_cat, "<2 days", after = 0))

levels(linelist$delay_cat)

linelist %>% 
  mutate(delay_cat = fct_recode(
    delay_cat,
    "Less than 2 days" = "<2 days",
    "2 to 5 days"      = "2-5 days",
    "More than 5 days" = ">5 days")) %>% 
  tabyl(delay_cat)

linelist %>% 
  mutate(delay_cat = fct_recode(
    delay_cat,
    "Less than 5 days" = "<2 days",
    "Less than 5 days" = "2-5 days",
    "More than 5 days" = ">5 days")) %>% 
  tabyl(delay_cat)

linelist %>%    
  mutate(hospital = fct_other(                      # adjust levels
    hospital,
    keep = c("Port Hospital", "Central Hospital"),  # keep these separate
    other_level = "Other Hospital")) %>%            # All others as "Other Hospital"
  tabyl(hospital)                                   # print table


linelist %>%    
  mutate(hospital = fct_lump(                      # adjust levels
    hospital,
    n = 2,                                          # keep top 2 levels
    other_level = "Other Hospital")) %>%            # all others as "Other Hospital"
  tabyl(hospital)                                   # print table


ggplot(data = linelist)+
  geom_bar(mapping = aes(x = hospital, fill = age_cat)) +
  scale_fill_discrete(drop = FALSE)+                        # show all age groups in the legend, even those not present
  labs(
    title = "All age groups will appear in legend, even if not present in data")

linelist %>% 
  mutate(epiweek_date = floor_date(date_onset, "week")) %>%  # create week column
  ggplot()+                                                  # begin ggplot
  geom_histogram(mapping = aes(x = epiweek_date))+           # histogram of date of onset
  scale_x_date(date_labels = "%Y-W%W")                       # adjust disply of dates to be YYYY-WWw

linelist <- linelist %>% 
  mutate(epiweek_date = floor_date(date_onset, "week"),       # create epiweeks (YYYY-MM-DD)
         epiweek_formatted = format(epiweek_date, "%Y-W%W"),  # Convert to display (YYYY-WWw)
         epiweek_formatted = factor(epiweek_formatted))       # Convert to factor

# Display levels
levels(linelist$epiweek_formatted)

# df <- linelist %>% 
#   mutate(epiweek = date2week(date_onset, week_start = "Monday", factor = TRUE))
#
# levels(df$epiweek)



# Chapter 12 - Pivoting data

pacman::p_load(
  rio,          # File import
  here,         # File locator
  kableExtra,   # Build and manipulate complex tables
  tidyverse)    # data management + ggplot2 graphics

count_data <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/malaria_facility_count_data.rds") %>%  # FIX: local file -> URL
  as_tibble()

# # Import data
# count_data <- import("malaria_facility_count_data.rds")

# import the linelist into R
linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL

# # import your dataset
# linelist <- import("linelist_cleaned.xlsx")

ggplot(count_data) +
  geom_col(aes(x = data_date, y = malaria_tot), width = 1)

# df_long <- count_data %>% 
#   pivot_longer(
#     cols = c(`malaria_rdt_0-4`, `malaria_rdt_5-14`, `malaria_rdt_15`, `malaria_tot`)
#   )
#
# df_long

# provide column with a tidyselect helper function
count_data %>% 
  pivot_longer(
    cols = starts_with("malaria_")
  )

# # provide columns by position
# count_data %>% 
#   pivot_longer(
#     cols = 6:9
#   )

# # provide range of consecutive columns
# count_data %>% 
#   pivot_longer(
#     cols = `malaria_rdt_0-4`:malaria_tot
#   )

df_long <- 
  count_data %>% 
  pivot_longer(
    cols = starts_with("malaria_"),
    names_to = "age_group",
    values_to = "counts"
  )

df_long

ggplot(data = df_long) +
  geom_col(
    mapping = aes(x = data_date, y = counts, fill = age_group),
    width = 1
  )

df_long %>% 
  filter(age_group != "malaria_tot") %>% 
  ggplot() +
  geom_col(
    aes(x = data_date, y = counts, fill = age_group),
    width = 1
  )

count_data %>% 
  pivot_longer(
    cols = `malaria_rdt_0-4`:malaria_rdt_15,   # does not include the totals column
    names_to = "age_group",
    values_to = "counts"
  )


df <- 
  tibble::tribble(
     ~id,   ~obs1_date, ~obs1_status,   ~obs2_date, ~obs2_status,   ~obs3_date, ~obs3_status,
     "A", "2021-04-23",    "Healthy", "2021-04-24",    "Healthy", "2021-04-25",     "Unwell",
     "B", "2021-04-23",    "Healthy", "2021-04-24",    "Healthy", "2021-04-25",    "Healthy",
     "C", "2021-04-23",    "Missing", "2021-04-24",    "Healthy", "2021-04-25",    "Healthy"
     ) 

DT::datatable(df, rownames = FALSE)


df %>% 
  pivot_longer(
    cols = -id,
    names_to = c("observation")
  )



df_long <- 
  df %>% 
  pivot_longer(
    cols = -id,
    names_to = c("observation", ".value"),
    names_sep = "_"
  )

df_long



df_long <- 
  df_long %>% 
  mutate(
    date = date %>% lubridate::as_date(),
    observation = 
      observation %>% 
      str_remove_all("obs") %>% 
      as.numeric()
  )

df_long


ggplot(data = df_long, mapping = aes(x = date, y = id, fill = status)) +
  geom_tile(colour = "black") +
  scale_fill_manual(
    values = 
      c("Healthy" = "lightgreen", 
        "Unwell" = "red", 
        "Missing" = "orange")
  )


df_wide <- 
  linelist %>% 
  count(age_cat, gender)

df_wide

ggplot(df_wide) +
  geom_col(aes(x = age_cat, y = n, fill = gender))

table_wide <- 
  df_wide %>% 
  pivot_wider(
    id_cols = age_cat,
    names_from = gender,
    values_from = n
  )

table_wide

table_wide %>% 
  janitor::adorn_totals(c("row", "col")) %>% # adds row and column totals
  knitr::kable() %>% 
  kableExtra::row_spec(row = 10, bold = TRUE) %>% 
  kableExtra::column_spec(column = 5, bold = TRUE) 

df1 <- 
  tibble::tribble(
       ~Measurement, ~Facility, ~Cases,
                  1,  "Hosp 1",     66,
                  2,  "Hosp 1",     26,
                  3,  "Hosp 1",      8,
                  1,  "Hosp 2",     71,
                  2,  "Hosp 2",     62,
                  3,  "Hosp 2",     70,
                  1,  "Hosp 3",     47,
                  2,  "Hosp 3",     70,
                  3,  "Hosp 3",     38,
       )

df1 

df2 <- 
  tibble::tribble(
    ~Year, ~Measurement, ~Facility, ~Cases,
     2000,            1,  "Hosp 4",     82,
     2001,            2,  "Hosp 4",     87,
     2002,            3,  "Hosp 4",     46
  )

df2

df_combined <- 
  bind_rows(df1, df2) %>% 
  arrange(Measurement, Facility)

df_combined


df_combined %>% 
  fill(Year, .direction = "up")

df_combined <- 
  df_combined %>% 
  arrange(Measurement, desc(Facility))

df_combined

df_combined <- 
  df_combined %>% 
  fill(Year, .direction = "down")

df_combined

ggplot(df_combined) +
  aes(Year, Cases, fill = Facility) +
  geom_col()

df_combined %>% 
  pivot_wider(
    id_cols = c(Measurement, Facility),
    names_from = "Year",
    values_from = "Cases"
  ) %>% 
  arrange(Facility) %>% 
  janitor::adorn_totals(c("row", "col")) %>% 
  knitr::kable() %>% 
  kableExtra::row_spec(row = 5, bold = TRUE) %>% 
  kableExtra::column_spec(column = 5, bold = TRUE) 

df_combined %>% 
  pivot_wider(
    names_from = "Year",
    values_from = "Cases"
  ) %>% 
  knitr::kable()



# Chapter 13 - Grouping data

pacman::p_load(
  rio,       # to import data
  here,      # to locate files
  tidyverse, # to clean, handle, and plot the data (includes dplyr)
  janitor)   # adding total rows and columns

linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL

# linelist <- import("linelist_cleaned.rds")

ll_by_outcome <- linelist %>% 
  group_by(outcome)

# print to see which groups are active
ll_by_outcome

linelist %>% 
  group_by(outcome) %>% 
  tally()

linelist %>% 
  group_by(outcome, gender) %>% 
  tally()

# group dat based on a binary column created *within* the group_by() command
linelist %>% 
  group_by(
    age_class = ifelse(age >= 18, "adult", "child")) %>% 
  tally(sort = T)

# # Grouped by outcome
# by_outcome <- linelist %>% 
#   group_by(outcome)
#
# # Add grouping by gender in addition
# by_outcome_gender <- by_outcome %>% 
#   group_by(gender, .add = TRUE)

# linelist %>% 
#   group_by(outcome, gender) %>% 
#   tally() %>% 
#   ungroup()

# linelist %>% 
#   group_by(outcome, gender) %>% 
#   tally() %>% 
#   ungroup(gender) # remove the grouping by gender, leave grouping by outcome

# summary statistics on ungrouped linelist
linelist %>% 
  summarise(
    n_cases  = n(),
    mean_age = mean(age_years, na.rm=T),
    max_age  = max(age_years, na.rm=T),
    min_age  = min(age_years, na.rm=T),
    n_males  = sum(gender == "m", na.rm=T))

# summary statistics on grouped linelist
linelist %>% 
  group_by(outcome) %>% 
  summarise(
    n_cases  = n(),
    mean_age = mean(age_years, na.rm=T),
    max_age  = max(age_years, na.rm=T),
    min_age  = min(age_years, na.rm=T),
    n_males    = sum(gender == "m", na.rm=T))

linelist %>% 
  tally()

linelist %>% 
  group_by(outcome) %>% 
  tally(sort = TRUE)

linelist %>% 
  count(outcome)

linelist %>% 
  count(age_class = ifelse(age >= 18, "adult", "child"), sort = T)

linelist %>% 
  # produce counts by unique outcome-gender groups
  count(gender, hospital) %>% 
  # gather rows by gender (3) and count number of hospitals per gender (6)
  count(gender, name = "hospitals per gender" ) 

linelist %>% 
  as_tibble() %>%                   # convert to tibble for nicer printing 
  add_count(hospital) %>%           # add column n with counts by hospital
  select(hospital, n, everything()) # re-arrange for demo purposes

linelist %>%                                  # case linelist
  tabyl(age_cat, gender) %>%                  # cross-tabulate counts of two columns
  adorn_totals(where = "row") %>%             # add a total row
  adorn_percentages(denominator = "col") %>%  # convert to proportions with column denominator
  adorn_pct_formatting() %>%                  # convert proportions to percents
  adorn_ns(position = "front") %>%            # display as: "count (percent)"
  adorn_title(                                # adjust titles
    row_name = "Age Category",
    col_name = "Gender")

daily_counts <- linelist %>% 
  drop_na(date_onset) %>%        # remove that were missing date_onset
  count(date_onset)              # count number of rows per unique date

# daily_counts <- linelist %>% 
#   drop_na(date_onset) %>%                 # remove case missing date_onset
#   count(date_onset) %>%                   # count number of rows per unique date
#   complete(                               # ensure all days appear even if no cases
#     date_onset = seq.Date(                # re-define date colume as daily sequence of dates
#       from = min(date_onset, na.rm=T), 
#       to = max(date_onset, na.rm=T),
#       by = "day"),
#     fill = list(n = 0))                   # set new filled-in rows to display 0 in column n (not NA as default) 

# Make dataset of weekly case counts
weekly_counts <- linelist %>% 
  drop_na(date_onset) %>%                 # remove cases missing date_onset
  mutate(week = lubridate::floor_date(date_onset, unit = "week")) %>%  # new column of week of onset
  count(week) %>%                         # group data by week and count rows per group
  complete(                               # ensure all days appear even if no cases
    week = seq.Date(                      # re-define date colume as daily sequence of dates
      from = min(week, na.rm=T), 
      to = max(week, na.rm=T),
      by = "week"),
    fill = list(n = 0))                   # set new filled-in rows to display 0 in column n (not NA as default) 

# Make dataset of monthly case counts
monthly_counts <- linelist %>% 
  drop_na(date_onset) %>% 
  mutate(month = lubridate::floor_date(date_onset, unit = "months")) %>%  # new column, 1st of month of onset
  count(month) %>%                          # count cases by month
  complete(
    month = seq.Date(
      min(month, na.rm=T),     # include all months with no cases reported
      max(month, na.rm=T),
      by="month"),
    fill = list(n = 0))

linelist %>%
  group_by(hospital) %>%
  arrange(hospital, date_hospitalisation) %>%
  slice_head(n = 5) %>% 
  arrange(hospital) %>%                            # for display
  select(case_id, hospital, date_hospitalisation)  # for display

linelist %>% 
  as_tibble() %>% 
  add_count(hospital) %>%          # add "number of rows admitted to same hospital as this row" 
  select(hospital, n, everything())

# linelist %>% 
#   add_count(hospital) %>% 
#   filter(n < 500)

linelist %>% 
  # group data by hospital (no change to linelist yet)
  group_by(hospital) %>% 
  
  # new columns
  mutate(
    # mean days to admission per hospital (rounded to 1 decimal)
    group_delay_admit = round(mean(days_onset_hosp, na.rm=T), 1),
    
    # difference between row's delay and mean delay at their hospital (rounded to 1 decimal)
    diff_to_group     = round(days_onset_hosp - group_delay_admit, 1)) %>%
  
  # select certain rows only - for demonstration/viewing purposes
  select(case_id, hospital, days_onset_hosp, group_delay_admit, diff_to_group)



# Chapter 14 - Joining data

pacman::p_load(
  rio,            # import and export
  here,           # locate files 
  tidyverse,      # data management and visualisation
  RecordLinkage,  # probabilistic matches
  fastLink        # probabilistic matches
)

# import the linelist into R
linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL

# # import case linelist 
# linelist <- import("linelist_cleaned.rds")

linelist_mini <- linelist %>%                 # start with original linelist
  select(case_id, date_onset, hospital) %>%   # select columns
  head(10)                                    # only take the first 10 rows

# Make the hospital information data frame
hosp_info = data.frame(
  hosp_name     = c("central hospital", "military", "military", "port", "St. Mark's", "ignace", "sisters"),
  catchment_pop = c(1950280, 40500, 10000, 50280, 12000, 5000, 4200),
  level         = c("Tertiary", "Secondary", "Primary", "Secondary", "Secondary", "Primary", "Primary")
)

unique(linelist_mini$hospital)

unique(hosp_info$hosp_name)

hosp_info <- hosp_info %>% 
  mutate(
    hosp_name = case_when(
      # criteria                         # new value
      hosp_name == "military"          ~ "Military Hospital",
      hosp_name == "port"              ~ "Port Hospital",
      hosp_name == "St. Mark's"        ~ "St. Mark's Maternity Hospital (SMMH)",
      hosp_name == "central hospital"  ~ "Central Hospital",
      TRUE                             ~ hosp_name
      )
    )

unique(hosp_info$hosp_name)

# # Join based on common values between column "ID" (first data frame) and column "identifier" (second data frame)
# joined_data <- left_join(df1, df2, by = c("ID" = "identifier"))

# # Joint based on common values in column "ID" in both data frames
# joined_data <- left_join(df1, df2, by = "ID")

# # join based on same first name, last name, and age
# joined_data <- left_join(df1, df2, by = c("name" = "firstname", "surname" = "lastname", "Age" = "age"))

# df1 <- df1 %>%
#   filter(date_onset < as.Date("2020-03-05")) %>% # miscellaneous cleaning 
#   left_join(df2, by = c("ID" = "identifier"))    # join df2 to df1

# linelist_mini %>% 
#   left_join(hosp_info, by = c("hospital" = "hosp_name"))

# # The two commands below achieve the same data, but with differently ordered rows and columns
# left_join(linelist_mini, hosp_info, by = c("hospital" = "hosp_name"))
# right_join(hosp_info, linelist_mini, by = c("hosp_name" = "hospital"))

# linelist_mini %>% 
#   full_join(hosp_info, by = c("hospital" = "hosp_name"))

# linelist_mini %>% 
#   inner_join(hosp_info, by = c("hospital" = "hosp_name"))

hosp_info %>% 
  semi_join(linelist_mini, by = c("hosp_name" = "hospital"))

# hosp_info %>% 
#   anti_join(linelist_mini, by = c("hosp_name" = "hospital"))

# linelist_mini %>% 
#   inner_join(hosp_info, by = c("hospital" = "hosp_name"))

# linelist_mini %>% 
#   anti_join(hosp_info, by = c("hospital" = "hosp_name"))

pacman::p_load(
  tidyverse,      # data manipulation and visualization
  fastLink        # record matching
  )

# make datasets

cases <- tribble(
  ~gender, ~first,      ~middle,     ~last,        ~yr,   ~mon, ~day, ~district,
  "M",     "Amir",      NA,          "Khan",       1989,  11,   22,   "River",
  "M",     "Anthony",   "B.",        "Smith",      1970, 09, 19,      "River", 
  "F",     "Marialisa", "Contreras", "Rodrigues",  1972, 04, 15,      "River",
  "F",     "Elizabeth", "Casteel",   "Chase",      1954, 03, 03,      "City",
  "M",     "Jose",      "Sanchez",   "Lopez",      1996, 01, 06,      "City",
  "F",     "Cassidy",   "Jones",      "Davis",     1980, 07, 20,      "City",
  "M",     "Michael",   "Murphy",     "O'Calaghan",1969, 04, 12,      "Rural", 
  "M",     "Oliver",    "Laurent",    "De Bordow" , 1971, 02, 04,     "River",
  "F",      "Blessing",  NA,          "Adebayo",   1955,  02, 14,     "Rural"
)

results <- tribble(
  ~gender,  ~first,     ~middle,     ~last,          ~yr, ~mon, ~day, ~district, ~result,
  "M",      "Amir",     NA,          "Khan",         1989, 11,   22,  "River", "positive",
  "M",      "Tony",   "B",         "Smith",          1970, 09,   19,  "River", "positive",
  "F",      "Maria",    "Contreras", "Rodriguez",    1972, 04,   15,  "Cty",   "negative",
  "F",      "Betty",    "Castel",   "Chase",        1954,  03,   30,  "City",  "positive",
  "F",      "Andrea",   NA,          "Kumaraswamy",  2001, 01,   05,  "Rural", "positive",      
  "F",      "Caroline", NA,          "Wang",         1988, 12,   11,  "Rural", "negative",
  "F",      "Trang",    NA,          "Nguyen",       1981, 06,   10,  "Rural", "positive",
  "M",      "Olivier" , "Laurent",   "De Bordeaux",  NA,   NA,   NA,  "River", "positive",
  "M",      "Mike",     "Murphy",    "O'Callaghan",  1969, 04,   12,  "Rural", "negative",
  "F",      "Cassidy",  "Jones",     "Davis",        1980, 07,   02,  "City",  "positive",
  "M",      "Mohammad", NA,          "Ali",          1942, 01,   17,  "City",  "negative",
  NA,       "Jose",     "Sanchez",   "Lopez",        1995, 01,   06,  "City",  "negative",
  "M",      "Abubakar", NA,          "Abullahi",     1960, 01,   01,  "River", "positive",
  "F",      "Maria",    "Salinas",   "Contreras",    1955, 03,   03,  "River", "positive"
  )


fl_output <- fastLink::fastLink(
  dfA = cases,
  dfB = results,
  varnames = c("gender", "first", "middle", "last", "yr", "mon", "day", "district"),
  stringdist.match = c("first", "middle", "last", "district"),
  numeric.match = c("yr", "mon", "day"),
  threshold.match = 0.95)

# print matches
my_matches <- fl_output$matches
my_matches

# Clean data prior to joining
#############################

# convert cases rownames to a column 
cases_clean <- cases %>% rownames_to_column()

# convert test_results rownames to a column
results_clean <- results %>% rownames_to_column()  

# convert all columns in matches dataset to character, so they can be joined to the rownames
matches_clean <- my_matches %>%
  mutate(across(everything(), as.character))



# Join matches to dfA, then add dfB
###################################
# column "inds.b" is added to dfA
complete <- left_join(cases_clean, matches_clean, by = c("rowname" = "inds.a"))

# column(s) from dfB are added 
complete <- left_join(complete, results_clean, by = c("inds.b" = "rowname"))

cases_clean <- cases %>% rownames_to_column()

results_clean <- results %>%
  rownames_to_column() %>% 
  select(rowname, result)    # select only certain columns 

matches_clean <- my_matches %>%
  mutate(across(everything(), as.character))

# joins
complete <- left_join(cases_clean, matches_clean, by = c("rowname" = "inds.a"))
complete <- left_join(complete, results_clean, by = c("inds.b" = "rowname"))

cases_matched <- cases[my_matches$inds.a,]  # Rows in cases that matched to a row in results
results_matched <- results[my_matches$inds.b,]  # Rows in results that matched to a row in cases

cases_not_matched <- cases[!rownames(cases) %in% my_matches$inds.a,]  # Rows in cases that did NOT match to a row in results
results_not_matched <- results[!rownames(results) %in% my_matches$inds.b,]  # Rows in results that did NOT match to a row in cases

## Add duplicates
#cases_dup <- rbind(cases, cases[sample(1:nrow(cases), 3, replace = FALSE),])

cases_dup <- tribble(
  ~gender, ~first,      ~middle,     ~last,        ~yr,   ~mon, ~day, ~district,
  "M",     "Amir",      NA,          "Khan",       1989,  11,   22,   "River",
  "M",     "Anthony",   "B.",        "Smith",      1970, 09, 19,      "River", 
  "F",     "Marialisa", "Contreras", "Rodrigues",  1972, 04, 15,      "River",
  "F",     "Elizabeth", "Casteel",   "Chase",      1954, 03, 03,      "City",
  "M",     "Jose",      "Sanchez",   "Lopez",      1996, 01, 06,      "City",
  "F",     "Cassidy",   "Jones",      "Davis",     1980, 07, 20,      "City",
  "M",     "Michael",   "Murphy",     "O'Calaghan",1969, 04, 12,      "Rural", 
  "M",     "Oliver",    "Laurent",    "De Bordow" , 1971, 02, 04,     "River",
  "F",      "Blessing",  NA,          "Adebayo",   1955,  02, 14,     "Rural",
  "M",     "Tony",   "B.",        "Smith",         1970, 09, 19,      "River", 
  "F",     "Maria",  "Contreras", "Rodriguez",     1972, 04, 15,      "River",
)


## Run fastLink on the same dataset
dedupe_output <- fastLink(
  dfA = cases_dup,
  dfB = cases_dup,
  varnames = c("gender", "first", "middle", "last", "yr", "mon", "day", "district")
)

## Run getMatches()
cases_dedupe <- getMatches(
  dfA = cases_dup,
  dfB = cases_dup,
  fl.out = dedupe_output)

cases_dedupe %>% 
  count(dedupe.ids) %>% 
  filter(n > 1)

# displays row 2 and all likely duplicates of it
cases_dedupe[cases_dedupe$dedupe.ids == 2,]   

# Create core table
###################
hosp_summary <- linelist %>% 
  group_by(hospital) %>%                        # Group data by hospital
  summarise(                                    # Create new summary columns of indicators of interest
    cases = n(),                                  # Number of rows per hospital-outcome group     
    ct_value_med = median(ct_blood, na.rm=T))     # median CT value per group

# create totals
###############
totals <- linelist %>% 
  summarise(
    cases = n(),                               # Number of rows for whole dataset     
    ct_value_med = median(ct_blood, na.rm=T))  # Median CT for whole dataset

# Bind data frames together
combined <- bind_rows(hosp_summary, totals)

# Case information
case_info <- linelist %>% 
  group_by(hospital) %>% 
  summarise(
    cases = n(),
    deaths = sum(outcome == "Death", na.rm=T)
  )

contact_fu <- data.frame(
  hospital = c("St. Mark's Maternity Hospital (SMMH)", "Military Hospital", "Missing", "Central Hospital", "Port Hospital", "Other"),
  investigated = c("80%", "82%", NA, "78%", "64%", "55%"),
  per_fu = c("60%", "25%", NA, "20%", "75%", "80%")
)

match(case_info$hospital, contact_fu$hospital)

contact_fu_aligned <- contact_fu[match(case_info$hospital, contact_fu$hospital),]

bind_cols(case_info, contact_fu)



# Chapter 15 - De-duplication

pacman::p_load(
  tidyverse,   # deduplication, grouping, and slicing functions
  janitor,     # function for reviewing duplicates
  stringr)      # for string searches, can be used in "rolling-up" values

obs <- data.frame(
  recordID  = c(1,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18),
  personID  = c(1,1,2,2,3,2,4,5,6,7,2,1,3,3,4,5,5,7,8),
  name      = c("adam", "adam", "amrish", "amrish", "mariah", "amrish", "nikhil", "brian", "smita", "raquel", "amrish",
                "adam", "mariah", "mariah", "nikhil", "brian", "brian", "raquel", "natalie"),
  date      = c("1/1/2020", "1/1/2020", "2/1/2020", "2/1/2020", "5/1/2020", "5/1/2020", "5/1/2020", "5/1/2020", "5/1/2020","5/1/2020", "2/1/2020",
                "5/1/2020", "6/1/2020", "6/1/2020", "6/1/2020", "6/1/2020", "7/1/2020", "7/1/2020", "7/1/2020"),
  time      = c("09:00", "09:00", "14:20", "14:20", "12:00", "16:10", "13:01", "15:20", "14:20", "12:30", "10:24",
                "09:40", "07:25", "08:32", "15:36", "15:31", "07:59", "11:13", "17:12"),
  encounter = c(1,1,1,1,1,3,1,1,1,1,2,
                2,2,3,2,2,3,2,1),
  purpose   = c("contact", "contact", "contact", "contact", "case", "case", "contact", "contact", "contact", "contact", "contact",
                "case", "contact", "contact", "contact", "contact", "case", "contact", "case"),
  symptoms_ever = c(NA, NA, "No", "No", "No", "Yes", "Yes", "No", "Yes", NA, "Yes",
                    "No", "No", "No", "Yes", "Yes", "No","No", "No")) %>% 
  mutate(date = as.Date(date, format = "%d/%m/%Y"))

obs %>% 
  tabyl(name, purpose)

# # 100% duplicates across all columns
# obs %>% 
#   janitor::get_dupes()

# # Duplicates when column recordID is not considered
# obs %>% 
#   janitor::get_dupes(-recordID)         # if multiple columns, wrap them in c()

# # duplicates based on name and purpose columns ONLY
# obs %>% 
#   janitor::get_dupes(name, purpose)

# # added to a chain of pipes (e.g. data cleaning)
# obs %>% 
#   distinct(across(-recordID), # reduces data frame to only unique rows (keeps first one of any duplicates)
#            .keep_all = TRUE) 
#
# # if outside pipes, include the data as first argument 
# # distinct(obs)

# # added to a chain of pipes (e.g. data cleaning)
# obs %>% 
#   distinct(name, purpose, .keep_all = TRUE) %>%  # keep rows unique by name and purpose, retain all columns
#   arrange(name)                                  # arrange for easier viewing

x <- c(1, 1, 2, NA, NA, 4, 5, 4, 4, 1, 2)
duplicated(x)

x[duplicated(x)]

unique(x)           # alternatively, use x[!duplicated(x)]
unique(na.omit(x))  # remove NAs 

obs %>% slice(4)  # return the 4th row

obs %>% slice(c(2,4))  # return rows 2 and 4
#obs %>% slice(c(2:4))  # return rows 2 through 4

obs %>% slice_max(encounter, n = 1)  # return rows with the largest encounter number

# obs %>% 
#   group_by(name) %>%       # group the rows by 'name'
#   slice_max(date,          # keep row per group with maximum date value 
#             n = 1,         # keep only the single highest row 
#             with_ties = F) # if there's a tie (of date), take the first row

# # Example of multiple slice statements to "break ties"
# obs %>%
#   group_by(name) %>%
#
#   # FIRST - slice by latest date
#   slice_max(date, n = 1, with_ties = TRUE) %>% 
#
#   # SECOND - if there is a tie, select row with latest time; ties prohibited
#   slice_max(lubridate::hm(time), n = 1, with_ties = FALSE)

# 1. Define data frame of rows to keep for analysis
obs_keep <- obs %>%
  group_by(name) %>%
  slice_max(encounter, n = 1, with_ties = FALSE) # keep only latest encounter per person


# 2. Mark original data frame
obs_marked <- obs %>%

  # make new dup_record column
  mutate(dup_record = case_when(
    
    # if record is in obs_keep data frame
    recordID %in% obs_keep$recordID ~ "For analysis", 
    
    # all else marked as "Ignore" for analysis purposes
    TRUE                            ~ "Ignore"))

# print
obs_marked

# # create a "key variable completeness" column
# # this is a *proportion* of the columns designated as "key_cols" that have non-missing values
#
# key_cols = c("personID", "name", "symptoms_ever")
#
# obs %>% 
#   mutate(key_completeness = rowSums(!is.na(.[,key_cols]))/length(key_cols)) 

# # "Roll-up" values into one row per group (per "personID") 
# cases_rolled <- obs %>% 
#
#   # create groups by name
#   group_by(personID) %>% 
#
#   # order the rows within each group (e.g. by date)
#   arrange(date, .by_group = TRUE) %>% 
#
#   # For each column, paste together all values within the grouped rows, separated by ";"
#   summarise(
#     across(everything(),                           # apply to all columns
#            ~paste0(na.omit(.x), collapse = "; "))) # function is defined which combines non-NA values

# Variation - show unique values only 
cases_rolled <- obs %>% 
  group_by(personID) %>% 
  arrange(date, .by_group = TRUE) %>% 
  summarise(
    across(everything(),                                   # apply to all columns
           ~paste0(unique(na.omit(.x)), collapse = "; "))) # function is defined which combines unique non-NA values

# # Variation - suffix added to column names 
# cases_rolled <- obs %>% 
#   group_by(personID) %>% 
#   arrange(date, .by_group = TRUE) %>% 
#   summarise(
#     across(everything(),                
#            list(roll = ~paste0(na.omit(.x), collapse = "; ")))) # _roll is appended to column names

# CLEAN CASES
#############
cases_clean <- cases_rolled %>% 
    
    # clean Yes-No-Unknown vars: replace text with "highest" value present in the string
    mutate(across(c(contains("symptoms_ever")),                     # operates on specified columns (Y/N/U)
             list(mod = ~case_when(                                 # adds suffix "_mod" to new cols; implements case_when()
               
               str_detect(.x, "Yes")       ~ "Yes",                 # if "Yes" is detected, then cell value converts to yes
               str_detect(.x, "No")        ~ "No",                  # then, if "No" is detected, then cell value converts to no
               str_detect(.x, "Unknown")   ~ "Unknown",             # then, if "Unknown" is detected, then cell value converts to Unknown
               TRUE                        ~ as.character(.x)))),   # then, if anything else if it kept as is
      .keep = "unused")                                             # old columns removed, leaving only _mod columns



# Chapter 16 - Iteration, loops, and lists

pacman::p_load(
     rio,         # import/export
     here,        # file locator
     purrr,       # iteration
     grates,      # scales in ggplot
     tidyverse    # data management and visualization
)

# import the linelist into R
linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL

# # import the linelist
# linelist <- import("linelist_cleaned.rds")

for (num in c(1,2,3,4,5)) {  # the SEQUENCE is defined (numbers 1 to 5) and loop is opened with "{"
  print(num + 2)             # The OPERATIONS (add two to each sequence number and print)
}                            # The loop is closed with "}"                            
                             # There is no "container" in this example

# make vector of the hospital names
hospital_names <- unique(linelist$hospital)
hospital_names # print

# # a 'for loop' with character sequence
#
# for (hosp in hospital_names){       # sequence
#
#        # OPERATIONS HERE
#   }

for (col in names(linelist)){        # loop runs for each column in linelist; column name represented by "col" 
  
  # Example operations code - print number of missing values in column
  print(sum(is.na(linelist[[col]])))  # linelist is indexed by current value of "col"
     
}

# for (i in 1:nrow(linelist)) {  # use on a data frame
#   # OPERATIONS HERE
# }  

seq_along(hospital_names)  # use on a named vector

# create container to store results - a character vector
cases_demographics <- vector(mode = "character", length = nrow(linelist))

# the for loop
for (i in 1:nrow(linelist)){
  
  # OPERATIONS
  # extract values from linelist for row i, using brackets for indexing
  row_gender  <- linelist$gender[[i]]
  row_age     <- linelist$age_years[[i]]    # don't forget to index!
     
  # combine gender-age and store in container vector at indexed location
  cases_demographics[[i]] <- str_c(row_gender, row_age, sep = ",") 

}  # end for loop


# display first 10 rows of container
head(cases_demographics, 10)

delays <- vector(
  mode = "double",                            # we expect to store numbers
  length = length(unique(linelist$hospital))) # the number of unique hospitals in the dataset

# delays <- data.frame(matrix(ncol = 2, nrow = 3))

# plots <- vector(mode = "list", length = 16)

for (hosp in hospital_names){ 
     hospital_cases <- linelist %>% filter(hospital == hosp)
     print(nrow(hospital_cases))
}

# create 'incidence' object
outbreak <- incidence2::incidence(   
     x = linelist,                   # dataframe - complete linelist
     date_index = "date_onset",        # date column
     interval = "week",              # aggregate counts weekly
     groups = "gender")               # group values by gender
     #na_as_group = TRUE)             # missing gender is own group

# tracer la courbe d'épidémie
ggplot(outbreak, # nom de l'objet d'incidence
        aes(x = date_index, #aesthetiques et axes
            y = count, 
            fill = gender), # Fill colour of bars by gender
       color = "black"      # Contour colour of bars
       ) +  
     geom_col() + 
     facet_wrap(~gender) +
     theme_bw() + 
     labs(title = "Outbreak of all cases", #titre
          x = "Counts", 
          y = "Date", 
          fill = "Gender", 
          color = "Gender")



# make vector of the hospital names
hospital_names <- unique(linelist$hospital)

# for each name ("hosp") in hospital_names, create and print the epi curve
for (hosp in hospital_names) {
     
     # create incidence object specific to the current hospital
     outbreak_hosp <- incidence2::incidence(
          x = linelist %>% filter(hospital == hosp),   # linelist is filtered to the current hospital
          date_index = "date_onset",
          interval = "week", 
          groups = "gender"#,
          #na_as_group = TRUE
     )
     
      plot_hosp <- ggplot(outbreak_hosp, # incidence object name
                         aes(x = date_index, #axes
                             y = count, 
                             fill = gender), # fill colour by gender
                         color = "black"      # colour of bar contour
                         ) +  
          geom_col() + 
          facet_wrap(~gender) +
          theme_bw() + 
          labs(title = stringr::str_glue("Epidemic of cases admitted to {hosp}"), #title
               x = "Counts", 
               y = "Date", 
               fill = "Gender", 
               color = "Gender")
     
     # With older versions of R, remove the # before na_as_group and use this plot command instead.
    # plot_hosp <- plot(
#       outbreak_hosp,
#       fill = "gender",
#       color = "black",
#       title = stringr::str_glue("Epidemic of cases admitted to {hosp}")
#     )
     
     #print the plot for hospitals
     print(plot_hosp)
     
} # end the for loop when it has been run for every hospital in hospital_names 

# # loop with code to print progress every 100 iterations
# for (i in seq_len(nrow(linelist))){
#
#   # print progress
#   if(i %% 100==0){    # The %% operator is the remainder
#     print(i)
#
# }

pacman::p_load(
     rio,            # import/export
     here,           # relative filepaths
     tidyverse,      # data mgmt and viz
     writexl,        # write Excel file with multiple sheets
     readxl          # import Excel with multiple sheets
)

sheet_names <- readxl::excel_sheets("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/example/hospital_linelists.xlsx")  # FIX: local file -> URL


# sheet_names <- readxl::excel_sheets("hospital_linelists.xlsx")

sheet_names

combined <- sheet_names %>% 
  purrr::set_names() %>% 
  map(.f = ~import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/example/hospital_linelists.xlsx", which = .x))  # FIX: local file -> URL

# combined <- sheet_names %>% 
#   purrr::set_names() %>% 
#   map(.f = ~import("hospital_linelists.xlsx", which = .x))

sheet_names <- readxl::excel_sheets("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/example/hospital_linelists.xlsx")  # FIX: local file -> URL

combined <- sheet_names %>% 
  purrr::set_names() %>% 
  map(.f = ~import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/example/hospital_linelists.xlsx", which = .x)) %>%  # FIX: local file -> URL
  bind_rows(.id = "origin_sheet")

# sheet_names <- readxl::excel_sheets("hospital_linelists.xlsx")  # extract sheet names
#
# combined <- sheet_names %>%                                     # begin with sheet names
#   purrr::set_names() %>%                                        # set their names
#   map(.f = ~import("hospital_linelists.xlsx", which = .x)) %>%  # iterate, import, save in list
#   bind_rows(.id = "origin_sheet") # combine list of data frames, preserving origin in new column  

sheet_names <- readxl::excel_sheets("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/example/hospital_linelists.xlsx")  # FIX: local file -> URL

combined <- sheet_names %>% 
     purrr::set_names() %>% 
     # exclude the first sheet
     map_at(.f = ~import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/example/hospital_linelists.xlsx", which = .x),  # FIX: local file -> URL
            .at = c(-1))

# sheet_names <- readxl::excel_sheets("hospital_linelists.xlsx")
#
# combined <- sheet_names %>% 
#      purrr::set_names() %>% 
#      # exclude the first sheet
#      map_at(.f = ~import( "hospital_linelists.xlsx", which = .x),
#             .at = c(-1))

linelist_split <- linelist %>% 
     group_split(hospital)

names(linelist_split) <- linelist_split %>%   # Assign to names of listed data frames 
     # Extract the names by doing the following to each data frame: 
     map(.f = ~pull(.x, hospital)) %>%        # Pull out hospital column
     map(.f = ~as.character(.x)) %>%          # Convert to character, just in case
     map(.f = ~unique(.x))                    # Take the unique hospital name

names(linelist_split)

# split linelist by unique hospital-gender combinations
linelist_split <- linelist %>% 
     group_split(hospital, gender)

# extract group_keys() as a dataframe
groupings <- linelist %>% 
     group_by(hospital, gender) %>%       
     group_keys()

groupings      # show unique groupings 

# # Combine into one name value 
# names(linelist_split) <- groupings %>% 
#      mutate(across(everything(), ~ replace_na(.x, "Missing"))) %>%  # replace NA with "Missing" in all columns
#      unite("combined", sep = "-") %>%                         # Unite all column values into one
#      setNames(NULL) %>% 
#      as_vector() %>% 
#      as.list()

# linelist_split %>% 
#      writexl::write_xlsx(path = here("data", "hospital_linelists.xlsx"))

# names(linelist_split) %>%
#      map(.f = ~export(linelist_split[[.x]], file = str_glue("{here('data')}/{.x}.csv")))


# load package for plotting elements from list
pacman::p_load(ggpubr)

# map across the vector of 6 hospital "names" (created earlier)
# use the ggplot function specified
# output is a list with 6 ggplots

hospital_names <- unique(linelist$hospital)

my_plots <- map(
  .x = hospital_names,
  .f = ~ggplot(data = linelist %>% filter(hospital == .x)) +
                geom_histogram(aes(x = date_onset)) +
                labs(title = .x)
)

# print the ggplots (they are stored in a list)
ggarrange(plotlist = my_plots, ncol = 2, nrow = 3)

# # Create function
# make_epicurve <- function(hosp_name){
#
#   ggplot(data = linelist %>% filter(hospital == hosp_name)) +
#     geom_histogram(aes(x = date_onset)) +
#     theme_classic()+
#     labs(title = hosp_name)
#
# }

# # mapping
# my_plots <- map(hospital_names, ~make_epicurve(hosp_name = .x))
#
# # print the ggplots (they are stored in a list)
# ggarrange(plotlist = my_plots, ncol = 2, nrow = 3)

# Results are saved as a list
t.test_results <- linelist %>% 
  select(age, wt_kg, ht_cm, ct_blood, temp) %>%  # keep only some numeric columns to map across
  map(.f = ~t.test(.x ~ linelist$gender))        # t.test function, with equation NUMERIC ~ CATEGORICAL

# # convert columns with column name containing "age" to class Character
# linelist <- linelist %>% 
#   mutate(across(.cols = contains("age"), .fns = as.character))  

names(t.test_results)

t.test_results[[1]] # first element by position
t.test_results[[1]]["p.value"] # return element named "p.value" from first element  

t.test_results %>% 
  pluck("age")        # alternatively, use pluck(1)

t.test_results %>% 
  pluck("age", "p.value")

t.test_results %>%
  map(pluck, "p.value")   # return every p-value

t.test_results %>% 
  map_dbl("p.value")   # return p-values as a named numeric vector

t.test_results %>% {
  tibble(
    variables = names(.),
    p         = map_dbl(., "p.value"))
  }

t.test_results %>% 
  {tibble(
    variables = names(.),
    p = map_dbl(., "p.value"),
    means = map(., "estimate"))}

t.test_results %>% 
  {tibble(
    variables = names(.),
    p = map_dbl(., "p.value"),
    means = map(., "estimate")
    )} %>% 
  unnest_wider(means)

# combined %>% 
#   list_modify("Central Hospital" = NULL)   # remove list element by name

# # keep only list elements with more than 500 rows
# combined %>% 
#   keep(.p = ~nrow(.x) > 500)  

# # Discard list elements that are not data frames
# combined %>% 
#   discard(.p = ~class(.x) != "data.frame")

# # keep only list elements where ct_blood column mean is over 25
# combined %>% 
#   discard(.p = ~mean(.x$ct_blood) > 25)  

# # Remove all empty list elements
# combined %>% 
#   compact()



# Chapter 17 - Descriptive tables

pacman::p_load(
  rio,          # File import
  here,         # File locator
  skimr,        # get overview of data
  tidyverse,    # data management + ggplot2 graphics 
  gtsummary,    # summary statistics and tests
  rstatix,      # summary statistics and statistical tests
  janitor,      # adding totals and percents to tables
  scales,       # easily convert proportions to percents  
  flextable     # converting tables to pretty images
  )

# import the linelist into R
linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL

# # import the linelist
# linelist <- import("linelist_cleaned.rds")

# ## get information about each variable in a dataset 
# skim(linelist)

# sparkline histograms not showing correctly, so avoiding them.
skim_without_charts(linelist)

# ## get information about each column in a dataset 
# summary(linelist)

summary(linelist$age_years)

summary(linelist$age_years)[[2]]            # return only the 2nd element
# equivalent, alternative to above by element name
# summary(linelist$age_years)[["1st Qu."]]  

linelist %>% 
  get_summary_stats(
    age, wt_kg, ht_cm, ct_blood, temp,  # columns to calculate for
    type = "common")                    # summary stats to return


linelist %>% tabyl(age_cat)

linelist %>% tabyl(age_cat, gender)

linelist %>%               # case linelist
  tabyl(age_cat) %>%       # tabulate counts and proportions by age category
  adorn_pct_formatting()   # convert proportions to percents

linelist %>%                                  
  tabyl(age_cat, gender) %>%                  # counts by age and gender
  adorn_totals(where = "row") %>%             # add total row
  adorn_percentages(denominator = "row") %>%  # convert counts to proportions
  adorn_pct_formatting(digits = 1)            # convert proportions to percents

linelist %>%                                  # case linelist
  tabyl(age_cat, gender) %>%                  # cross-tabulate counts
  adorn_totals(where = "row") %>%             # add a total row
  adorn_percentages(denominator = "col") %>%  # convert to proportions
  adorn_pct_formatting() %>%                  # convert to percents
  adorn_ns(position = "front") %>%            # display as: "count (percent)"
  adorn_title(                                # adjust titles
    row_name = "Age Category",
    col_name = "Gender")

linelist %>%
  tabyl(age_cat, gender) %>% 
  adorn_totals(where = "col") %>% 
  adorn_percentages(denominator = "col") %>% 
  adorn_pct_formatting() %>% 
  adorn_ns(position = "front") %>% 
  adorn_title(
    row_name = "Age Category",
    col_name = "Gender",
    placement = "combined") %>% # this is necessary to print as image
  flextable::flextable() %>%    # convert to pretty image
  flextable::autofit()          # format to one line per row 


linelist %>% 
  count(hospital) %>%   # dplyr function
  adorn_totals()        # janitor function

# linelist %>%
#   tabyl(age_cat, gender) %>% 
#   adorn_totals(where = "col") %>% 
#   adorn_percentages(denominator = "col") %>% 
#   adorn_pct_formatting() %>% 
#   adorn_ns(position = "front") %>% 
#   adorn_title(
#     row_name = "Age Category",
#     col_name = "Gender",
#     placement = "combined") %>% 
#   flextable::flextable() %>%                     # convert to image
#   flextable::autofit() %>%                       # ensure only one line per row
#   flextable::save_as_docx(path = "tabyl.docx")   # save as Word document to filepath

age_by_outcome <- linelist %>% 
  tabyl(age_cat, outcome, show_na = FALSE) 

chisq.test(age_by_outcome)

linelist %>%                 # begin with linelist
  summarise(n_rows = n())    # return new summary dataframe with column n_rows

linelist %>% 
  group_by(age_cat) %>%     # group data by unique values in column age_cat
  summarise(n_rows = n())   # return number of rows *per group*

linelist %>% 
  count(age_cat)

linelist %>% 
  count(age_cat, outcome)

age_summary <- linelist %>% 
  count(age_cat) %>%                     # group and count by gender (produces "n" column)
  mutate(                                # create percent of column - note the denominator
    percent = scales::percent(n / sum(n))) 

# print
age_summary

age_by_outcome <- linelist %>%                  # begin with linelist
  group_by(outcome) %>%                         # group by outcome 
  count(age_cat) %>%                            # group and count by age_cat, and then remove age_cat grouping
  mutate(percent = scales::percent(n / sum(n))) # calculate percent - note the denominator is by outcome group

linelist %>%                      # begin with linelist
  count(age_cat, outcome) %>%     # group and tabulate counts by two columns
  ggplot()+                       # pass new data frame to ggplot
    geom_col(                     # create bar plot
      mapping = aes(   
        x = outcome,              # map outcome to x-axis
        fill = age_cat,           # map age_cat to the fill
        y = n))                   # map the counts column `n` to the height

summary_table <- linelist %>%                                        # begin with linelist, save out as new object
  group_by(hospital) %>%                                             # group all calculations by hospital
  summarise(                                                         # only the below summary columns will be returned
    cases       = n(),                                                # number of rows per group
    delay_max   = max(days_onset_hosp, na.rm = T),                    # max delay
    delay_mean  = round(mean(days_onset_hosp, na.rm=T), digits = 1),  # mean delay, rounded
    delay_sd    = round(sd(days_onset_hosp, na.rm = T), digits = 1),  # standard deviation of delays, rounded
    delay_3     = sum(days_onset_hosp >= 3, na.rm = T),               # number of rows with delay of 3 or more days
    pct_delay_3 = scales::percent(delay_3 / cases)                    # convert previously-defined delay column to percent 
  )

summary_table  # print

linelist %>% 
  group_by(hospital) %>% 
  summarise(
    max_temp_fvr = max(temp[fever == "yes"], na.rm = T),
    max_temp_no = max(temp[fever == "no"], na.rm = T)
  )

summary_table %>% 
  mutate(delay = str_glue("{delay_mean} ({delay_sd})")) %>%  # combine and format other values
  select(-c(delay_mean, delay_sd)) %>%                       # remove two old columns   
  adorn_totals(where = "row") %>%                            # add total row
  select(                                                    # order and rename cols
    "Hospital Name"   = hospital,
    "Cases"           = cases,
    "Max delay"       = delay_max,
    "Mean (sd)"       = delay,
    "Delay 3+ days"   = delay_3,
    "% delay 3+ days" = pct_delay_3
    )

# get default percentile values of age (0%, 25%, 50%, 75%, 100%)
linelist %>% 
  reframe(age_percentiles = quantile(age_years, na.rm = TRUE))

# get manually-specified percentile values of age (5%, 50%, 75%, 98%)
linelist %>% 
  reframe(
    age_percentiles = quantile(
      age_years,
      probs = c(.05, 0.5, 0.75, 0.98), 
      na.rm=TRUE)
    )

# get manually-specified percentile values of age (5%, 50%, 75%, 98%)
linelist %>% 
  group_by(hospital) %>% 
  summarise(
    p05 = quantile(age_years, probs = 0.05, na.rm=T),
    p50 = quantile(age_years, probs = 0.5, na.rm=T),
    p75 = quantile(age_years, probs = 0.75, na.rm=T),
    p98 = quantile(age_years, probs = 0.98, na.rm=T)
    )

linelist %>% 
  group_by(hospital) %>% 
  rstatix::get_summary_stats(age, type = "quantile")

linelist %>% 
  rstatix::get_summary_stats(age, type = "quantile")

linelist_agg <- linelist %>% 
  drop_na(gender, outcome) %>% 
  count(outcome, gender)

linelist_agg

linelist_agg %>% 
  group_by(outcome) %>% 
  summarise(
    total_cases  = sum(n, na.rm=T),
    male_cases   = sum(n[gender == "m"], na.rm=T),
    female_cases = sum(n[gender == "f"], na.rm=T))

linelist %>% 
  group_by(outcome) %>% 
  summarise(across(.cols = c(age_years, temp, wt_kg, ht_cm),  # columns
                   .fns = ~ mean(.x, na.rm=T)))                                  # extra arguments

linelist %>% 
  group_by(outcome) %>% 
  summarise(across(.cols = c(age_years, temp, wt_kg, ht_cm), # columns
                   .fns = list("mean" = ~mean(.x, na.rm=T), "sd" = ~sd(.x, na.rm=T))))                                 # extra arguments

linelist %>% 
  group_by(outcome) %>% 
  summarise(across(
    .cols = where(is.numeric),  # all numeric columns in the data frame
    .fns = ~ mean(.x, na.rm=T)))

age_by_outcome <- linelist %>%                  # begin with linelist
  group_by(outcome) %>%                         # group by outcome 
  count(age_cat) %>%                            # group and count by age_cat, and then remove age_cat grouping
  mutate(percent = scales::percent(n / sum(n))) # calculate percent - note the denominator is by outcome group

age_by_outcome %>% 
  select(-percent) %>%   # keep only counts for simplicity
  pivot_wider(names_from = age_cat, values_from = n)  

linelist %>% 
  group_by(gender) %>%
  summarise(
    known_outcome = sum(!is.na(outcome)),           # Number of rows in group where outcome is not missing
    n_death  = sum(outcome == "Death", na.rm=T),    # Number of rows in group where outcome is Death
    n_recover = sum(outcome == "Recover", na.rm=T), # Number of rows in group where outcome is Recovered
  ) %>% 
  adorn_totals() %>%                                # Adorn total row (sums of each numeric column)
  adorn_percentages("col") %>%                      # Get column proportions
  adorn_pct_formatting() %>%                        # Convert proportions to percents
  adorn_ns(position = "front")                      # display % and counts (with counts in front)

by_hospital <- linelist %>% 
  filter(!is.na(outcome) & hospital != "Missing") %>%  # Remove cases with missing outcome or hospital
  group_by(hospital, outcome) %>%                      # Group data
  summarise(                                           # Create new summary columns of indicators of interest
    N = n(),                                            # Number of rows per hospital-outcome group     
    ct_value = median(ct_blood, na.rm=T))               # median CT value per group
  
by_hospital # print table

totals <- linelist %>% 
      filter(!is.na(outcome) & hospital != "Missing") %>%
      group_by(outcome) %>%                            # Grouped only by outcome, not by hospital    
      summarise(
        N = n(),                                       # These statistics are now by outcome only     
        ct_value = median(ct_blood, na.rm=T))

totals # print table

table_long <- bind_rows(by_hospital, totals) %>% 
  mutate(hospital = replace_na(hospital, "Total"))

table_long %>% 
  
  # Pivot wider and format
  ########################
  mutate(hospital = replace_na(hospital, "Total")) %>% 
  pivot_wider(                                         # Pivot from long to wide
    values_from = c(ct_value, N),                       # new values are from ct and count columns
    names_from = outcome) %>%                           # new column names are from outcomes
  mutate(                                              # Add new columns
    N_Known = N_Death + N_Recover,                               # number with known outcome
    Pct_Death = scales::percent(N_Death / N_Known, 0.1),         # percent cases who died (to 1 decimal)
    Pct_Recover = scales::percent(N_Recover / N_Known, 0.1)) %>% # percent who recovered (to 1 decimal)
  select(                                              # Re-order columns
    hospital, N_Known,                                   # Intro columns
    N_Recover, Pct_Recover, ct_value_Recover,            # Recovered columns
    N_Death, Pct_Death, ct_value_Death)  %>%             # Death columns
  arrange(N_Known)                                  # Arrange rows from lowest to highest (Total row at bottom)



linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL

border_style = officer::fp_border(color="black", width=1)

pacman::p_load(
  rio,            # import/export
  here,           # file pathways
  flextable,      # make pretty images of tables 
  officer,        # helper functions for tables
  tidyverse)      # data management, summary, and visualization

table <- linelist %>% 
  # filter
  ########
  #filter(!is.na(outcome) & hospital != "Missing") %>%  # Remove cases with missing outcome or hospital
  
  # Get summary values per hospital-outcome group
  ###############################################
  group_by(hospital, outcome) %>%                      # Group data
  summarise(                                           # Create new summary columns of indicators of interest
    N = n(),                                            # Number of rows per hospital-outcome group     
    ct_value = median(ct_blood, na.rm=T)) %>%           # median CT value per group
  
  # add totals
  ############
  bind_rows(                                           # Bind the previous table with this mini-table of totals
    linelist %>% 
      filter(!is.na(outcome) & hospital != "Missing") %>%
      group_by(outcome) %>%                            # Grouped only by outcome, not by hospital    
      summarise(
        N = n(),                                       # Number of rows for whole dataset     
        ct_value = median(ct_blood, na.rm=T))) %>%     # Median CT for whole dataset
  
  # Pivot wider and format
  ########################
  mutate(hospital = replace_na(hospital, "Total")) %>% 
  pivot_wider(                                         # Pivot from long to wide
    values_from = c(ct_value, N),                       # new values are from ct and count columns
    names_from = outcome) %>%                           # new column names are from outcomes
  mutate(                                              # Add new columns
    N_Known = N_Death + N_Recover,                               # number with known outcome
    Pct_Death = scales::percent(N_Death / N_Known, 0.1),         # percent cases who died (to 1 decimal)
    Pct_Recover = scales::percent(N_Recover / N_Known, 0.1)) %>% # percent who recovered (to 1 decimal)
  select(                                              # Re-order columns
    hospital, N_Known,                                   # Intro columns
    N_Recover, Pct_Recover, ct_value_Recover,            # Recovered columns
    N_Death, Pct_Death, ct_value_Death)  %>%             # Death columns
  arrange(N_Known) %>%                                 # Arrange rows from lowest to highest (Total row at bottom)

  # formatting
  ############
  flextable() %>% 
  add_header_row(
    top = TRUE,                # New header goes on top of existing header row
    values = c("Hospital",     # Header values for each column below
               "Total cases with known outcome", 
               "Recovered",    # This will be the top-level header for this and two next columns
               "",
               "",
               "Died",         # This will be the top-level header for this and two next columns
               "",             # Leave blank, as it will be merged with "Died"
               "")) %>% 
    set_header_labels(         # Rename the columns in original header row
      hospital = "", 
      N_Known = "",                  
      N_Recover = "Total",
      Pct_Recover = "% of cases",
      ct_value_Recover = "Median CT values",
      N_Death = "Total",
      Pct_Death = "% of cases",
      ct_value_Death = "Median CT values")  %>% 
  merge_at(i = 1, j = 3:5, part = "header") %>% # Horizontally merge columns 3 to 5 in new header row
  merge_at(i = 1, j = 6:8, part = "header") %>%  
  border_remove() %>%  
  theme_booktabs() %>% 
  vline(part = "all", j = 2, border = border_style) %>%   # at column 2 
  vline(part = "all", j = 5, border = border_style) %>%   # at column 5
  merge_at(i = 1:2, j = 1, part = "header") %>% 
  merge_at(i = 1:2, j = 2, part = "header") %>% 
  width(j=1, width = 2.7) %>% 
  width(j=2, width = 1.5) %>% 
  width(j=c(4,5,7,8), width = 1) %>% 
  flextable::align(., align = "center", j = c(2:8), part = "all") %>% 
  bg(., part = "body", bg = "gray95")  %>% 
  colformat_num(., j = c(4,7), digits = 1) %>% 
  bold(i = 1, bold = TRUE, part = "header") %>% 
  bold(i = 6, bold = TRUE, part = "body")


table

linelist %>% 
  select(age_years, gender, outcome, fever, temp, hospital) %>%  # keep only the columns of interest
  tbl_summary()                                                  # default

linelist %>% 
  select(age_years) %>%         # keep only columns of interest 
  tbl_summary(                  # create summary table
    statistic = age_years ~ "{mean}") # print mean of age

linelist %>% 
  select(age_years) %>%                       # keep only columns of interest 
  tbl_summary(                                # create summary table
    statistic = age_years ~ "({min}, {max})") # print min and max of age

linelist %>% 
  select(age_years, gender, outcome, fever, temp, hospital) %>% # keep only columns of interest
  tbl_summary(     
    by = outcome,                                               # stratify entire table by outcome
    statistic = list(all_continuous() ~ "{mean} ({sd})",        # stats and format for continuous columns
                     all_categorical() ~ "{n} / {N} ({p}%)"),   # stats and format for categorical columns
    digits = all_continuous() ~ 1,                              # rounding for continuous columns
    type   = all_categorical() ~ "categorical",                 # force all categorical levels to display
    label  = list(                                              # display labels for column names
      age_years ~ "Age (years)",
      gender    ~ "Gender",
      temp      ~ "Temperature",
      hospital  ~ "Hospital"),
    missing_text = "Missing"                                    # how missing values should display
  )

linelist %>% 
  select(age_years, temp) %>%                      # keep only columns of interest
  tbl_summary(                                     # create summary table
    type = all_continuous() ~ "continuous2",       # indicate that you want to print multiple statistics 
    statistic = all_continuous() ~ c(
      "{mean} ({sd})",                             # line 1: mean and SD
      "{median} ({p25}, {p75})",                   # line 2: median and IQR
      "{min}, {max}")                              # line 3: min and max
    )

table(linelist$outcome, useNA = "always")

age_by_outcome <- table(linelist$age_cat, linelist$outcome, useNA = "always") # save table as object
age_by_outcome   # print table

# get proportions of table defined above, by rows, rounded
prop.table(age_by_outcome, 1) %>% round(2)

addmargins(age_by_outcome)

table(fct_na_value_to_level(linelist$age_cat, level = "(Missing)"), fct_na_value_to_level(linelist$outcome, level = "(Missing)")) %>% 
  addmargins() %>% 
  as.data.frame.matrix() %>% 
  tibble::rownames_to_column(var = "Age Category") %>% 
  flextable::flextable()



# Chapter 18 - Simple statistical tests

pacman::p_load(
  rio,          # File import
  here,         # File locator
  skimr,        # get overview of data
  tidyverse,    # data management + ggplot2 graphics, 
  gtsummary,    # summary statistics and tests
  rstatix,      # statistics
  corrr,        # correlation analayis for numeric variables
  janitor,      # adding totals and percents to tables
  flextable     # converting tables to HTML
  )

# import the linelist into R
linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL

# # import the linelist
# linelist <- import("linelist_cleaned.rds")

## compare mean age by outcome group with a t-test
t.test(age_years ~ gender, data = linelist)

# t.test(df1$age_years, df2$age_years)

# t.test(linelist$age_years, mu = 45)

# shapiro.test(linelist$age_years)


## compare age distribution by outcome group with a wilcox test
wilcox.test(age_years ~ outcome, data = linelist)



## compare age distribution by outcome group with a kruskal-wallis test
kruskal.test(age_years ~ outcome, linelist)



## compare the proportions in each group with a chi-squared test
chisq.test(linelist$gender, linelist$outcome)


linelist %>%
  rstatix::get_summary_stats(age, temp)

linelist %>%
  group_by(hospital) %>%
  rstatix::get_summary_stats(age, temp, type = "common")

linelist %>% 
  t_test(age_years ~ gender)

linelist %>% 
  t_test(age_years ~ 1, mu = 30)

linelist %>% 
  group_by(gender) %>% 
  t_test(age_years ~ 1, mu = 18)

linelist %>% 
  head(500) %>%            # first 500 rows of case linelist, for example only
  shapiro_test(age_years)

linelist %>% 
  wilcox_test(age_years ~ gender)

linelist %>% 
  kruskal_test(age_years ~ outcome)

linelist %>% 
  tabyl(gender, outcome) %>% 
  select(-1) %>% 
  chisq_test()


linelist %>% 
  select(gender, outcome) %>%    # keep variables of interest
  tbl_summary(by = outcome) %>%  # produce summary table and specify grouping variable
  add_p()                        # specify what test to perform


linelist %>% 
  select(age_years, outcome) %>%             # keep variables of interest
  tbl_summary(                               # produce summary table
    statistic = age_years ~ "{mean} ({sd})", # specify what statistics to show
    by = outcome) %>%                        # specify the grouping variable
  add_p(age_years ~ "t.test")                # specify what tests to perform




linelist %>% 
  select(age_years, outcome) %>%                       # keep variables of interest
  tbl_summary(                                         # produce summary table
    statistic = age_years ~ "{median} ({p25}, {p75})", # specify what statistic to show (this is default so could remove)
    by = outcome) %>%                                  # specify the grouping variable
  add_p(age_years ~ "wilcox.test")                     # specify what test to perform (default so could leave brackets empty)




linelist %>% 
  select(age_years, outcome) %>%                       # keep variables of interest
  tbl_summary(                                         # produce summary table
    statistic = age_years ~ "{median} ({p25}, {p75})", # specify what statistic to show (default, so could remove)
    by = outcome) %>%                                  # specify the grouping variable
  add_p(age_years ~ "kruskal.test")                    # specify what test to perform




correlation_tab <- linelist %>% 
  select(generation, age, ct_blood, days_onset_hosp, wt_kg, ht_cm) %>%   # keep numeric variables of interest
  correlate()      # create correlation table (using default pearson)

correlation_tab    # print

## remove duplicate entries (the table above is mirrored) 
correlation_tab <- correlation_tab %>% 
  shave()

## view correlation table 
correlation_tab

## plot correlations 
rplot(correlation_tab)



# Chapter 19 - Univariate and multivariable regression

pacman::p_load(
  rio,          # File import
  here,         # File locator
  tidyverse,    # data management + ggplot2 graphics, 
  stringr,      # manipulate text strings 
  purrr,        # loop over objects in a tidy way
  gtsummary,    # summary statistics and tests 
  broom,        # tidy up results from regressions
  lmtest,       # likelihood-ratio tests
  parameters,   # alternative to tidy up results from regressions
  see          # alternative to visualise forest plots
  )

# import the linelist into R
linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL

# # import the linelist
# linelist <- import("linelist_cleaned.rds")

## define variables of interest 
explanatory_vars <- c("gender", "fever", "chills", "cough", "aches", "vomit")

## convert dichotomous variables to 0/1 
linelist <- linelist %>%  
  mutate(across(                                      
    .cols = all_of(c(explanatory_vars, "outcome")),  ## for each column listed and "outcome"
    .fns = ~case_when(                              
      . %in% c("m", "yes", "Death")   ~ 1,           ## recode male, yes and death to 1
      . %in% c("f", "no",  "Recover") ~ 0,           ## female, no and recover to 0
      TRUE                            ~ NA_real_)    ## otherwise set to missing
    )
  )

       
      

## add in age_category to the explanatory vars 
explanatory_vars <- c(explanatory_vars, "age_cat")

## drop rows with missing information for variables of interest 
linelist <- linelist %>% 
  drop_na(any_of(c("outcome", explanatory_vars)))


lm_results <- lm(ht_cm ~ age, data = linelist)

summary(lm_results)

tidy(lm_results)


## pull the regression points and observed data in to one dataset
points <- augment(lm_results)

## plot the data using age as the x-axis 
ggplot(points, aes(x = age)) + 
  ## add points for height 
  geom_point(aes(y = ht_cm)) + 
  ## add your regression line 
  geom_line(aes(y = .fitted), colour = "red")



## add your data to a plot 
 ggplot(linelist, aes(x = age, y = ht_cm)) + 
  ## show points
  geom_point() + 
  ## add a linear regression 
  geom_smooth(method = "lm", se = FALSE)

# # arguments for glm()
# glm(formula, family, data, weights, subset, ...)

model <- glm(outcome ~ age_cat, family = "binomial", data = linelist)
summary(model)

linelist %>% 
  mutate(age_cat = fct_relevel(age_cat, "20-29", after = 0)) %>% 
  glm(formula = outcome ~ age_cat, family = "binomial") %>% 
  summary()


model <- glm(outcome ~ age_cat, family = "binomial", data = linelist) %>% 
  tidy(exponentiate = TRUE, conf.int = TRUE) %>%        # exponentiate and produce CIs
  mutate(across(where(is.numeric), ~ round(.x, digits = 2)))  # round all numeric columns

counts_table <- linelist %>% 
  janitor::tabyl(age_cat, outcome)

combined <- counts_table %>%           # begin with table of counts
  bind_cols(., model) %>%              # combine with the outputs of the regression 
  select(term, 2:3, estimate,          # select and re-order cols
         conf.low, conf.high, p.value) %>% 
  mutate(across(where(is.numeric), ~ round(.x, digits = 2))) ## round to 2 decimal places

combined <- combined %>% 
  flextable::qflextable()

explanatory_vars %>% str_c("outcome ~ ", .)


models <- explanatory_vars %>%       # begin with variables of interest
  str_c("outcome ~ ", .) %>%         # combine each variable into formula ("outcome ~ variable of interest")
  
  # iterate through each univariate formula
  map(                               
    .f = ~glm(                       # pass the formulas one-by-one to glm()
      formula = as.formula(.x),      # within glm(), the string formula is .x
      family = "binomial",           # specify type of glm (logistic)
      data = linelist)) %>%          # dataset
  
  # tidy up each of the glm regression outputs from above
  map(
    .f = ~tidy(
      .x, 
      exponentiate = TRUE,           # exponentiate 
      conf.int = TRUE)) %>%          # return confidence intervals
  
  # collapse the list of regression outputs in to one data frame
  bind_rows() %>% 
  
  # round all numeric columns
  mutate(across(where(is.numeric), ~ round(.x, digits = 2)))


## for each explanatory variable
univ_tab_base <- explanatory_vars %>% 
  map(.f = 
    ~{linelist %>%                ## begin with linelist
        group_by(outcome) %>%     ## group data set by outcome
        count(.data[[.x]]) %>%    ## produce counts for variable of interest
        pivot_wider(              ## spread to wide format (as in cross-tabulation)
          names_from = outcome,
          values_from = n) %>% 
        drop_na(.data[[.x]]) %>%         ## drop rows with missings
        rename("variable" = .x) %>%      ## change variable of interest column to "variable"
        mutate(variable = as.character(variable))} ## convert to character, else non-dichotomous (categorical) variables come out as factor and cant be merged
      ) %>% 
  
  ## collapse the list of count outputs in to one data frame
  bind_rows() %>% 
  
  ## merge with the outputs of the regression 
  bind_cols(., models) %>% 
  
  ## only keep columns interested in 
  select(term, 2:3, estimate, conf.low, conf.high, p.value) %>% 
  
  ## round decimal places
  mutate(across(where(is.numeric), ~ round(.x, digits = 2)))



univ_tab <- linelist %>% 
  dplyr::select(explanatory_vars, outcome) %>% ## select variables of interest

  tbl_uvregression(                         ## produce univariate table
    method = glm,                           ## define regression want to run (generalised linear model)
    y = outcome,                            ## define outcome variable
    method.args = list(family = binomial),  ## define what type of glm want to run (logistic)
    exponentiate = TRUE                     ## exponentiate to produce odds ratios (rather than log odds)
  )

## view univariate results table 
univ_tab

mv_reg <- glm(outcome ~ gender + fever + chills + cough + aches + vomit + age_cat, family = "binomial", data = linelist)

summary(mv_reg)

# glm(outcome ~ gender + age_cat * fever, family = "binomial", data = linelist)


## run a regression with all variables of interest 
mv_reg <- explanatory_vars %>%  ## begin with vector of explanatory column names
  str_c(collapse = "+") %>%     ## combine all names of the variables of interest separated by a plus
  str_c("outcome ~ ", .) %>%    ## combine the names of variables of interest with outcome in formula style
  glm(family = "binomial",      ## define type of glm as logistic,
      data = linelist)          ## define your dataset

model1 <- glm(outcome ~ age_cat, family = "binomial", data = linelist)
model2 <- glm(outcome ~ age_cat + gender, family = "binomial", data = linelist)

lmtest::lrtest(model1, model2)

## choose a model using forward selection based on AIC
## you can also do "backward" or "both" by adjusting the direction
final_mv_reg <- mv_reg %>%
  step(direction = "forward", trace = FALSE)

options(scipen=999)


mv_tab_base <- final_mv_reg %>% 
  broom::tidy(exponentiate = TRUE, conf.int = TRUE) %>%  ## get a tidy dataframe of estimates 
  mutate(across(where(is.numeric), ~ round(.x, digits = 2)))          ## round 

## show results table of final regression 
mv_tab <- tbl_regression(final_mv_reg, exponentiate = TRUE)

mv_tab

## combine with univariate results 
tbl_merge(
  tbls = list(univ_tab, mv_tab),                          # combine
  tab_spanner = c("**Univariate**", "**Multivariable**")) # set header names

## combine univariate and multivariable tables 
left_join(univ_tab_base, mv_tab_base, by = "term") %>% 
  ## choose columns and rename them
  select( # new name =  old name
    "characteristic" = term, 
    "recovered"      = "0", 
    "dead"           = "1", 
    "univ_or"        = estimate.x, 
    "univ_ci_low"    = conf.low.x, 
    "univ_ci_high"   = conf.high.x,
    "univ_pval"      = p.value.x, 
    "mv_or"          = estimate.y, 
    "mvv_ci_low"     = conf.low.y, 
    "mv_ci_high"     = conf.high.y,
    "mv_pval"        = p.value.y 
  ) %>% 
  mutate(across(where(is.double), ~ round(.x, 2)))   



## remove the intercept term from your multivariable results
mv_tab_base %>% 
  
  #set order of levels to appear along y-axis
  mutate(term = fct_relevel(
    term,
    "vomit", "gender", "fever", "cough", "chills", "aches",
    "age_cat5-9", "age_cat10-14", "age_cat15-19", "age_cat20-29",
    "age_cat30-49", "age_cat50-69", "age_cat70+")) %>%
  
  # remove "intercept" row from plot
  filter(term != "(Intercept)") %>% 
  
  ## plot with variable on the y axis and estimate (OR) on the x axis
  ggplot(aes(x = estimate, y = term)) +
  
  ## show the estimate as a point
  geom_point() + 
  
  ## add in an error bar for the confidence intervals
  geom_errorbar(aes(xmin = conf.low, xmax = conf.high)) + 
  
  ## show where OR = 1 is for reference as a dashed line
  geom_vline(xintercept = 1, linetype = "dashed")
  

pacman::p_load(easystats)

## remove the intercept term from your multivariable results
final_mv_reg %>% 
  model_parameters(exponentiate = TRUE) %>% 
  plot()
  



# Chapter 20 - Missing data

pacman::p_load(
  rio,           # import/export
  tidyverse,     # data mgmt and viz
  naniar,        # assess and visualize missingness
  mice           # missing data imputation
)

# import the linelist into R
linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL

# # import the linelist
# linelist <- import("linelist_cleaned.rds")

# linelist <- linelist %>% 
#
#   # Create new "age_years" column from "age" column
#   mutate(age_years = case_when(
#     age_unit == "years"  ~ age,       # if age is given in years, assign original value
#     age_unit == "months" ~ age/12,    # if age is given in months, divide by 12
#     is.na(age_unit)      ~ age,       # if age UNIT is missing, assume years
#     TRUE                 ~ NA_real_)) # any other circumstance, assign missing

# z <- c(1, 22, NA, Inf, NaN, 5)
# max(z)                           # returns NA
# max(z, na.rm=T)                  # returns Inf
# max(z[is.finite(z)])             # returns 22

as.numeric(c("10", "20", "thirty", "40"))

my_vector <- c(25, NA, 10, NULL)  # define
my_vector                         # print

var(22)

my_vector <- c(1, 4, 56, NA, 5, NA, 22)
is.na(my_vector)
!is.na(my_vector)
sum(is.na(my_vector))

na.omit(my_vector)

# linelist %>% 
#   drop_na(case_id, date_onset, age) # drops rows missing values for any of these columns

my_vector <- c(1, 4, 56, NA, 5, NA, 22)

mean(my_vector)     

mean(my_vector, na.rm = TRUE)

# install and/or load package
pacman::p_load(naniar)

# percent of ALL data frame values that are missing
pct_miss(linelist)

# Percent of rows with any value missing
pct_miss_case(linelist)   # use n_complete() for counts

# Percent of rows that are complete (no values missing)  
pct_complete_case(linelist) # use n_complete() for counts

gg_miss_var(linelist, show_pct = TRUE)

linelist %>% 
  gg_miss_var(show_pct = TRUE, facet = outcome)

# Heatplot of missingness across the entire data frame  
vis_miss(linelist)

ggplot(
  data = linelist,
  mapping = aes(x = age_years, y = temp)) +     
  geom_miss_point()

gg_miss_fct(linelist, age_cat5)

gg_miss_fct(linelist, date_onset)

shadowed_linelist <- linelist %>% 
  bind_shadow()

names(shadowed_linelist)

ggplot(data = shadowed_linelist,          # data frame with shadow columns
  mapping = aes(x = date_hospitalisation, # numeric or date column
                colour = age_years_NA)) + # shadow column of interest
  geom_density()                          # plots the density curves

linelist %>%
  bind_shadow() %>%                # create the shows cols
  group_by(date_outcome_NA) %>%    # shadow col for stratifying
  summarise(across(
    .cols = age_years,             # variable of interest for calculations
    .fns = list("mean" = ~mean(.x, na.rm = TRUE),     # stats to calculate
                "sd" = ~sd(.x, na.rm = TRUE),
                "var" = ~var(.x, na.rm = TRUE),
                "min" = ~min(.x, na.rm = TRUE),
                "max" = ~max(.x, na.rm = TRUE))))                 # other arguments for the stat calculations

outcome_missing <- linelist %>%
  mutate(week = lubridate::floor_date(date_onset, "week")) %>%   # create new week column
  group_by(week) %>%                                             # group the rows by week
  summarise(                                                     # summarize each week
    n_obs = n(),                                                  # number of records
    
    outcome_missing = sum(is.na(outcome) | outcome == ""),        # number of records missing the value
    outcome_p_miss  = outcome_missing / n_obs,                    # proportion of records missing the value
  
    outcome_dead    = sum(outcome == "Death", na.rm=T),           # number of records as dead
    outcome_p_dead  = outcome_dead / n_obs) %>%                   # proportion of records as dead
  
  tidyr::pivot_longer(-week, names_to = "statistic") %>%         # pivot all columns except week, to long format for ggplot
  filter(stringr::str_detect(statistic, "_p_"))                  # keep only the proportion values

ggplot(data = outcome_missing)+
    geom_line(
      mapping = aes(x = week, y = value, group = statistic, color = statistic),
      linewidth = 2,
      stat = "identity")+
    labs(title = "Weekly outcomes",
         x = "Week",
         y = "Proportion of weekly records") + 
     scale_color_discrete(
       name = "",
       labels = c("Died", "Missing outcome"))+
    scale_y_continuous(breaks = c(seq(0,1,0.1)))+
  theme_minimal()+
  theme(legend.position = "bottom")

linelist %>% 
  drop_na() %>%     # remove rows with ANY missing values
  nrow()

linelist %>% 
  drop_na(date_onset) %>% # remove rows missing date_onset 
  nrow()

linelist %>% 
  drop_na(contains("date")) %>% # remove rows missing values in any "date" column 
  nrow()

# labs(
#   title = "",
#   y = "",
#   x = "",
#   caption  = stringr::str_glue(
#   "n = {nrow(central_data)} from Central Hospital;
#   {nrow(central_data %>% filter(is.na(date_onset)))} cases missing date of onset and not shown."))  

pacman::p_load(forcats)   # load package

linelist <- linelist %>% 
  mutate(gender = fct_na_value_to_level(gender, level = "Missing"))

levels(linelist$gender)

pacman::p_load(mice)

linelist <- linelist %>%
  mutate(temp_replace_na_with_mean = replace_na(temp, mean(temp, na.rm = T)))

linelist <- linelist %>%
  mutate(outcome_replace_na_with_death = replace_na(outcome, "Death"))

simple_temperature_model_fit <- lm(temp ~ fever + age_years, data = linelist)

#using our simple temperature model to predict values just for the observations where temp is missing
predictions_for_missing_temps <- predict(simple_temperature_model_fit,
                                        newdata = linelist %>% filter(is.na(temp))) 

model_dataset <- linelist %>%
  select(temp, fever, age_years)  

temp_imputed <- mice(model_dataset,
                            method = "norm.predict",
                            seed = 1,
                            m = 1,
                            print = F)

temp_imputed_values <- temp_imputed$imp$temp


#creating our simple dataset
disease <- tibble::tribble(
  ~quarter, ~year, ~cases,
  "Q1",    2000,    66013,
  "Q2",      NA,    69182,
  "Q3",      NA,    53175,
  "Q4",      NA,    21001,
  "Q1",    2001,    46036,
  "Q2",      NA,    58842,
  "Q3",      NA,    44568,
  "Q4",      NA,    50197)

#imputing the missing year values:
disease %>% fill(year)


#creating our slightly different dataset
disease <- tibble::tribble(
  ~quarter, ~year, ~cases,
  "Q1",      NA,    66013,
  "Q2",      NA,    69182,
  "Q3",      NA,    53175,
  "Q4",    2000,    21001,
  "Q1",      NA,    46036,
  "Q2",      NA,    58842,
  "Q3",      NA,    44568,
  "Q4",    2001,    50197)

#imputing the missing year values in the "up" direction:
disease %>% fill(year, .direction = "up")


# imputing missing values for all variables in our model_dataset, and creating 10 new imputed datasets
multiple_imputation = mice(
  model_dataset,
  seed = 1,
  m = 10,
  print = FALSE) 

model_fit <- with(multiple_imputation, lm(temp ~ age_years + fever))

base::summary(mice::pool(model_fit))



# Chapter 21 - Standardised rates

pacman::p_load(
     rio,                 # import/export data
     here,                # locate files
     stringr,             # cleaning characters and strings
     PHEindicatormethods, # alternative for rate standardisation
     tidyverse)           # data management and visualization

# # import demographics for country A directly from Github
# A_demo <- import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/standardization/country_demographics.csv")
#
# # import deaths for country A directly from Github
# A_deaths <- import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/standardization/deaths_countryA.csv")
#
# # import demographics for country B directly from Github
# B_demo <- import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/standardization/country_demographics_2.csv")
#
# # import deaths for country B directly from Github
# B_deaths <- import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/standardization/deaths_countryB.csv")
#
# # import demographics for country B directly from Github
# standard_pop_data <- import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/standardization/world_standard_population_by_sex.csv")
#

# Country A
A_demo <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/standardization/country_demographics.csv") %>%  # FIX: local file -> URL
     mutate(Country = "A") %>% 
     select(Country, everything()) %>% # re-arrange
     mutate(age_cat5 = str_replace_all(age_cat5, "\\+", "")) # remove + symbols

# # Country A
# A_demo <- import("country_demographics.csv")

# Country B
B_demo <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/standardization/country_demographics_2.csv") %>%  # FIX: local file -> URL
     mutate(Country = "B") %>% 
     select(Country, everything()) # re-arrange

# # Country B
# B_demo <- import("country_demographics_2.csv")

A_males <- c(224, 257, 251, 245, 334, 245, 154, 189, 334, 342, 565, 432, 543, 432, 245, 543, 234, 354) # for males of country A
B_males <- c(34, 37, 51, 145, 434, 120, 100, 143, 307, 354, 463, 639, 706, 232, 275, 543, 234, 274) # for males of country B
A_females <- c(194, 254, 232, 214, 316, 224, 163, 167, 354, 354, 463, 574, 493, 295, 175, 380, 177, 392) # for females of country A
B_females <- c(54, 24, 32, 154, 276, 254, 123, 164, 254, 354, 453, 654, 435, 354, 165, 432, 287, 395) # for females of country B

age_cat5 <- c("0-4", "5-9", "10-14", "15-19", "20-24", "25-29",  "30-34", "35-39", "40-44",
                                                                                "45-49", "50-54", "55-59",
                                                                                "60-64", "65-69", "70-74",
                                                                                "75-79", "80-84", "85")
A_deaths <- data.frame(Country = "A", AgeCat = age_cat5, Male = A_males, Female = A_females)
B_deaths <- data.frame(Country = "B", AgeCat = age_cat5, Male = B_males, Female = B_females)

# FIX: commented out, writes/reads local files
# rio::export(A_deaths, here::here("data", "standardization", "deaths_countryA.csv"))
# rio::export(B_deaths, here::here("data", "standardization", "deaths_countryB.csv"))

pop_countries <- A_demo %>%  # begin with country A dataset
     bind_rows(B_demo) %>%        # bind rows, because cols are identically named
     pivot_longer(                       # pivot longer
          cols = c(m, f),                   # columns to combine into one
          names_to = "Sex",                 # name for new column containing the category ("m" or "f") 
          values_to = "Population") %>%     # name for new column containing the numeric values pivoted
     mutate(Sex = recode(Sex,            # re-code values for clarity
          "m" = "Male",
          "f" = "Female"))

deaths_countries <- A_deaths %>%    # begin with country A deaths dataset
     bind_rows(B_deaths) %>%        # bind rows with B dataset, because cols are identically named
     pivot_longer(                  # pivot longer
          cols = c(Male, Female),        # column to transform into one
          names_to = "Sex",              # name for new column containing the category ("m" or "f") 
          values_to = "Deaths") %>%      # name for new column containing the numeric values pivoted
     rename(age_cat5 = AgeCat)      # rename for clarity

country_data <- pop_countries %>% 
     left_join(deaths_countries, by = c("Country", "age_cat5", "Sex"))

country_data <- country_data %>% 
  mutate(
    Country = fct_relevel(Country, "A", "B"),
      
    Sex = fct_relevel(Sex, "Male", "Female"),
        
    age_cat5 = fct_relevel(
      age_cat5,
      "0-4", "5-9", "10-14", "15-19",
      "20-24", "25-29",  "30-34", "35-39",
      "40-44", "45-49", "50-54", "55-59",
      "60-64", "65-69", "70-74",
      "75-79", "80-84", "85")) %>% 
          
  arrange(Country, age_cat5, Sex)


# Reference population
standard_pop_data <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/standardization/world_standard_population_by_sex.csv") %>%  # FIX: local file -> URL
     rename(age_cat5 = AgeGroup)

# # Reference population
# standard_pop_data <- import("world_standard_population_by_sex.csv")

# Remove specific string from column values
standard_pop_clean <- standard_pop_data %>%
     mutate(
          age_cat5 = str_replace_all(age_cat5, "years", ""),   # remove "year"
          age_cat5 = str_replace_all(age_cat5, "plus", ""),    # remove "plus"
          age_cat5 = str_replace_all(age_cat5, " ", "")) %>%   # remove " " space
     
     rename(pop = WorldStandardPopulation)   # change col name to "pop", as this is expected by dsr package

all_data <- left_join(country_data, standard_pop_clean, by=c("age_cat5", "Sex"))

# Calculate rates per country directly standardized for age and sex
mortality_ds_rate_phe <- all_data %>%
     group_by(Country) %>%
     PHEindicatormethods::phe_dsr(
          x = Deaths,                 # column with observed number of events
          n = Population,             # column with non-standard pops for each stratum
          stdpop = pop,               # standard populations for each stratum
          stdpoptype = "field")       # either "vector" for a standalone vector or "field" meaning std populations are in the data  

# Print table
knitr::kable(mortality_ds_rate_phe)

# Create reference population
refpopCountryB <- country_data %>% 
  filter(Country == "B") 

# Calculate rates for country A indirectly standardized by age and sex
mortality_is_rate_phe_A <- country_data %>%
     filter(Country == "A") %>%
     PHEindicatormethods::calculate_ISRate(
          x = Deaths,                 # column with observed number of events
          n = Population,             # column with non-standard pops for each stratum
          x_ref = refpopCountryB$Deaths,  # reference number of deaths for each stratum
          n_ref = refpopCountryB$Population)  # reference population for each stratum

# Print table
knitr::kable(mortality_is_rate_phe_A)



# Chapter 22 - Moving averages

pacman::p_load(
  tidyverse,      # for data management and viz
  slider,         # for calculating moving averages
  tidyquant       # for calculating moving averages within ggplot
)

# import the linelist into R
linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL

# # import the linelist
# linelist <- import("linelist_cleaned.xlsx")

# make dataset of daily counts
daily_counts <- linelist %>% 
  count(date_hospitalisation, name = "new_cases")

rolling <- daily_counts %>% 
  mutate(                                # create new columns
    # Using slide_dbl()
    ###################
    reg_7day = slide_dbl(
      new_cases,                         # calculate on new_cases
      .f = ~sum(.x, na.rm = T),          # function is sum() with missing values removed
      .before = 6),                      # window is the ROW and 6 prior ROWS
    
    # Using slide_index_dbl()
    #########################
    indexed_7day = slide_index_dbl(
        new_cases,                       # calculate on new_cases
        .i = date_hospitalisation,       # indexed with date_onset 
        .f = ~sum(.x, na.rm = TRUE),     # function is sum() with missing values removed
        .before = days(6))               # window is the DAY and 6 prior DAYS
    )


ggplot(data = rolling)+
  geom_line(mapping = aes(x = date_hospitalisation, y = indexed_7day), linewidth = 1)

grouped_roll <- linelist %>%

  count(hospital, date_hospitalisation, name = "new_cases") %>% 

  arrange(hospital, date_hospitalisation) %>%   # arrange rows by hospital and then by date
  
  group_by(hospital) %>%              # group by hospital 
    
  mutate(                             # rolling average  
    mean_7day_hosp = slide_index_dbl(
      .x = new_cases,                 # the count of cases per hospital-day
      .i = date_hospitalisation,      # index on date of admission
      .f = mean,                      # use mean()                   
      .before = days(6)               # use the day and the 6 days prior
      )
  )


ggplot(data = grouped_roll)+
  geom_col(                       # plot daly case counts as grey bars
    mapping = aes(
      x = date_hospitalisation,
      y = new_cases),
    fill = "grey",
    width = 1)+
  geom_line(                      # plot rolling average as line colored by hospital
    mapping = aes(
      x = date_hospitalisation,
      y = mean_7day_hosp,
      color = hospital),
    linewidth = 1)+
  facet_wrap(~hospital, ncol = 2)+ # create mini-plots per hospital
  theme_classic()+                 # simplify background  
  theme(legend.position = "none")+ # remove legend
  labs(                            # add plot labels
    title = "7-day rolling average of daily case incidence",
    x = "Date of admission",
    y = "Case incidence")

linelist %>% 
  count(date_onset) %>%                 # count cases per day
  drop_na(date_onset) %>%               # remove cases missing onset date
  ggplot(aes(x = date_onset, y = n))+   # start ggplot
    geom_line(                          # plot raw values
      linewidth = 1,
      alpha = 0.2                       # semi-transparent line
      )+             
    tidyquant::geom_ma(                 # plot moving average
      n = 7,           
      linewidth = 1,
      color = "blue")+ 
  theme_minimal()                       # simple background



# Chapter 23 - Time series and outbreak detection

pacman::p_load(rio,          # File import
               here,         # File locator
               tsibble,      # handle time series datasets
               slider,       # for calculating moving averages
               imputeTS,     # for filling in missing values
               feasts,       # for time series decomposition and autocorrelation
               ggtime,       # plots for tsibble objects
               forecast,     # fit sin and cosin terms to data (note: must load after feasts)
               trending,     # fit and assess models 
               tmaptools,    # for getting geocoordinates (lon/lat) based on place names
               ecmwfr,       # for interacting with copernicus sateliate CDS API
               stars,        # for reading in .nc (climate data) files
               units,        # for defining units of measurement (climate data)
               yardstick,    # for looking at model accuracy
               surveillance,  # for aberration detection
               tidyverse     # data management + ggplot2 graphics
               )

# import the counts into R
counts <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/time_series/campylobacter_germany.xlsx")  # FIX: local file -> URL

# # import the counts into R
# counts <- rio::import("campylobacter_germany.xlsx")


## ensure the date column is in the appropriate format
counts$date <- as.Date(counts$date)

## create a calendar week variable 
## fitting ISO definitons of weeks starting on a monday
counts <- counts %>% 
     mutate(epiweek = yearweek(date, week_start = 1))


#
# ## retrieve location coordinates
# coords <- geocode_OSM("Germany", geometry = "point")
#
# ## pull together long/lats in format for ERA-5 querying (bounding box) 
# ## (as just want a single point can repeat coords)
# request_coords <- str_glue_data(coords$coords, "{y}/{x}/{y}/{x}")
#
#
# ## Pulling data modelled from copernicus satellite (ERA-5 reanalysis)
# ## https://cds.climate.copernicus.eu/cdsapp#!/software/app-era5-explorer?tab=app
# ## https://github.com/bluegreen-labs/ecmwfr
#
# ## set up key for weather data 
# wf_set_key(user = "XXXXX",
#            key = "XXXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXX",
#            service = "cds") 
#
# ## run for each year of interest (otherwise server times out)
# for (i in 2002:2011) {
#
#   ## pull together a query 
#   ## see here for how to do: https://bluegreen-labs.github.io/ecmwfr/articles/cds_vignette.html#the-request-syntax
#   ## change request to a list using addin button above (python to list)
#   ## Target is the name of the output file!!
#   request <- request <- list(
#     product_type = "reanalysis",
#     format = "netcdf",
#     variable = c("2m_temperature", "total_precipitation"),
#     year = c(i),
#     month = c("01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"),
#     day = c("01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12",
#             "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24",
#             "25", "26", "27", "28", "29", "30", "31"),
#     time = c("00:00", "01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00",
#              "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00",
#              "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00"),
#     area = request_coords,
#     dataset_short_name = "reanalysis-era5-single-levels",
#     target = paste0("germany_weather", i, ".nc")
#   )
#
#   ## download the file and store it in the current working directory
#   file <- wf_request(user     = "XXXXX",  # user ID (for authentication)
#                      request  = request,  # the request
#                      transfer = TRUE,     # download the file
#                      path     = here::here("data", "Weather")) ## path to save the data
#   }
#

# FIX: not in book, downloads the weather files (stars cannot read URLs)
weather_dir <- file.path(tempdir(), "weather")
dir.create(weather_dir, showWarnings = FALSE)
for (yr in 2002:2011) {
  download.file(
    paste0("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/time_series/weather/germany_weather", yr, ".nc"),
    file.path(weather_dir, paste0("germany_weather", yr, ".nc")),
    mode = "wb")
}


## define path to weather folder 
file_paths <- list.files(
  weather_dir, # FIX: swapped in the temp folder from above
  full.names = TRUE)

## only keep those with the current name of interest 
file_paths <- file_paths[str_detect(file_paths, "germany")]

## read in all the files as a stars object 
data <- stars::read_stars(file_paths)

## change to a data frame 
temp_data <- as_tibble(data) %>% 
  ## add in variables and correct units
  mutate(
    ## create an calendar week variable 
    epiweek = tsibble::yearweek(time), 
    ## create a date variable (start of calendar week)
    date = as.Date(epiweek),
    ## change temperature from kelvin to celsius
    t2m = set_units(t2m, celsius), 
    ## change precipitation from metres to millimetres 
    tp  = set_units(tp, mm)) %>% 
  ## group by week (keep the date too though)
  group_by(epiweek, date) %>% 
  ## get the average per week
  summarise(t2m = as.numeric(mean(t2m)), 
            tp = as.numeric(mean(tp)))



## define time series object 
counts <- tsibble(counts, index = epiweek)



## plot a line graph of cases by week
ggplot(counts, aes(x = epiweek, y = case)) + 
     geom_line()


#
# ## get a vector of TRUE/FALSE whether rows are duplicates
# are_duplicated(counts, index = epiweek) 
#
# ## get a data frame of any duplicated rows 
# duplicates(counts, index = epiweek) 
#


## create a variable with missings instead of weeks with reporting issues
counts <- counts %>% 
     mutate(case_miss = if_else(
          ## if epiweek contains 52, 53, 1 or 2
          str_detect(epiweek, "W51|W52|W53|W01|W02"), 
          ## then set to missing 
          NA_real_, 
          ## otherwise keep the value in case
          case
     ))

## alternatively interpolate missings by linear trend 
## between two nearest adjacent points
counts <- counts %>% 
  mutate(case_int = imputeTS::na_interpolation(case_miss)
         )

## to check what values have been imputed compared to the original
ggplot_na_imputations(counts$case_miss, counts$case_int) + 
  ## make a traditional plot (with black axes and white background)
  theme_classic()



## create a moving average variable (deals with missings)
counts <- counts %>% 
     ## create the ma_4w variable 
     ## slide over each row of the case variable
     mutate(ma_4wk = slider::slide_dbl(case, 
                               ## for each row calculate the name
                               ~ mean(.x, na.rm = TRUE),
                               ## use the four previous weeks
                               .before = 4))

## make a quick visualisation of the difference 
ggplot(counts, aes(x = epiweek)) + 
     geom_line(aes(y = case)) + 
     geom_line(aes(y = ma_4wk), colour = "red")


## Function arguments
#####################
## x is a dataset
## counts is variable with count data or rates within x 
## start_week is the first week in your dataset
## period is how many units in a year 
## output is whether you want return spectral periodogram or the peak weeks
  ## "periodogram" or "weeks"

# Define function
periodogram <- function(x, 
                        counts, 
                        start_week = c(2002, 1), 
                        period = 52, 
                        output = "weeks") {
  

    ## make sure is not a tsibble, filter to project and only keep columns of interest
    prepare_data <- dplyr::as_tibble(x)
    
    # prepare_data <- prepare_data[prepare_data[[strata]] == j, ]
    prepare_data <- dplyr::select(prepare_data, {{counts}})
    
    ## create an intermediate "zoo" time series to be able to use with spec.pgram
    zoo_cases <- zoo::zooreg(prepare_data, 
                             start = start_week, frequency = period)
    
    ## get a spectral periodogram not using fast fourier transform 
    periodo <- spec.pgram(zoo_cases, fast = FALSE, plot = FALSE)
    
    ## return the peak weeks 
    periodo_weeks <- 1 / periodo$freq[order(-periodo$spec)] * period
    
    if (output == "weeks") {
      periodo_weeks
    } else {
      periodo
    }
    
}

## get spectral periodogram for extracting weeks with the highest frequencies 
## (checking of seasonality) 
periodo <- periodogram(counts, 
                       case_int, 
                       start_week = c(2002, 1),
                       output = "periodogram")

## pull spectrum and frequence in to a dataframe for plotting
periodo <- data.frame(periodo$freq, periodo$spec)

## plot a periodogram showing the most frequently occuring periodicity 
ggplot(data = periodo, 
                aes(x = 1/(periodo.freq/52),  y = log(periodo.spec))) + 
  geom_line() + 
  labs(x = "Period (Weeks)", y = "Log(density)")


## get a vector weeks in ascending order 
peak_weeks <- periodogram(counts, 
                          case_int, 
                          start_week = c(2002, 1), 
                          output = "weeks")



## decompose the counts dataset 
counts %>% 
  # using an additive classical decomposition model
  model(classical_decomposition(case_int, type = "additive")) %>% 
  ## extract the important information from the model
  components() %>% 
  ## generate a plot 
  autoplot()



## using the counts dataset
counts %>% 
  ## calculate autocorrelation using a full years worth of lags
  ACF(case_int, lag_max = 52) %>% 
  ## show a plot
  autoplot()

## using the counts data set 
counts %>% 
  ## calculate the partial autocorrelation using a full years worth of lags
  PACF(case_int, lag_max = 52) %>% 
  ## show a plot
  autoplot()



## test for independance 
Box.test(counts$case_int, type = "Ljung-Box")



## add in fourier terms using the epiweek and case_int variabless
counts$fourier <- select(counts, epiweek, case_int) %>% 
  fourier(K = 1)


## define the model you want to fit (negative binomial) 
model <- glm_nb_model(
  ## set number of cases as outcome of interest
  case_int ~
    ## use epiweek to account for the trend
    epiweek +
    ## use the fourier terms to account for seasonality
    fourier)

## fit your model using the counts dataset
fitted_model <- trending::fit(model, data.frame(counts))

## calculate confidence intervals and prediction intervals 
observed <- predict(fitted_model, simulate_pi = FALSE)

estimate_res <- data.frame(observed$result)

## plot your regression 
ggplot(data = estimate_res, aes(x = epiweek)) + 
  ## add in a line for the model estimate
  geom_line(aes(y = estimate),
            col = "Red") + 
  ## add in a band for the prediction intervals 
  geom_ribbon(aes(ymin = lower_pi, 
                  ymax = upper_pi), 
              alpha = 0.25) + 
  ## add in a line for your observed case counts
  geom_line(aes(y = case_int), 
            col = "black") + 
  ## make a traditional plot (with black axes and white background)
  theme_classic()




## calculate the residuals 
estimate_res <- estimate_res %>% 
  mutate(resid = fitted_model$result[[1]]$residuals)

## are the residuals fairly constant over time (if not: outbreaks? change in practice?)
estimate_res %>%
  ggplot(aes(x = epiweek, y = resid)) +
  geom_line() +
  geom_point() + 
  labs(x = "epiweek", y = "Residuals")

## is there autocorelation in the residuals (is there a pattern to the error?)  
estimate_res %>% 
  as_tsibble(index = epiweek) %>% 
  ACF(resid, lag_max = 52) %>% 
  autoplot()

## are residuals normally distributed (are under or over estimating?)  
estimate_res %>%
  ggplot(aes(x = resid)) +
  geom_histogram(binwidth = 100) +
  geom_rug() +
  labs(y = "count") 
  
## compare observed counts to their residuals 
  ## should also be no pattern 
estimate_res %>%
  ggplot(aes(x = estimate, y = resid)) +
  geom_point() +
  labs(x = "Fitted", y = "Residuals")

## formally test autocorrelation of the residuals
## H0 is that residuals are from a white-noise series (i.e. random)
## test for independence 
## if p value significant then non-random
Box.test(estimate_res$resid, type = "Ljung-Box")



## left join so that we only have the rows already existing in counts
## drop the date variable from temp_data (otherwise is duplicated)
counts <- left_join(counts, 
                    select(temp_data, -date),
                    by = "epiweek")



counts %>% 
  ## keep the variables we are interested 
  select(epiweek, case_int, t2m) %>% 
  ## change your data in to long format
  pivot_longer(
    ## use epiweek as your key
    !epiweek,
    ## move column names to the new "measure" column
    names_to = "measure", 
    ## move cell values to the new "values" column
    values_to = "value") %>% 
  ## create a plot with the dataset above
  ## plot epiweek on the x axis and values (counts/celsius) on the y 
  ggplot(aes(x = epiweek, y = value)) + 
    ## create a separate plot for temperate and case counts 
    ## let them set their own y-axes
    facet_grid(measure ~ ., scales = "free_y") +
    ## plot both as a line
    geom_line()



counts %>% 
  ## calculate cross-correlation between interpolated counts and temperature
  CCF(case_int, t2m,
      ## set the maximum lag to be 52 weeks
      lag_max = 52, 
      ## return the correlation coefficient 
      type = "correlation") %>% 
  ## arange in decending order of the correlation coefficient 
  ## show the most associated lags
  arrange(-ccf) %>% 
  ## only show the top ten 
  slice_head(n = 10)



counts <- counts %>% 
  ## create a new variable for temperature lagged by four weeks
  mutate(t2m_lag4 = lag(t2m, n = 4))



## define the model you want to fit (negative binomial) 
model <- glm_nb_model(
  ## set number of cases as outcome of interest
  case_int ~
    ## use epiweek to account for the trend
    epiweek +
    ## use the fourier terms to account for seasonality
    fourier + 
    ## use the temperature lagged by four weeks 
    t2m_lag4
    )

## fit your model using the counts dataset
fitted_model <- trending::fit(model, data.frame(counts))

## calculate confidence intervals and prediction intervals 
observed <- predict(fitted_model, simulate_pi = FALSE)



fitted_model %>% 
  ## extract original negative binomial regression
  get_fitted_model() #%>% 
  ## get a tidy dataframe of results
  #tidy(exponentiate = TRUE, 
  #     conf.int = TRUE)


estimate_res <- data.frame(observed$result)

## plot your regression 
ggplot(data = estimate_res, aes(x = epiweek)) + 
  ## add in a line for the model estimate
  geom_line(aes(y = estimate),
            col = "Red") + 
  ## add in a band for the prediction intervals 
  geom_ribbon(aes(ymin = lower_pi, 
                  ymax = upper_pi), 
              alpha = 0.25) + 
  ## add in a line for your observed case counts
  geom_line(aes(y = case_int), 
            col = "black") + 
  ## make a traditional plot (with black axes and white background)
  theme_classic()




## calculate the residuals 
estimate_res <- estimate_res %>% 
  mutate(resid = case_int - estimate)

## are the residuals fairly constant over time (if not: outbreaks? change in practice?)
estimate_res %>%
  ggplot(aes(x = epiweek, y = resid)) +
  geom_line() +
  geom_point() + 
  labs(x = "epiweek", y = "Residuals")

## is there autocorelation in the residuals (is there a pattern to the error?)  
estimate_res %>% 
  as_tsibble(index = epiweek) %>% 
  ACF(resid, lag_max = 52) %>% 
  autoplot()

## are residuals normally distributed (are under or over estimating?)  
estimate_res %>%
  ggplot(aes(x = resid)) +
  geom_histogram(binwidth = 100) +
  geom_rug() +
  labs(y = "count") 
  
## compare observed counts to their residuals 
  ## should also be no pattern 
estimate_res %>%
  ggplot(aes(x = estimate, y = resid)) +
  geom_point() +
  labs(x = "Fitted", y = "Residuals")

## formally test autocorrelation of the residuals
## H0 is that residuals are from a white-noise series (i.e. random)
## test for independence 
## if p value significant then non-random
Box.test(estimate_res$resid, type = "Ljung-Box")



## define start date (when observations began)
start_date <- min(counts$epiweek)

## define a cut-off week (end of baseline, start of prediction period)
cut_off <- yearweek("2010-12-31")

## define the last date interested in (i.e. end of prediction)
end_date <- yearweek("2011-12-31")

## find how many weeks in period (year) of interest
num_weeks <- as.numeric(end_date - cut_off)



## add in missing weeks till end of year 
counts <- counts %>%
  ## group by the region
  group_by_key() %>%
  ## for each group add rows from the highest epiweek to the end of year
  group_modify(~add_row(.,
                        epiweek = seq(max(.$epiweek) + 1, 
                                      end_date,
                                      by = 1)))




## define fourier terms (sincos) 
counts <- counts %>% 
  mutate(
    ## combine fourier terms for weeks prior to  and after 2010 cut-off date
    ## (nb. 2011 fourier terms are predicted)
    fourier = rbind(
      ## get fourier terms for previous years
      fourier(
        ## only keep the rows before 2011
        filter(counts, 
               epiweek <= cut_off), 
        ## include one set of sin cos terms 
        K = 1
        ), 
      ## predict the fourier terms for 2011 (using baseline data)
      fourier(
        ## only keep the rows before 2011
        filter(counts, 
               epiweek <= cut_off),
        ## include one set of sin cos terms 
        K = 1, 
        ## predict 52 weeks ahead
        h = num_weeks
        )
      )
    )


# split data for fitting and prediction
dat <- counts %>% 
  group_by(epiweek <= cut_off) %>%
  group_split()

## define the model you want to fit (negative binomial) 
model <- glm_nb_model(
  ## set number of cases as outcome of interest
  case_int ~
    ## use epiweek to account for the trend
    epiweek +
    ## use the furier terms to account for seasonality
    fourier
)

# define which data to use for fitting and which for predicting
fitting_data <- pluck(dat, 2)
pred_data <- pluck(dat, 1) %>% 
  select(case_int, epiweek, fourier)

# fit model 
fitted_model <- trending::fit(model, data.frame(fitting_data))

# get confint and estimates for fitted data
observed <- fitted_model %>% 
  predict(simulate_pi = FALSE)

# forecast with data want to predict with 
forecasts <- fitted_model %>% 
  predict(data.frame(pred_data), simulate_pi = FALSE)

## combine baseline and predicted datasets
observed <- bind_rows(observed$result, forecasts$result)



## plot your regression 
ggplot(data = observed, aes(x = epiweek)) + 
  ## add in a line for the model estimate
  geom_line(aes(y = estimate),
            col = "grey") + 
  ## add in a band for the prediction intervals 
  geom_ribbon(aes(ymin = lower_pi, 
                  ymax = upper_pi), 
              alpha = 0.25) + 
  ## add in a line for your observed case counts
  geom_line(aes(y = case_int), 
            col = "black") + 
  ## plot in points for the observed counts above expected
  geom_point(
    data = filter(observed, case_int > upper_pi), 
    aes(y = case_int), 
    colour = "red", 
    size = 2) + 
  ## add vertical line and label to show where forecasting started
  geom_vline(
           xintercept = as.Date(cut_off), 
           linetype = "dashed") + 
  annotate(geom = "text", 
           label = "Forecast", 
           x = cut_off, 
           y = max(observed$upper_pi) - 250, 
           angle = 90, 
           vjust = 1
           ) + 
  ## make a traditional plot (with black axes and white background)
  theme_classic()


## Cross validation: predicting week(s) ahead based on sliding window

## expand your data by rolling over in 52 week windows (before + after) 
## to predict 52 week ahead
## (creates longer and longer chains of observations - keeps older data)

## define window want to roll over
roll_window <- 52

## define weeks ahead want to predict 
weeks_ahead <- 52

## create a data set of repeating, increasingly long data
## label each data set with a unique id
## only use cases before year of interest (i.e. 2011)
case_roll <- counts %>% 
  filter(epiweek < cut_off) %>% 
  ## only keep the week and case counts variables
  select(epiweek, case_int) %>% 
    ## drop the last x observations 
    ## depending on how many weeks ahead forecasting 
    ## (otherwise will be an actual forecast to "unknown")
    slice(1:(n() - weeks_ahead)) %>%
    as_tsibble(index = epiweek) %>% 
    ## roll over each week in x after windows to create grouping ID 
    ## depending on what rolling window specify
    stretch_tsibble(.init = roll_window, .step = 1) %>% 
  ## drop the first couple - as have no "before" cases
  filter(.id > roll_window)


## for each of the unique data sets run the code below
forecasts <- purrr::map(unique(case_roll$.id), 
                        function(i) {
  
  ## only keep the current fold being fit 
  mini_data <- filter(case_roll, .id == i) %>% 
    as_tibble()
  
  ## create an empty data set for forecasting on 
  forecast_data <- tibble(
    epiweek = seq(max(mini_data$epiweek) + 1,
                  max(mini_data$epiweek) + weeks_ahead,
                  by = 1),
    case_int = rep.int(NA, weeks_ahead),
    .id = rep.int(i, weeks_ahead)
  )
  
  ## add the forecast data to the original 
  mini_data <- bind_rows(mini_data, forecast_data)
  
  ## define the cut off based on latest non missing count data 
  cv_cut_off <- mini_data %>% 
    ## only keep non-missing rows
    drop_na(case_int) %>% 
    ## get the latest week
    summarise(max(epiweek)) %>% 
    ## extract so is not in a dataframe
    pull()
  
  ## make mini_data back in to a tsibble
  mini_data <- tsibble(mini_data, index = epiweek)
  
  ## define fourier terms (sincos) 
  mini_data <- mini_data %>% 
    mutate(
    ## combine fourier terms for weeks prior to  and after cut-off date
    fourier = rbind(
      ## get fourier terms for previous years
      forecast::fourier(
        ## only keep the rows before cut-off
        filter(mini_data, 
               epiweek <= cv_cut_off), 
        ## include one set of sin cos terms 
        K = 1
        ), 
      ## predict the fourier terms for following year (using baseline data)
      fourier(
        ## only keep the rows before cut-off
        filter(mini_data, 
               epiweek <= cv_cut_off),
        ## include one set of sin cos terms 
        K = 1, 
        ## predict 52 weeks ahead
        h = weeks_ahead
        )
      )
    )
  
  
  # split data for fitting and prediction
  dat <- mini_data %>% 
    group_by(epiweek <= cv_cut_off) %>%
    group_split()

  ## define the model you want to fit (negative binomial) 
  model <- glm_nb_model(
    ## set number of cases as outcome of interest
    case_int ~
      ## use epiweek to account for the trend
      epiweek +
      ## use the furier terms to account for seasonality
      fourier
  )

  # define which data to use for fitting and which for predicting
  fitting_data <- pluck(dat, 2)
  pred_data <- pluck(dat, 1)
  
  # fit model 
  fitted_model <- trending::fit(model, fitting_data)
  
  # forecast with data want to predict with 
  forecasts <- fitted_model %>% 
    predict(data.frame(pred_data), simulate_pi = FALSE)
  forecasts <- data.frame(forecasts$result[[1]]) %>% 
       ## only keep the week and the forecast estimate
    select(epiweek, estimate)
    
  }
  )

## make the list in to a data frame with all the forecasts
forecasts <- bind_rows(forecasts)

## join the forecasts with the observed
forecasts <- left_join(forecasts, 
                       select(counts, epiweek, case_int),
                       by = "epiweek")

## using {yardstick} compute metrics
  ## RMSE: Root mean squared error
  ## MAE:  Mean absolute error	
  ## MASE: Mean absolute scaled error
  ## MAPE: Mean absolute percent error
model_metrics <- bind_rows(
  ## in your forcasted dataset compare the observed to the predicted
  rmse(forecasts, case_int, estimate), 
  mae( forecasts, case_int, estimate),
  mase(forecasts, case_int, estimate),
  mape(forecasts, case_int, estimate),
  ) %>% 
  ## only keep the metric type and its output
  select(Metric  = .metric, 
         Measure = .estimate) %>% 
  ## make in to wide format so can bind rows after
  pivot_wider(names_from = Metric, values_from = Measure)

## return model metrics 
model_metrics



## define surveillance time series object
## nb. you can include a denominator with the population object (see ?sts)
counts_sts <- sts(observed = counts$case_int[!is.na(counts$case_int)],
                  start = c(
                    ## subset to only keep the year from start_date 
                    as.numeric(str_sub(start_date, 1, 4)), 
                    ## subset to only keep the week from start_date
                    as.numeric(str_sub(start_date, 7, 8))), 
                  ## define the type of data (in this case weekly)
                  freq = 52)

## define the week range that you want to include (ie. prediction period)
## nb. the sts object only counts observations without assigning a week or 
## year identifier to them - so we use our data to define the appropriate observations
weekrange <- cut_off - start_date



## define control
ctrl <- list(
  ## define what time period that want threshold for (i.e. 2011)
  range = which(counts_sts@epoch > weekrange),
  b = 9, ## how many years backwards for baseline
  w = 2, ## rolling window size in weeks
  weightsThreshold = 2.58, ## reweighting past outbreaks (improved noufaily method - original suggests 1)
  ## pastWeeksNotIncluded = 3, ## use all weeks available (noufaily suggests drop 26)
  trend = TRUE,
  pThresholdTrend = 1, ## 0.05 normally, however 1 is advised in the improved method (i.e. always keep)
  thresholdMethod = "nbPlugin",
  populationOffset = TRUE
  )

## apply farrington flexible method
farringtonmethod <- farringtonFlexible(counts_sts, ctrl)

## create a new variable in the original dataset called threshold
## containing the upper bound from farrington 
## nb. this is only for the weeks in 2011 (so need to subset rows)
counts[which(counts$epiweek >= cut_off & 
               !is.na(counts$case_int)),
              "threshold"] <- farringtonmethod@upperbound


ggplot(counts, aes(x = epiweek)) + 
  ## add in observed case counts as a line
  geom_line(aes(y = case_int, colour = "Observed")) + 
  ## add in upper bound of aberration algorithm
  geom_line(aes(y = threshold, colour = "Alert threshold"), 
            linetype = "dashed", 
            linewidth = 1.5) +
  ## define colours
  scale_colour_manual(values = c("Observed" = "black", 
                                 "Alert threshold" = "red")) + 
  ## make a traditional plot (with black axes and white background)
  theme_classic() + 
  ## remove title of legend 
  theme(legend.title = element_blank())



## define control options
ctrl <- list(
  ## define what time period that want threshold for (i.e. 2011)
  range = which(counts_sts@epoch > weekrange),
  mu0 = list(S = 1,    ## number of fourier terms (harmonics) to include
  trend = TRUE,   ## whether to include trend or not
  refit = FALSE), ## whether to refit model after each alarm
  ## cARL = threshold for GLR statistic (arbitrary)
     ## 3 ~ middle ground for minimising false positives
     ## 1 fits to the 99%PI of glm.nb - with changes after peaks (threshold lowered for alert)
   c.ARL = 2,
   # theta = log(1.5), ## equates to a 50% increase in cases in an outbreak
   ret = "cases"     ## return threshold upperbound as case counts
  )

## apply the glrnb method
glrnbmethod <- glrnb(counts_sts, control = ctrl, verbose = FALSE)

## create a new variable in the original dataset called threshold
## containing the upper bound from glrnb 
## nb. this is only for the weeks in 2011 (so need to subset rows)
counts[which(counts$epiweek >= cut_off & 
               !is.na(counts$case_int)),
              "threshold_glrnb"] <- glrnbmethod@upperbound



ggplot(counts, aes(x = epiweek)) + 
  ## add in observed case counts as a line
  geom_line(aes(y = case_int, colour = "Observed")) + 
  ## add in upper bound of aberration algorithm
  geom_line(aes(y = threshold_glrnb, colour = "Alert threshold"), 
            linetype = "dashed", 
            linewidth = 1.5) +
  ## define colours
  scale_colour_manual(values = c("Observed" = "black", 
                                 "Alert threshold" = "red")) + 
  ## make a traditional plot (with black axes and white background)
  theme_classic() + 
  ## remove title of legend 
  theme(legend.title = element_blank())



## add in fourier terms using the epiweek and case_int variabless
counts$fourier <- select(counts, epiweek, case_int) %>% 
  as_tsibble(index = epiweek) %>% 
  fourier(K = 1)

## define intervention week 
intervention_week <- yearweek("2008-12-31")

## define variables for regression 
counts <- counts %>% 
  mutate(
    ## corresponds to t in the formula
      ## count of weeks (could probably also just use straight epiweeks var)
    # linear = row_number(epiweek), 
    ## corresponds to delta(t-t0) in the formula
      ## pre or post intervention period
    intervention = as.numeric(epiweek >= intervention_week), 
    ## corresponds to (t-t0)^+ in the formula
      ## count of weeks post intervention
      ## (choose the larger number between 0 and whatever comes from calculation)
    time_post = pmax(0, epiweek - intervention_week + 1))




## define the model you want to fit (negative binomial) 
model <- glm_nb_model(
  ## set number of cases as outcome of interest
  case_int ~
    ## use epiweek to account for the trend
    epiweek +
    ## use the furier terms to account for seasonality
    fourier + 
    ## add in whether in the pre- or post-period 
    intervention + 
    ## add in the time post intervention 
    time_post
    )

## fit your model using the counts dataset
fitted_model <- trending::fit(model, counts)

## calculate confidence intervals and prediction intervals 
observed <- predict(fitted_model, simulate_pi = FALSE)


#
# ## show estimates and percentage change in a table
# fitted_model %>% 
#   ## extract original negative binomial regression
#   get_model() %>% 
#   ## get a tidy dataframe of results
#   tidy(exponentiate = TRUE, 
#        conf.int = TRUE) %>% 
#   ## only keep the intervention value 
#   filter(term == "intervention") %>% 
#   ## change the IRR to percentage change for estimate and CIs 
#   mutate(
#     ## for each of the columns of interest - create a new column
#     across(
#       all_of(c("estimate", "conf.low", "conf.high")), 
#       ## apply the formula to calculate percentage change
#             .f = function(i) 100 * (i - 1), 
#       ## add a suffix to new column names with "_perc"
#       .names = "{.col}_perc")
#     ) %>% 
#   ## only keep (and rename) certain columns 
#   select("IRR" = estimate, 
#          "95%CI low" = conf.low, 
#          "95%CI high" = conf.high,
#          "Percentage change" = estimate_perc, 
#          "95%CI low (perc)" = conf.low_perc, 
#          "95%CI high (perc)" = conf.high_perc,
#          "p-value" = p.value)


estimate_res <- data.frame(observed$result)

ggplot(estimate_res, aes(x = epiweek)) + 
  ## add in observed case counts as a line
  geom_line(aes(y = case_int, colour = "Observed")) + 
  ## add in a line for the model estimate
  geom_line(aes(y = estimate, col = "Estimate")) + 
  ## add in a band for the prediction intervals 
  geom_ribbon(aes(ymin = lower_pi, 
                  ymax = upper_pi), 
              alpha = 0.25) + 
  ## add vertical line and label to show where forecasting started
  geom_vline(
           xintercept = as.Date(intervention_week), 
           linetype = "dashed") + 
  annotate(geom = "text", 
           label = "Intervention", 
           x = intervention_week, 
           y = max(observed$upper_pi), 
           angle = 90, 
           vjust = 1
           ) + 
  ## define colours
  scale_colour_manual(values = c("Observed" = "black", 
                                 "Estimate" = "red")) + 
  ## make a traditional plot (with black axes and white background)
  theme_classic()




# Chapter 24 - Epidemic modeling

# NOTE: dropped from the current handbook build (EpiNow2 changes), some of this may not run


## install and load packages
pacman::p_load(tidyverse, EpiNow2, EpiEstim, here, incidence2, epicontacts, rio, projections)

## load linelist
linelist <- import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL

## generate contacts
contacts <- linelist %>%
  transmute(
    from = infector,
    to = case_id
  ) %>%
  drop_na()

## generate epicontacts
epic <- make_epicontacts(
  linelist = linelist,
  contacts = contacts, 
  directed = TRUE
)

## ## estimate gamma generation time
## generation_time <- bootstrapped_dist_fit(
##   get_pairwise(epic, "date_infection"),
##   dist = "gamma",
##   max_value = 20,
##   bootstraps = 1
## )

## ## export for caching
## export(
##   generation_time,
##   here("data/cache/epidemic_models/generation_time.rds")
## )

## import cached generation time
generation_time <- import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/cache/epidemic_models/generation_time.rds")  # FIX: local file -> URL

## ## estimate incubation period
## incubation_period <- bootstrapped_dist_fit(
##   linelist$date_onset - linelist$date_infection,
##   dist = "lognormal",
##   max_value = 100,
##   bootstraps = 1
## )

## ## export for caching
## export(
##   incubation_period,
##   here("data/cache/epidemic_models/incubation_period.rds")
## )

## import cached incubation period
incubation_period <- import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/cache/epidemic_models/incubation_period.rds")  # FIX: local file -> URL

## get incidence from onset date
cases <- linelist %>%
  group_by(date = date_onset) %>%
  summarise(confirm = n())

## ## run epinow
## epinow_res <- epinow(
##   reported_cases = cases,
##   generation_time = generation_time,
##   delays = delay_opts(incubation_period),
##   target_folder = here("data/cache/epidemic_models"),
##   return_output = TRUE,
##   output = "samples",
##   verbose = TRUE,
##   stan = stan_opts(samples = 750, chains = 4),
##   horizon = 21
## )

## ## export for caching
## export(
##   epinow_res,
##   here("data/cache/epidemic_models/epinow_res.rds")
## )

## import cached epinow results
epinow_res <- import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/cache/epidemic_models/epinow_res.rds")  # FIX: local file -> URL

## plot summary figure
plot(epinow_res)


pacman::p_load(
   rio,          # File import
   here,         # File locator
   tidyverse,    # Data management + ggplot2 graphics
   epicontacts,  # Analysing transmission networks
   EpiNow2,      # Rt estimation
   EpiEstim,     # Rt estimation
   projections,  # Incidence projections
   incidence2,   # Handling incidence data
   epitrix,      # Useful epi functions
   distcrete     # Discrete delay distributions
)

# import the linelist into R
linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL

# # import the cleaned linelist
# linelist <- import("linelist_cleaned.rds")

# incubation_period_lit <- list(
#   mean = log(9.1),
#   mean_sd = log(0.1),
#   sd = log(7.3),
#   sd_sd = log(0.1),
#   max = 30
# )

# ## estimate incubation period
# incubation_period <- bootstrapped_dist_fit(
#   linelist$date_onset - linelist$date_infection,
#   dist = "lognormal",
#   max_value = 100,
#   bootstraps = 1
# )

# ## generate contacts
# contacts <- linelist %>%
#   transmute(
#     from = infector,
#     to = case_id
#   ) %>%
#   drop_na()
#
# ## generate epicontacts object
# epic <- make_epicontacts(
#   linelist = linelist,
#   contacts = contacts, 
#   directed = TRUE
# )

# ## estimate gamma generation time
# generation_time <- bootstrapped_dist_fit(
#   get_pairwise(epic, "date_infection"),
#   dist = "gamma",
#   max_value = 20,
#   bootstraps = 1
# )

# ## get incidence from onset dates
# cases <- linelist %>%
#   group_by(date = date_onset) %>%
#   summarise(confirm = n())

# ## run epinow
# epinow_res <- epinow(
#   reported_cases = cases,
#   generation_time = generation_time,
#   delays = delay_opts(incubation_period),
#   return_output = TRUE,
#   verbose = TRUE,
#   horizon = 21,
#   stan = stan_opts(samples = 750, chains = 4)
# )

## plot summary figure
plot(epinow_res)

## summary table
epinow_res$summary

# ## extract summary and convert to tibble
# estimates <- as_tibble(epinow_res$estimates$summarised)
# estimates

## show outputs
estimates <- as_tibble(epinow_res$estimates$summarised)
DT::datatable(
  estimates,
  rownames = FALSE,
  filter = "top",
  options = list(pageLength = 5, scrollX=T), class = 'white-space: nowrap'
)


## make wide df for median plotting
df_wide <- estimates %>%
  filter(
    variable %in% c("growth_rate", "R"),
    date < as.Date("2014-09-01")
  ) %>%
  ## convert growth rates to doubling times
  mutate(
    across(
      c(median, lower_90:upper_90),
      ~ case_when(
        variable == "growth_rate" ~ log(2)/.x,
        TRUE ~ .x
      )
    ),
    ## rename variable to reflect transformation
    variable = replace(variable, variable == "growth_rate", "doubling_time")
  )

## make long df for quantile plotting
df_long <- df_wide %>%
  ## here we match matching quantiles (e.g. lower_90 to upper_90)
  pivot_longer(
    lower_90:upper_90,
    names_to = c(".value", "quantile"),
    names_pattern = "(.+)_(.+)"
  )

## make plot
ggplot() +
  geom_ribbon(
    data = df_long,
    aes(x = date, ymin = lower, ymax = upper, alpha = quantile),
    color = NA
  ) +
  geom_line(
    data = df_wide,
    aes(x = date, y = median)
  ) +
  ## use label_parsed to allow subscript label
  facet_wrap(
    ~ variable,
    ncol = 1,
    scales = "free_y",
    labeller = as_labeller(c(R = "R[t]", doubling_time = "Doubling~time"), label_parsed),
    strip.position = 'left'
  ) +
  ## manually define quantile transparency
  scale_alpha_manual(
    values = c(`20` = 0.7, `50` = 0.4, `90` = 0.2),
    labels = function(x) paste0(x, "%")
  ) +
  labs(
    x = NULL,
    y = NULL,
    alpha = "Credibel\ninterval"
  ) +
  scale_x_date(
    date_breaks = "1 month",
    date_labels = "%b %d\n%Y"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    strip.background = element_blank(),
    strip.placement = 'outside'
  )


## get incidence from onset date
cases <- incidence2::incidence(linelist, date_index = "date_onset") %>% # get case counts by day
  tidyr::complete(date_index = seq.Date(                              # ensure all dates are represented
    from = min(date_index, na.rm = T),
    to = max(date_index, na.rm=T),
    by = "day"),
    fill = list(count = 0)) %>%                                       # convert NA counts to 0
  rename(I = count,                                                   # rename to names expected by estimateR
         dates = date_index)

## make config
config_lit <- make_config(
  mean_si = 12.0,
  std_si = 5.2
)


cases <- cases %>% 
     filter(!is.na(date))


#create a dataframe for the function estimate_R()
cases_incidence <- data.frame(dates = seq.Date(from = min(cases$dates),
                               to = max(cases$dates), 
                               by = 1))

cases_incidence <- left_join(cases_incidence, cases) %>% 
     select(dates, I) %>% 
     mutate(I = ifelse(is.na(I), 0, I))

epiestim_res_lit <- estimate_R(
  incid = cases_incidence,
  method = "parametric_si",
  config = config_lit
)

plot(epiestim_res_lit)

# ## generate contacts
# contacts <- linelist %>%
#   transmute(
#     from = infector,
#     to = case_id
#   ) %>%
#   drop_na()
#
# ## generate epicontacts object
# epic <- make_epicontacts(
#   linelist = linelist,
#   contacts = contacts, 
#   directed = TRUE
# )

## estimate gamma serial interval
serial_interval <- fit_disc_gamma(get_pairwise(epic, "date_onset"))

## make config
config_emp <- make_config(
  mean_si = serial_interval$mu,
  std_si = serial_interval$sd
)

## run epiestim
epiestim_res_emp <- estimate_R(
  incid = cases_incidence,
  method = "parametric_si",
  config = config_emp
)

## plot outputs
plot(epiestim_res_emp)


## define a vector of dates starting on June 1st
start_dates <- seq.Date(
  as.Date("2014-06-01"),
  max(cases$dates) - 7,
  by = 1
) %>%
  ## subtract the starting date to convert to numeric
  `-`(min(cases$dates)) %>%
  ## convert to integer
  as.integer()

## add six days for a one week sliding window
end_dates <- start_dates + 6
  
## make config
config_partial <- make_config(
  mean_si = 12.0,
  std_si = 5.2,
  t_start = start_dates,
  t_end = end_dates
)


## run epiestim
epiestim_res_partial <- estimate_R(
  incid = cases_incidence,
  method = "parametric_si",
  config = config_partial
)

## plot outputs
plot(epiestim_res_partial)



## make wide dataframe for median
df_wide <- epiestim_res_lit$R %>%
  rename_all(clean_labels) %>%
  rename(
    lower_95_r = quantile_0_025_r,
    lower_90_r = quantile_0_05_r,
    lower_50_r = quantile_0_25_r,
    upper_50_r = quantile_0_75_r,
    upper_90_r = quantile_0_95_r,
    upper_95_r = quantile_0_975_r,
    ) %>%
  mutate(
    ## extract the median date from t_start and t_end
    dates = epiestim_res_emp$dates[round(map2_dbl(t_start, t_end, median))],
    var = "R[t]"
  ) %>%
  ## merge in daily incidence data
  left_join(cases, "dates") %>%
  ## calculate risk across all r estimates
  mutate(
    across(
      lower_95_r:upper_95_r,
      ~ .x*I,
      .names = "{str_replace(.col, '_r', '_risk')}"
    )
  ) %>%
  ## seperate r estimates and risk estimates
  pivot_longer(
    contains("median"),
    names_to = c(".value", "variable"),
    names_pattern = "(.+)_(.+)"
  ) %>%
  ## assign factor levels
  mutate(variable = factor(variable, c("risk", "r")))

## make long dataframe from quantiles
df_long <- df_wide %>%
  select(-variable, -median) %>%
  ## seperate r/risk estimates and quantile levels
  pivot_longer(
    contains(c("lower", "upper")),
    names_to = c(".value", "quantile", "variable"),
    names_pattern = "(.+)_(.+)_(.+)"
  ) %>%
  mutate(variable = factor(variable, c("risk", "r")))

## make plot
ggplot() +
  geom_ribbon(
    data = df_long,
    aes(x = dates, ymin = lower, ymax = upper, alpha = quantile),
    color = NA
  ) +
  geom_line(
    data = df_wide,
    aes(x = dates, y = median),
    alpha = 0.2
  ) +
  ## use label_parsed to allow subscript label
  facet_wrap(
    ~ variable,
    ncol = 1,
    scales = "free_y",
    labeller = as_labeller(c(r = "R[t]", risk = "Transmission~potential"), label_parsed),
    strip.position = 'left'
  ) +
  ## manually define quantile transparency
  scale_alpha_manual(
    values = c(`50` = 0.7, `90` = 0.4, `95` = 0.2),
    labels = function(x) paste0(x, "%")
  ) +
  labs(
    x = NULL,
    y = NULL,
    alpha = "Credible\ninterval"
  ) +
  scale_x_date(
    date_breaks = "1 month",
    date_labels = "%b %d\n%Y"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    strip.background = element_blank(),
    strip.placement = 'outside'
  )
  


## define minimum date for plot
min_date <- as.Date("2015-03-01")

## extract summarised estimates
estimates <-  as_tibble(epinow_res$estimates$summarised)

## extract raw data on case incidence
observations <- as_tibble(epinow_res$estimates$observations) %>%
  filter(date > min_date)

## extract forecasted estimates of case numbers
df_wide <- estimates %>%
  filter(
    variable == "reported_cases",
    type == "forecast",
    date > min_date
  )

## convert to even longer format for quantile plotting
df_long <- df_wide %>%
  ## here we match matching quantiles (e.g. lower_90 to upper_90)
  pivot_longer(
    lower_90:upper_90,
    names_to = c(".value", "quantile"),
    names_pattern = "(.+)_(.+)"
  )

## make plot
ggplot() +
  geom_histogram(
    data = observations,
    aes(x = date, y = confirm),
    stat = 'identity',
    binwidth = 1
  ) +
  geom_ribbon(
    data = df_long,
    aes(x = date, ymin = lower, ymax = upper, alpha = quantile),
    color = NA
  ) +
  geom_line(
    data = df_wide,
    aes(x = date, y = median)
  ) +
  geom_vline(xintercept = min(df_long$date), linetype = 2) +
  ## manually define quantile transparency
  scale_alpha_manual(
    values = c(`20` = 0.7, `50` = 0.4, `90` = 0.2),
    labels = function(x) paste0(x, "%")
  ) +
  labs(
    x = NULL,
    y = "Daily reported cases",
    alpha = "Credible\ninterval"
  ) +
  scale_x_date(
    date_breaks = "1 month",
    date_labels = "%b %d\n%Y"
  ) +
  theme_minimal(base_size = 14)



## get shape and scale parameters from the mean mu and the coefficient of
## variation (e.g. the ratio of the standard deviation to the mean)
shapescale <- epitrix::gamma_mucv2shapescale(mu = 12.0, cv = 5.2/12)

## make distcrete object
serial_interval_lit <- distcrete::distcrete(
  name = "gamma",
  interval = 1,
  shape = shapescale$shape,
  scale = shapescale$scale
)



## check to make sure the serial interval looks correct
qplot(
  x = 0:50, y = serial_interval_lit$d(0:50), geom = "area",
  xlab = "Serial interval", ylab = "Density"
)


# ## generate contacts
# contacts <- linelist %>%
#   transmute(
#     from = infector,
#     to = case_id
#   ) %>%
#   drop_na()
#
# ## generate epicontacts object
# epic <- make_epicontacts(
#   linelist = linelist,
#   contacts = contacts, 
#   directed = TRUE
# )

## estimate gamma serial interval
serial_interval <- fit_disc_gamma(get_pairwise(epic, "date_onset"))

## inspect estimate
serial_interval[c("mu", "sd")]


## create incidence object from dates of onset
inc <- incidence::incidence(linelist$date_onset)

## extract plausible r values from most recent estimate
mean_r <- tail(epiestim_res_emp$R$`Mean(R)`, 1)
sd_r <- tail(epiestim_res_emp$R$`Std(R)`, 1)
shapescale <- gamma_mucv2shapescale(mu = mean_r, cv = sd_r/mean_r)
plausible_r <- rgamma(1000, shape = shapescale$shape, scale = shapescale$scale)

## check distribution
qplot(x = plausible_r, geom = "histogram", xlab = expression(R[t]), ylab = "Counts")



## make projection
proj <- project(
  x = inc,
  R = plausible_r,
  si = serial_interval$distribution,
  n_days = 21,
  n_sim = 1000
)



## plot incidence and projections
plot(inc[inc$dates > as.Date("2015-03-01")]) %>%
  add_projections(proj)


# ## convert to data frame for raw data
# proj_df <- as.data.frame(proj)
# proj_df


## convert to data frame for raw data
proj_df <- as.data.frame(proj)

## data table output
DT::datatable(
  proj_df[1:11],
  rownames = FALSE,
  filter = "top",
  options = list(pageLength = 10, scrollX=T), class = 'white-space: nowrap'
)




# Chapter 25 - Contact tracing

pacman::p_load(
  rio,          # importing data  
  here,         # relative file pathways  
  janitor,      # data cleaning and tables
  lubridate,    # working with dates
  epikit,       # age_categories() function
  apyramid,     # age pyramids
  tidyverse,    # data manipulation and visualization
  RColorBrewer, # color palettes
  formattable,  # fancy tables
  kableExtra    # table formatting
)

cases <- import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/godata/cases_clean.rds") %>%  # FIX: local file -> URL
  select(case_id, firstName, lastName, gender, age, age_class,
         occupation, classification, was_contact, hospitalization_typeid)

contacts <- import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/godata/contacts_clean.rds") %>%  # FIX: local file -> URL
  mutate(age_class = forcats::fct_rev(age_class)) %>% 
  select(contact_id, contact_status, firstName, lastName, gender, age,
         age_class, occupation, date_of_reporting, date_of_data_entry,
         date_of_last_exposure = date_of_last_contact,
         date_of_followup_start, date_of_followup_end, risk_level, was_case, admin_2_name) %>% 
  mutate(admin_2_name = replace_na(admin_2_name, "Djembe"))

followups <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/godata/followups_clean.rds") %>%  # FIX: local file -> URL
  select(contact_id, followup_status, followup_number,
         date_of_followup, admin_2_name, admin_1_name) %>% 
  mutate(followup_status = str_to_lower(followup_status))

relationships <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/godata/relationships_clean.rds") %>%  # FIX: local file -> URL
  select(source_visualid, source_gender, source_age, date_of_last_contact,
         date_of_data_entry, target_visualid, target_gender,
         target_age, exposure_type)

apyramid::age_pyramid(
  data = contacts,                                   # use contacts dataset
  age_group = "age_class",                           # categorical age column
  split_by = "gender") +                             # gender for halfs of pyramid
  labs(
    fill = "Gender",                                 # title of legend
    title = "Age/Sex Pyramid of COVID-19 contacts")+ # title of the plot
  theme_minimal()                                    # simple background

relation_age <- relationships %>% 
  select(source_age, target_age) %>% 
  transmute(                              # transmute is like mutate() but removes all other columns not mentioned
    source_age_class = epikit::age_categories(source_age, breakers = seq(0, 80, 5)),
    target_age_class = epikit::age_categories(target_age, breakers = seq(0, 80, 5)),
    ) %>% 
  pivot_longer(cols = contains("class"), names_to = "category", values_to = "age_class")  # pivot longer


relation_age

apyramid::age_pyramid(
  data = relation_age,                               # use modified relationship dataset
  age_group = "age_class",                           # categorical age column
  split_by = "category") +                           # by cases and contacts
  scale_fill_manual(
    values = c("orange", "purple"),                  # to specify colors AND labels
    labels = c("Case", "Contact"))+
  labs(
    fill = "Legend",                                           # title of legend
    title = "Age/Sex Pyramid of COVID-19 contacts and cases")+ # title of the plot
  theme_minimal()                                              # simple background

# Clean dataset and get counts by occupation
occ_plot_data <- cases %>% 
  mutate(occupation = forcats::fct_na_value_to_level(occupation, level = "(Missing)"),  # make NA missing values a category
         occupation = forcats::fct_infreq(occupation)) %>%   # order factor levels in order of frequency
  count(occupation)                                          # get counts by occupation
  
# Make pie chart
ggplot(data = occ_plot_data, mapping = aes(x = "", y = n, fill = occupation))+
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start = 0) +
  labs(
    fill = "Occupation",
    title = "Known occupations of COVID-19 cases")+
  theme_minimal() +                    
  theme(axis.line = element_blank(),
        axis.title = element_blank(),
        axis.text = element_blank())

contacts_per_case <- relationships %>% 
  count(source_visualid)

contacts_per_case

ggplot(data = contacts_per_case)+        # begin with count data frame created above
  geom_histogram(mapping = aes(x = n))+  # print histogram of number of contacts per case
  scale_y_continuous(expand = c(0,0))+   # remove excess space below 0 on y-axis
  theme_light()+                         # simplify background
  labs(
    title = "Number of contacts per case",
    y = "Cases",
    x = "Contacts per case"
  )
  


followups %>% 
  count(contact_id, date_of_followup) %>%   # get unique contact_days
  filter(n > 1)                             # view records where count is more than 1  

followups_clean <- followups %>%
  
  # De-duplicate
  group_by(contact_id, date_of_followup) %>%        # group rows per contact-day
  arrange(contact_id, desc(date_of_followup)) %>%   # arrange rows, per contact-day, by date of follow-up (most recent at top)
  slice_head() %>%                                  # keep only the first row per unique contact id  
  ungroup() %>% 
  
  # Other cleaning
  mutate(followup_number = replace(followup_number, followup_number > 14, NA)) %>% # clean erroneous data
  drop_na(contact_id)                               # remove rows with missing contact_id

followups_clean %>% 
  tabyl(followup_status)

ggplot(data = followups_clean)+
  geom_histogram(mapping = aes(x = date_of_followup, fill = followup_status)) +
  scale_fill_discrete(drop = FALSE)+   # show all factor levels (followup_status) in the legend, even those not used
  theme_classic() +
  labs(
    x = "",
    y = "Number of contacts",
    title = "Daily Contact Followup Status",
    fill = "Followup Status",
    subtitle = str_glue("Data as of {max(followups$date_of_followup, na.rm=T)}"))   # dynamic subtitle
  

ggplot(data = followups_clean)+
  geom_tile(mapping = aes(x = followup_number, y = contact_id, fill = followup_status),
            color = "grey")+       # grey gridlines
  scale_fill_manual( values = c("yellow", "grey", "orange", "darkred", "darkgreen"))+
  theme_minimal()+
  scale_x_continuous(breaks = seq(from = 1, to = 14, by = 1))


plot_by_region <- followups_clean %>%                                        # begin with follow-up dataset
  count(admin_1_name, admin_2_name, followup_status) %>%   # get counts by unique region-status (creates column 'n' with counts)
  
  # begin ggplot()
  ggplot(                                         # begin ggplot
    mapping = aes(x = reorder(admin_2_name, n),     # reorder admin factor levels by the numeric values in column 'n'
                  y = n,                            # heights of bar from column 'n'
                  fill = followup_status,           # color stacked bars by their status
                  label = n))+                      # to pass to geom_label()              
  geom_col()+                                     # stacked bars, mapping inherited from above 
  geom_text(                                      # add text, mapping inherited from above
    size = 3,                                         
    position = position_stack(vjust = 0.5), 
    color = "white",           
    check_overlap = TRUE,
    fontface = "bold")+
  coord_flip()+
  labs(
    x = "",
    y = "Number of contacts",
    title = "Contact Followup Status, by Region",
    fill = "Followup Status",
    subtitle = str_glue("Data as of {max(followups_clean$date_of_followup, na.rm=T)}")) +
  theme_classic()+                                                                      # Simplify background
  facet_wrap(~admin_1_name, strip.position = "right", scales = "free_y", ncol = 1)      # introduce facets 

plot_by_region

# Set "Report date" to simulate running the report with data "as of" this date
report_date <- as.Date("2020-06-10")

# Create follow-up data to reflect the report date.
table_data <- followups_clean %>% 
  filter(date_of_followup <= report_date)

followup_info <- table_data %>% 
  group_by(contact_id) %>% 
  summarise(
    date_last_record   = max(date_of_followup, na.rm=T),
    date_last_seen     = max(date_of_followup[followup_status %in% c("seen_ok", "seen_not_ok")], na.rm=T),
    status_last_record = followup_status[which(date_of_followup == date_last_record)]) %>% 
  ungroup()

contacts_info <- followup_info %>% 
  right_join(contacts, by = "contact_id") %>% 
  mutate(
    database_date       = max(date_last_record, na.rm=T),
    days_since_seen     = database_date - date_last_seen,
    days_since_exposure = database_date - date_of_last_exposure
    )

contacts_table <- contacts_info %>% 
  
  group_by(`Admin 2` = admin_2_name) %>%
  
  summarise(
    `Registered contacts` = n(),
    `Active contacts`     = sum(contact_status == "UNDER_FOLLOW_UP", na.rm=T),
    `In first week`       = sum(days_since_exposure < 8, na.rm=T),
    `In second week`      = sum(days_since_exposure >= 8 & days_since_exposure < 15, na.rm=T),
    `Became case`         = sum(contact_status == "BECAME_CASE", na.rm=T),
    `Lost to follow up`   = sum(days_since_seen >= 3, na.rm=T),
    `Never seen`          = sum(is.na(date_last_seen)),
    `Followed up - signs` = sum(status_last_record == "Seen_not_ok" & date_last_record == database_date, na.rm=T),
    `Followed up - no signs` = sum(status_last_record == "Seen_ok" & date_last_record == database_date, na.rm=T),
    `Not Followed up`     = sum(
      (status_last_record == "NOT_ATTEMPTED" | status_last_record == "NOT_PERFORMED") &
        date_last_record == database_date, na.rm=T)) %>% 
    
  arrange(desc(`Registered contacts`))


contacts_table %>%
  mutate(
    `Admin 2` = formatter("span", style = ~ formattable::style(
      color = ifelse(`Admin 2` == NA, "red", "grey"),
      font.weight = "bold",font.style = "italic"))(`Admin 2`),
    `Followed up - signs`= color_tile("white", "orange")(`Followed up - signs`),
    `Followed up - no signs`= color_tile("white", "#A0E2BD")(`Followed up - no signs`),
    `Became case`= color_tile("white", "grey")(`Became case`),
    `Lost to follow up`= color_tile("white", "grey")(`Lost to follow up`), 
    `Never seen`= color_tile("white", "red")(`Never seen`),
    `Active contacts` = color_tile("white", "#81A4CE")(`Active contacts`)
  ) %>%
  kable("html", escape = F, align =c("l","c","c","c","c","c","c","c","c","c","c")) %>%
  kable_styling("hover", full_width = FALSE) %>%
  add_header_above(c(" " = 3, 
                     "Of contacts currently under follow up" = 5,
                     "Status of last visit" = 3)) %>% 
  kableExtra::footnote(general = str_glue("Data are current to {format(report_date, '%b %d %Y')}"))


heatmap_ages <- relationships %>% 
  select(source_age, target_age) %>% 
  mutate(                              # transmute is like mutate() but removes all other columns
    source_age_class = epikit::age_categories(source_age, breakers = seq(0, 80, 5)),
    target_age_class = epikit::age_categories(target_age, breakers = seq(0, 80, 5))) 


cross_tab <- table(
  source_cases = heatmap_ages$source_age_class,
  target_cases = heatmap_ages$target_age_class)

cross_tab


long_prop <- data.frame(prop.table(cross_tab))



ggplot(data = long_prop)+       # use long data, with proportions as Freq
  geom_tile(                    # visualize it in tiles
    aes(
      x = target_cases,         # x-axis is case age
      y = source_cases,     # y-axis is infector age
      fill = Freq))+            # color of the tile is the Freq column in the data
  scale_fill_gradient(          # adjust the fill color of the tiles
    low = "blue",
    high = "orange")+
  theme(axis.text.x = element_text(angle = 90))+
  labs(                         # labels
    x = "Target case age",
    y = "Source case age",
    title = "Who infected whom",
    subtitle = "Frequency matrix of transmission events",
    fill = "Proportion of all\ntranmsission events"     # legend title
  )




# Chapter 26 - Survey analysis


## load packages from CRAN
pacman::p_load(rio,          # File import
               here,         # File locator
               tidyverse,    # data management + ggplot2 graphics
               tsibble,      # handle time series datasets
               survey,       # for survey functions
               srvyr,        # dplyr wrapper for survey package
               gtsummary,    # wrapper for survey package to produce tables
               apyramid,     # a package dedicated to creating age pyramids
               patchwork,    # for combining ggplots
               ggforce       # for alluvial/sankey plots
               ) 

## load packages from github
pacman::p_load_gh(
     "R4EPI/sitrep"          # for observation time / weighting functions
)


# import the survey into R
survey_data <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/surveys/survey_data.xlsx")  # FIX: local file -> URL

# import the dictionary into R
survey_dict <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/surveys/survey_dict.xlsx")  # FIX: local file -> URL

# import the population in to R 
population <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/surveys/population.xlsx")  # FIX: local file -> URL

# # import the survey data
# survey_data <- rio::import("survey_data.xlsx")
#
# # import the dictionary into R
# survey_dict <- rio::import("survey_dict.xlsx") 

# # import the population data
# population <- rio::import("population.xlsx")


## define the number of households in each cluster
cluster_counts <- tibble(cluster = c("village_1", "village_2", "village_3", "village_4", 
                                     "village_5", "village_6", "village_7", "village_8",
                                     "village_9", "village_10"), 
                         households = c(700, 400, 600, 500, 300, 
                                        800, 700, 400, 500, 500))



## select the date variable names from the dictionary 
DATEVARS <- survey_dict %>% 
  filter(type == "date") %>% 
  filter(name %in% names(survey_data)) %>% 
  ## filter to match the column names of your data
  pull(name) # select date vars
  
## change to dates 
survey_data <- survey_data %>%
  mutate(across(all_of(DATEVARS), as.Date))


## add those with only age in months to the year variable (divide by twelve)
survey_data <- survey_data %>% 
  mutate(age_years = if_else(is.na(age_years), 
                             age_months / 12, 
                             age_years))

## define age group variable
survey_data <- survey_data %>% 
     mutate(age_group = age_categories(age_years, 
                                    breakers = c(0, 3, 15, 30, 45)
                                    ))


## create a character variable based off groups of a different variable 
survey_data <- survey_data %>% 
  mutate(health_district = case_when(
    cluster_number %in% c(1:5) ~ "district_a", 
    TRUE ~ "district_b"
  ))


## select the yes/no variable names from the dictionary 
YNVARS <- survey_dict %>% 
  filter(type == "yn") %>% 
  filter(name %in% names(survey_data)) %>% 
  ## filter to match the column names of your data
  pull(name) # select yn vars
  
## change to dates 
survey_data <- survey_data %>%
  mutate(across(all_of(YNVARS), 
                ~ str_detect(.x, pattern = "yes")))


#
# ## join the individual and household data to form a complete data set
# survey_data <- left_join(survey_data_hh, 
#                          survey_data_indiv,
#                          by = c("_index" = "_parent_index"))
#
#
# ## create a unique identifier by combining indeces of the two levels 
# survey_data <- survey_data %>% 
#      mutate(uid = str_glue("{index}_{index_y}"))
#


## set the start/end of recall period
## can be changed to date variables from dataset 
## (e.g. arrival date & date questionnaire)
survey_data <- survey_data %>% 
  mutate(recall_start = as.Date("2018-01-01"), 
         recall_end   = as.Date("2018-05-01")
  )


# set inappropriate dates to NA based on rules 
## e.g. arrivals before start, departures departures after end
survey_data <- survey_data %>%
      mutate(
           arrived_date = if_else(arrived_date < recall_start, 
                                 as.Date(NA),
                                  arrived_date),
           birthday_date = if_else(birthday_date < recall_start,
                                  as.Date(NA),
                                  birthday_date),
           left_date = if_else(left_date > recall_end,
                              as.Date(NA),
                               left_date),
           death_date = if_else(death_date > recall_end,
                               as.Date(NA),
                               death_date)
           )



## create new variables for start and end dates/causes
survey_data <- survey_data %>% 
     ## choose earliest date entered in survey
     ## from births, household arrivals, and camp arrivals 
     find_start_date("birthday_date",
                  "arrived_date",
                  period_start = "recall_start",
                  period_end   = "recall_end",
                  datecol      = "startdate",
                  datereason   = "startcause" 
                 ) %>%
     ## choose earliest date entered in survey
     ## from camp departures, death and end of the study
     find_end_date("left_date",
                "death_date",
                period_start = "recall_start",
                period_end   = "recall_end",
                datecol      = "enddate",
                datereason   = "endcause" 
               )


## label those that were present at the start/end (except births/deaths)
survey_data <- survey_data %>% 
     mutate(
       ## fill in start date to be the beginning of recall period (for those empty) 
       startdate = if_else(is.na(startdate), recall_start, startdate), 
       ## set the start cause to present at start if equal to recall period 
       ## unless it is equal to the birth date 
       startcause = if_else(startdate == recall_start & startcause != "birthday_date",
                              "Present at start", startcause), 
       ## fill in end date to be end of recall period (for those empty) 
       enddate = if_else(is.na(enddate), recall_end, enddate), 
       ## set the end cause to present at end if equall to recall end 
       ## unless it is equal to the death date
       endcause = if_else(enddate == recall_end & endcause != "death_date", 
                            "Present at end", endcause))


## Define observation time in days
survey_data <- survey_data %>% 
  mutate(obstime = as.numeric(enddate - startdate))



## store the cases that you drop so you can describe them (e.g. non-consenting 
## or wrong village/cluster)
dropped <- survey_data %>% 
  filter(!consent | is.na(startdate) | is.na(enddate) | village_name == "other")

## use the dropped cases to remove the unused rows from the survey data set  
survey_data <- anti_join(survey_data, dropped, by = names(dropped))



# stratified ------------------------------------------------------------------
# create a variable called "surv_weight_strata"
# contains weights for each individual - by age group, sex and health district
survey_data <- add_weights_strata(x = survey_data,
                                         p = population,
                                         surv_weight = "surv_weight_strata",
                                         surv_weight_ID = "surv_weight_ID_strata",
                                         age_group, sex, health_district)

## cluster ---------------------------------------------------------------------

# get the number of people of individuals interviewed per household
# adds a variable with counts of the household (parent) index variable
survey_data <- survey_data %>%
  add_count(index, name = "interviewed")


## create cluster weights
survey_data <- add_weights_cluster(x = survey_data,
                                          cl = cluster_counts,
                                          eligible = member_number,
                                          interviewed = interviewed,
                                          cluster_x = village_name,
                                          cluster_cl = cluster,
                                          household_x = index,
                                          household_cl = households,
                                          surv_weight = "surv_weight_cluster",
                                          surv_weight_ID = "surv_weight_ID_cluster",
                                          ignore_cluster = FALSE,
                                          ignore_household = FALSE)


# stratified and cluster ------------------------------------------------------
# create a survey weight for cluster and strata
survey_data <- survey_data %>%
  mutate(surv_weight_cluster_strata = surv_weight_strata * surv_weight_cluster)



# simple random ---------------------------------------------------------------
base_survey_design_simple <- svydesign(ids = ~1, # 1 for no cluster ids
                   weights = NULL,               # No weight added
                   strata = NULL,                # sampling was simple (no strata)
                   data = survey_data            # have to specify the dataset
                  )

## stratified ------------------------------------------------------------------
base_survey_design_strata <- svydesign(ids = ~1,  # 1 for no cluster ids
                   weights = ~surv_weight_strata, # weight variable created above
                   strata = ~health_district,     # sampling was stratified by district
                   data = survey_data             # have to specify the dataset
                  )

# cluster ---------------------------------------------------------------------
base_survey_design_cluster <- svydesign(ids = ~village_name, # cluster ids
                   weights = ~surv_weight_cluster, # weight variable created above
                   strata = NULL,                 # sampling was simple (no strata)
                   data = survey_data              # have to specify the dataset
                  )

# stratified cluster ----------------------------------------------------------
base_survey_design <- svydesign(ids = ~village_name,      # cluster ids
                   weights = ~surv_weight_cluster_strata, # weight variable created above
                   strata = ~health_district,             # sampling was stratified by district
                   data = survey_data                     # have to specify the dataset
                  )

## simple random ---------------------------------------------------------------
survey_design_simple <- survey_data %>% 
  as_survey_design(ids = 1, # 1 for no cluster ids 
                   weights = NULL, # No weight added
                   strata = NULL # sampling was simple (no strata)
                  )
## stratified ------------------------------------------------------------------
survey_design_strata <- survey_data %>%
  as_survey_design(ids = 1, # 1 for no cluster ids
                   weights = surv_weight_strata, # weight variable created above
                   strata = health_district # sampling was stratified by district
                  )
## cluster ---------------------------------------------------------------------
survey_design_cluster <- survey_data %>%
  as_survey_design(ids = village_name, # cluster ids
                   weights = surv_weight_cluster, # weight variable created above
                   strata = NULL # sampling was simple (no strata)
                  )

## stratified cluster ----------------------------------------------------------
survey_design <- survey_data %>%
  as_survey_design(ids = village_name, # cluster ids
                   weights = surv_weight_cluster_strata, # weight variable created above
                   strata = health_district # sampling was stratified by district
                  )


## counts and props of the study population
ag <- survey_data %>% 
  group_by(age_group) %>% 
  drop_na(age_group) %>% 
  tally() %>% 
  mutate(proportion = n / sum(n), 
         n_total = sum(n))

## counts and props of the source population
propcount <- population %>% 
  group_by(age_group) %>%
    tally(population) %>%
    mutate(proportion = n / sum(n))

## bind together the columns of two tables, group by age, and perform a 
## binomial test to see if n/total is significantly different from population
## proportion.
  ## suffix here adds to text to the end of columns in each of the two datasets
left_join(ag, propcount, by = "age_group", suffix = c("", "_pop")) %>%
  group_by(age_group) %>%
  ## broom::tidy(binom.test()) makes a data frame out of the binomial test and
  ## will add the variables p.value, parameter, conf.low, conf.high, method, and
  ## alternative. We will only use p.value here. You can include other
  ## columns if you want to report confidence intervals
  mutate(binom = list(broom::tidy(binom.test(n, n_total, proportion_pop)))) %>%
  unnest(cols = c(binom)) %>% # important for expanding the binom.test data frame
  mutate(proportion_pop = proportion_pop * 100) %>%
  ## Adjusting the p-values to correct for false positives 
  ## (because testing multiple age groups). This will only make 
  ## a difference if you have many age categories
  mutate(p.value = p.adjust(p.value, method = "holm")) %>%
                      
  ## Only show p-values over 0.001 (those under report as <0.001)
  mutate(p.value = ifelse(p.value < 0.001, 
                          "<0.001", 
                          as.character(round(p.value, 3)))) %>% 
  
  ## rename the columns appropriately
  select(
    "Age group" = age_group,
    "Study population (n)" = n,
    "Study population (%)" = proportion,
    "Source population (n)" = n_pop,
    "Source population (%)" = proportion_pop,
    "P-value" = p.value
  )


## define x-axis limits and labels ---------------------------------------------
## (update these numbers to be the values for your graph)
max_prop <- 35      # choose the highest proportion you want to show 
step <- 5           # choose the space you want beween labels 

## this part defines vector using the above numbers with axis breaks
breaks <- c(
    seq(max_prop/100 * -1, 0 - step/100, step/100), 
    0, 
    seq(0 + step / 100, max_prop/100, step/100)
    )

## this part defines vector using the above numbers with axis limits
limits <- c(max_prop/100 * -1, max_prop/100)

## this part defines vector using the above numbers with axis labels
labels <-  c(
      seq(max_prop, step, -step), 
      0, 
      seq(step, max_prop, step)
    )


## create plots individually  --------------------------------------------------

## plot the source population 
## nb: this needs to be collapsed for the overall population (i.e. removing health districts)
source_population <- population %>%
  ## ensure that age and sex are factors
  mutate(age_group = factor(age_group, 
                            levels = c("0-2", 
                                       "3-14", 
                                       "15-29",
                                       "30-44", 
                                       "45+")), 
         sex = factor(sex)) %>% 
  group_by(age_group, sex) %>% 
  ## add the counts for each health district together 
  summarise(population = sum(population)) %>% 
  ## remove the grouping so can calculate overall proportion
  ungroup() %>% 
  mutate(proportion = population / sum(population)) %>% 
  ## plot pyramid 
  age_pyramid(
            age_group = age_group, 
            split_by = sex, 
            count = proportion, 
            proportional = TRUE) +
  ## only show the y axis label (otherwise repeated in all three plots)
  labs(title = "Source population", 
       y = "", 
       x = "Age group (years)") + 
  ## make the x axis the same for all plots 
  scale_y_continuous(breaks = breaks, 
    limits = limits, 
    labels = labels)
  
  
## plot the unweighted sample population 
sample_population <- age_pyramid(survey_data, 
                 age_group = "age_group", 
                 split_by = "sex",
                 proportion = TRUE) + 
  ## only show the x axis label (otherwise repeated in all three plots)
  labs(title = "Unweighted sample population", 
       y = "Proportion (%)", 
       x = "") + 
  ## make the x axis the same for all plots 
  scale_y_continuous(breaks = breaks, 
    limits = limits, 
    labels = labels)


## plot the weighted sample population 
weighted_population <- survey_design %>% 
  ## make sure the variables are factors
  mutate(age_group = factor(age_group), 
         sex = factor(sex)) %>%
  age_pyramid(
    age_group = "age_group",
    split_by = "sex", 
    proportion = TRUE) +
  ## only show the x axis label (otherwise repeated in all three plots)
  labs(title = "Weighted sample population", 
       y = "", 
       x = "")  + 
  ## make the x axis the same for all plots 
  scale_y_continuous(breaks = breaks, 
    limits = limits, 
    labels = labels)

## combine all three plots  ----------------------------------------------------
## combine three plots next to eachother using + 
source_population + sample_population + weighted_population + 
  ## only show one legend and define theme 
  ## note the use of & for combining theme with plot_layout()
  plot_layout(guides = "collect") & 
  theme(legend.position = "bottom",                    # move legend to bottom
        legend.title = element_blank(),                # remove title
        text = element_text(size = 18),                # change text size
        axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1) # turn x-axis text
       )


## summarize data
flow_table <- survey_data %>%
  count(startcause, endcause, sex) %>%  # get counts 
  gather_set_data(x = c("startcause", "endcause"))     # change format for plotting


## plot your dataset 
  ## on the x axis is the start and end causes
  ## gather_set_data generates an ID for each possible combination
  ## splitting by y gives the possible start/end combos
  ## value as n gives it as counts (could also be changed to proportion)
ggplot(flow_table, aes(x, id = id, split = y, value = n)) +
  ## colour lines by sex 
  geom_parallel_sets(aes(fill = sex), alpha = 0.5, axis.width = 0.2) +
  ## fill in the label boxes grey
  geom_parallel_sets_axes(axis.width = 0.15, fill = "grey80", color = "grey80") +
  ## change text colour and angle (needs to be adjusted)
  geom_parallel_sets_labels(color = "black", angle = 0, size = 5) +
  ## remove axis labels
  theme_void()+
  ## move legend to bottom
  theme(legend.position = "bottom")               



## produce weighted counts 
svytable(~died, base_survey_design)

## produce weighted proportions
svyciprop(~died, base_survey_design, na.rm = T)

## get the design effect 
svymean(~died, base_survey_design, na.rm = T, deff = T) %>% 
  deff()


# Define function to calculate weighted counts, proportions, CI and design effect
# x is the variable in quotation marks 
# design is your survey design object

svy_prop <- function(design, x) {
  
  ## put the variable of interest in a formula 
  form <- as.formula(paste0( "~" , x))
  ## only keep the TRUE column of counts from svytable
  weighted_counts <- svytable(form, design)[[2]]
  ## calculate proportions (multiply by 100 to get percentages)
  weighted_props <- svyciprop(form, design, na.rm = TRUE) * 100
  ## extract the confidence intervals and multiply to get percentages
  weighted_confint <- confint(weighted_props) * 100
  ## use svymean to calculate design effect and only keep the TRUE column
  design_eff <- deff(svymean(form, design, na.rm = TRUE, deff = TRUE))[[TRUE]]
  
  ## combine in to one data frame
  full_table <- cbind(
    "Variable"        = x,
    "Count"           = weighted_counts,
    "Proportion"      = weighted_props,
    weighted_confint, 
    "Design effect"   = design_eff
    )
  
  ## return table as a dataframe
  full_table <- data.frame(full_table, 
             ## remove the variable names from rows (is a separate column now)
             row.names = NULL)
  
  ## change numerics back to numeric
  full_table[ , 2:6] <- as.numeric(full_table[, 2:6])
  
  ## return dataframe
  full_table
}

## iterate over several variables to create a table 
purrr::map(
  ## define variables of interest
  c("left", "died", "arrived"), 
  ## state function using and arguments for that function (design)
  svy_prop, design = base_survey_design) %>% 
  ## collapse list in to a single data frame
  bind_rows() %>% 
  ## round 
  mutate(across(where(is.numeric), ~ round(.x, digits = 1)))



## use the srvyr design object
survey_design %>% 
  summarise(
    ## produce the weighted counts 
    counts = survey_total(died), 
    ## produce weighted proportions and confidence intervals 
    ## multiply by 100 to get a percentage 
    props = survey_mean(died, 
                        proportion = TRUE, 
                        vartype = "ci") * 100, 
    ## produce the design effect 
    deff = survey_mean(died, deff = TRUE)) %>% 
  ## only keep the rows of interest
  ## (drop standard errors and repeat proportion calculation)
  select(counts, props, props_low, props_upp, deff_deff)



# Define function to calculate weighted counts, proportions, CI and design effect
# design is your survey design object
# x is the variable in quotation marks 


srvyr_prop <- function(design, x) {
  
  summarise(
    ## using the survey design object
    design, 
    ## produce the weighted counts 
    counts = survey_total(.data[[x]]), 
    ## produce weighted proportions and confidence intervals 
    ## multiply by 100 to get a percentage 
    props = survey_mean(.data[[x]], 
                        proportion = TRUE, 
                        vartype = "ci") * 100, 
    ## produce the design effect 
    deff = survey_mean(.data[[x]], deff = TRUE)) %>% 
  ## add in the variable name
  mutate(variable = x) %>% 
  ## only keep the rows of interest
  ## (drop standard errors and repeat proportion calculation)
  select(variable, counts, props, props_low, props_upp, deff_deff)
  
}
  

## iterate over several variables to create a table 
purrr::map(
  ## define variables of interest
  c("left", "died", "arrived"), 
  ## state function using and arguments for that function (design)
  ~srvyr_prop(.x, design = survey_design)) %>% 
  ## collapse list in to a single data frame
  bind_rows()
  




confidence_intervals <- function(data, variable, by, ...) {
  
  ## extract the confidence intervals and multiply to get percentages
  props <- svyciprop(as.formula(paste0( "~" , variable)),
              data, na.rm = TRUE)
  
  ## extract the confidence intervals 
  as.numeric(confint(props) * 100) %>% ## make numeric and multiply for percentage
    round(., digits = 1) %>%           ## round to one digit
    c(.) %>%                           ## extract the numbers from matrix
    paste0(., collapse = "-")          ## combine to single character
}

## using the survey package design object
tbl_svysummary(base_survey_design, 
               include = c(arrived, left, died),   ## define variables want to include
               statistic = list(everything() ~ c("{n} ({p}%)"))) %>% ## define stats of interest
  add_n() %>%  ## add the weighted total 
  add_stat(fns = everything() ~ confidence_intervals) %>% ## add CIs
  ## modify the column headers
  modify_header(
    list(
      n ~ "**Weighted total (N)**",
      stat_0 ~ "**Weighted Count**",
      add_stat_1 ~ "**95%CI**"
    )
    )



ratio <- svyratio(~died, 
         denominator = ~obstime, 
         design = base_survey_design)

ci <- confint(ratio)

cbind(
  ratio$ratio * 10000, 
  ci * 10000
)



survey_design %>% 
  ## survey ratio used to account for observation time 
  summarise(
    mortality = survey_ratio(
      as.numeric(died) * 10000, 
      obstime, 
      vartype = "ci")
    )




# Chapter 27 - Survival analysis


# install/load the different packages needed for this page
pacman::p_load(
  survival,      # survival analysis 
  survminer,     # survival analysis
  rio,           # importing data  
  here,          # relative file pathways  
  janitor,       # tabulations
  SemiCompRisks, # dataset examples and advanced tools for working with Semi-Competing Risks data
  tidyverse,     # data manipulation and visualization
  Epi,           # stat analyses in Epi
  survival,      # survival analysis
  survminer      # survival analysis: advanced KM curves
)



# import linelist
linelist_case_data <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL

# # import linelist
# linelist_case_data <- rio::import("linelist_cleaned.rds")

#create a new data called linelist_surv from the linelist_case_data

linelist_surv <-  linelist_case_data %>% 
     
  dplyr::filter(
       # remove observations with wrong or missing dates of onset or date of outcome
       date_outcome > date_onset) %>% 
  
  dplyr::mutate(
       # create the event var which is 1 if the patient died and 0 if he was right censored
       event = ifelse(is.na(outcome) | outcome == "Recover", 0, 1), 
    
       # create the var on the follow-up time in days
       futime = as.double(date_outcome - date_onset), 
    
       # create a new age category variable with only 3 strata levels
       age_cat_small = dplyr::case_when( 
            age_years < 5  ~ "0-4",
            age_years >= 5 & age_years < 20 ~ "5-19",
            age_years >= 20   ~ "20+"),
       
       # previous step created age_cat_small var as character.
       # now convert it to factor and specify the levels.
       # Note that the NA values remain NA's and are not put in a level "unknown" for example,
       # since in the next analyses they have to be removed.
       age_cat_small = fct_relevel(age_cat_small, "0-4", "5-19", "20+")
       )


summary(linelist_surv$futime)

# cross tabulate the new event var and the outcome var from which it was created
# to make sure the code did what it was intended to
linelist_surv %>% 
  tabyl(outcome, event)

linelist_surv %>% 
  tabyl(age_cat_small, age_cat)

linelist_surv %>% 
  select(case_id, age_cat_small, date_onset, date_outcome, outcome, event, futime) %>% 
  head(10)


linelist_surv %>% 
  tabyl(gender, age_cat_small, show_na = F) %>% 
  adorn_totals(where = "both") %>% 
  adorn_percentages() %>% 
  adorn_pct_formatting() %>% 
  adorn_ns(position = "front")


# Use Suv() syntax for right-censored data
survobj <- Surv(time = linelist_surv$futime,
                event = linelist_surv$event)

linelist_surv %>% 
  select(case_id, date_onset, date_outcome, futime, outcome, event) %>% 
  head(10)

#print the 50 first elements of the vector to see how it presents
head(survobj, 10)

# fit the KM estimates using a formula where the Surv object "survobj" is the response variable.
# "~ 1" signifies that we run the model for the overall survival  
linelistsurv_fit <-  survival::survfit(survobj ~ 1)

#print its summary for more details
summary(linelistsurv_fit)



#print its summary at specific times
summary(linelistsurv_fit, times = c(5,10,20,30,60))


# print linelistsurv_fit object with mean survival time and its se. 
print(linelistsurv_fit, print.rmean = TRUE)



str(linelistsurv_fit)



plot(linelistsurv_fit, 
     xlab = "Days of follow-up",    # x-axis label
     ylab="Survival Probability",   # y-axis label
     main= "Overall survival curve" # figure title
     )



# original plot
plot(
  linelistsurv_fit,
  xlab = "Days of follow-up",       
  ylab = "Survival Probability",       
  mark.time = TRUE,              # mark events on the curve: a "+" is printed at every event
  conf.int = FALSE,              # do not plot the confidence interval
  main = "Overall survival curve and cumulative mortality"
  )

# draw an additional curve to the previous plot
lines(
  linelistsurv_fit,
  lty = 3,             # use different line type for clarity
  fun = "event",       # draw the cumulative events instead of the survival 
  mark.time = FALSE,
  conf.int = FALSE
  )

# add a legend to the plot
legend(
  "topright",                               # position of legend
  legend = c("Survival", "Cum. Mortality"), # legend text 
  lty = c(1, 3),                            # line types to use in the legend
  cex = .85,                                # parametes that defines size of legend text
  bty = "n"                                 # no box type to be drawn for the legend
  )



# create the new survfit object based on gender
linelistsurv_fit_sex <-  survfit(Surv(futime, event) ~ gender, data = linelist_surv)

# set colors
col_sex <- c("lightgreen", "darkgreen")

# create plot
plot(
  linelistsurv_fit_sex,
  col = col_sex,
  xlab = "Days of follow-up",
  ylab = "Survival Probability")

# add legend
legend(
  "topright",
  legend = c("Female","Male"),
  col = col_sex,
  lty = 1,
  cex = .9,
  bty = "n")

#compute the test of the difference between the survival curves
survival::survdiff(
  Surv(futime, event) ~ gender, 
  data = linelist_surv
  )



survminer::ggsurvplot(
    linelistsurv_fit_sex, 
    data = linelist_surv,          # again specify the data used to fit linelistsurv_fit_sex 
    conf.int = FALSE,              # do not show confidence interval of KM estimates
    surv.scale = "percent",        # present probabilities in the y axis in %
    break.time.by = 10,            # present the time axis with an increment of 10 days
    xlab = "Follow-up days",
    ylab = "Survival Probability",
    pval = T,                      # print p-value of Log-rank test 
    pval.coord = c(40,.91),        # print p-value at these plot coordinates
    risk.table = T,                # print the risk table at bottom 
    legend.title = "Gender",       # legend characteristics
    legend.labs = c("Female","Male"),
    font.legend = 10, 
    palette = "Dark2",             # specify color palette 
    surv.median.line = "hv",       # draw horizontal and vertical lines to the median survivals
    ggtheme = theme_light()        # simplify plot background
)



linelistsurv_fit_source <-  survfit(
  Surv(futime, event) ~ source,
  data = linelist_surv
  )

# plot
ggsurvplot( 
  linelistsurv_fit_source,
  data = linelist_surv,
  size = 1, linetype = "strata",   # line types
  conf.int = T,
  surv.scale = "percent",  
  break.time.by = 10, 
  xlab = "Follow-up days",
  ylab= "Survival Probability",
  pval = T,
  pval.coord = c(40,.91),
  risk.table = T,
  legend.title = "Source of \ninfection",
  legend.labs = c("Funeral", "Other"),
  font.legend = 10,
  palette = c("#E7B800","#3E606F"),
  surv.median.line = "hv", 
  ggtheme = theme_light()
)



#fitting the cox model
linelistsurv_cox_sexage <-  survival::coxph(
              Surv(futime, event) ~ gender + age_cat_small, 
              data = linelist_surv
              )


#printing the model fitted
linelistsurv_cox_sexage


#summary of the model
summary(linelistsurv_cox_sexage)



test_ph_sexage <- survival::cox.zph(linelistsurv_cox_sexage)
test_ph_sexage



#fit the model
linelistsurv_cox <-  coxph(
                        Surv(futime, event) ~ gender + age_years+ source + days_onset_hosp,
                        data = linelist_surv
                        )


#test the proportional hazard model
linelistsurv_ph_test <- cox.zph(linelistsurv_cox)
linelistsurv_ph_test

survminer::ggcoxzph(linelistsurv_ph_test)



#print the summary of the model
summary(linelistsurv_cox)


linelist_case_data %>% 
  tabyl(days_onset_hosp, outcome) %>% 
  adorn_percentages() %>%  
  adorn_pct_formatting()



ggforest(linelistsurv_cox, data = linelist_surv)


data(BMT, package = "SemiCompRisks")

bmt <- rowid_to_column(BMT, "my_id")

td_dat <- 
  tmerge(
    data1 = bmt %>% select(my_id, T1, delta1), 
    data2 = bmt %>% select(my_id, T1, delta1, TA, deltaA), 
    id = my_id, 
    death = event(T1, delta1),
    agvhd = tdc(TA)
    )

bmt %>% 
  select(my_id, T1, delta1, TA, deltaA) %>% 
  filter(my_id %in% seq(1, 5))

td_dat %>% 
  filter(my_id %in% seq(1, 5))

bmt_td_model = coxph(
  Surv(time = tstart, time2 = tstop, event = death) ~ agvhd, 
  data = td_dat
  )

summary(bmt_td_model)


ggforest(bmt_td_model, data = td_dat)




# Chapter 28 - GIS basics

# NOTE: dropped from the current handbook build (OSM dependency), shapefile parts need local data

# dot density img here

# proportional symbols img here

pacman::p_load(
  rio,           # to import data
  here,          # to locate files
  tidyverse,     # to clean, handle, and plot the data (includes ggplot2 package)
  sf,            # to manage spatial data using a Simple Feature format
  tmap,          # to produce simple maps, works for both interactive and static maps
  janitor,       # to clean column names
  OpenStreetMap, # to add OSM basemap in ggplot map
  spdep          # spatial statistics
  )

# import clean case linelist
linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL

# # import clean case linelist
# linelist <- import("linelist_cleaned.rds")  

# generate 1000 random row numbers, from the number of rows in linelist
sample_rows <- sample(nrow(linelist), 1000)

# subset linelist to keep only the sample rows, and all columns
linelist <- linelist[sample_rows,]

# Create sf object
linelist_sf <- linelist %>%
     sf::st_as_sf(coords = c("lon", "lat"), crs = 4326)

DT::datatable(head(linelist_sf, 10), rownames = FALSE, options = list(pageLength = 5, scrollX=T), class = 'white-space: nowrap' )

# FIX: commented out, needs local files (get_data("all") from Ch 2 first)
# sle_adm3_raw <- sf::read_sf(here("data", "gis", "shp", "sle_adm3.shp"))

# ADM3 level clean
sle_adm3 <- sle_adm3_raw %>%
  janitor::clean_names() %>% # standardize column names
  filter(admin2name %in% c("Western Area Urban", "Western Area Rural")) # filter to keep certain areas

# Population by ADM3
sle_adm3_pop <- import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/gis/population/sle_admpop_adm3_2020.csv") %>%  # FIX: local file -> URL
  janitor::clean_names()

# FIX: commented out, needs local files (get_data("all") from Ch 2 first)
# # OSM health facility shapefile
# sle_hf <- sf::read_sf(here("data", "gis", "shp", "sle_hf.shp")) %>% 
#   janitor::clean_names() %>%
#   filter(amenity %in% c("hospital", "clinic", "doctors"))

tmap_mode("plot") # choose either "view" or "plot"

# Just the cases (points)
tm_shape(linelist_sf) + tm_dots(size=0.08, col='blue')

# Just the administrative boundaries (polygons)
tm_shape(sle_adm3) +               # admin boundaries shapefile
  tm_polygons(col = "#F7F7F7")+    # show polygons in light grey
  tm_borders(col = "#000000",      # show borders with color and line weight
             lwd = 2) +
  tm_text("admin3name")            # column text to display for each polygon


# Same as above, but with zoom from bounding box
tm_shape(sle_adm3,
         bbox = c(-13.3, 8.43,    # corner
                  -13.2, 8.5)) +  # corner
  tm_polygons(col = "#F7F7F7") +
  tm_borders(col = "#000000", lwd = 2) +
  tm_text("admin3name")


# All together
tm_shape(sle_adm3, bbox = c(-13.3, 8.43, -13.2, 8.5)) +     #
  tm_polygons(col = "#F7F7F7") +
  tm_borders(col = "#000000", lwd = 2) +
  tm_text("admin3name")+
tm_shape(linelist_sf) +
  tm_dots(size=0.08, col='blue', alpha = 0.5) +
  tm_layout(title = "Distribution of Ebola cases")   # give title to map


linelist_adm <- linelist_sf %>%
  
  # join the administrative boundary file to the linelist, based on spatial intersection
  sf::st_join(sle_adm3, join = st_intersects)

linelist_adm <- linelist_sf %>%
  
  # join the administrative boundary file to the linelist, based on spatial intersection
  sf::st_join(sle_adm3, join = st_intersects) %>% 
  
  # Keep the old column names and two new admin ones of interest
  select(names(linelist_sf), admin3name, admin3pcod)

# Now you will see the ADM3 names attached to each case
linelist_adm %>% select(case_id, admin3name, admin3pcod)

# Make new dataframe containing counts of cases by administrative unit
case_adm3 <- linelist_adm %>%          # begin with linelist with new admin cols
  as_tibble() %>%                      # convert to tibble for better display
  group_by(admin3pcod, admin3name) %>% # group by admin unit, both by name and pcode 
  summarise(cases = n()) %>%           # summarize and count rows
  arrange(desc(cases))                     # arrange in descending order

case_adm3

ggplot(
    data = linelist_adm,                       # begin with linelist containing admin unit info
    mapping = aes(
      x = fct_rev(fct_infreq(admin3name))))+ # x-axis is admin units, ordered by frequency (reversed)
  geom_bar()+                                # create bars, height is number of rows
  coord_flip()+                              # flip X and Y axes for easier reading of adm units
  theme_classic()+                           # simplify background
  labs(                                      # titles and labels
    x = "Admin level 3",
    y = "Number of cases",
    title = "Number of cases, by adminstative unit",
    caption = "As determined by a spatial join, from 1000 randomly sampled cases from linelist"
  )

# Closest health facility to each case
linelist_sf_hf <- linelist_sf %>%                  # begin with linelist shapefile  
  st_join(sle_hf, join = st_nearest_feature) %>%   # data from nearest clinic joined to case data 
  select(case_id, osm_id, name, amenity) %>%       # keep columns of interest, including id, name, type, and geometry of healthcare facility
  rename("nearest_clinic" = "name")                # re-name for clarity

# Count cases by health facility
hf_catchment <- linelist_sf_hf %>%   # begin with linelist including nearest clinic data
  as.data.frame() %>%                # convert from shapefile to dataframe
  count(nearest_clinic,              # count rows by "name" (of clinic)
        name = "case_n") %>%         # assign new counts column as "case_n"
  arrange(desc(case_n))              # arrange in descending order

hf_catchment                         # print to console

tmap_mode("view")   # set tmap mode to interactive  

# plot the cases and clinic points 
tm_shape(linelist_sf_hf) +            # plot cases
  tm_dots(size=0.08,                  # cases colored by nearest clinic
          col='nearest_clinic') +    
tm_shape(sle_hf) +                    # plot clinic facilities in large black dots
  tm_dots(size=0.3, col='black', alpha = 0.4) +      
  tm_text("name") +                   # overlay with name of facility
tm_view(set.view = c(-13.2284, 8.4699, 13), # adjust zoom (center coords, zoom)
        set.zoom.limits = c(13,14))+
tm_layout(title = "Cases, colored by nearest clinic")

sle_hf_2k <- sle_hf %>%
  st_buffer(dist=0.02)       # decimal degrees translating to approximately 2.5km 

tmap_mode("plot")
# Create circular buffers
tm_shape(sle_hf_2k) +
  tm_borders(col = "black", lwd = 2)+
tm_shape(sle_hf) +                    # plot clinic facilities in large red dots
  tm_dots(size=0.3, col='black')      

# Intersect the cases with the buffers
linelist_sf_hf_2k <- linelist_sf_hf %>%
  st_join(sle_hf_2k, join = st_intersects, left = TRUE) %>%
  filter(osm_id.x==osm_id.y | is.na(osm_id.y)) %>%
  select(case_id, osm_id.x, nearest_clinic, amenity.x, osm_id.y)

# Cases which did not get intersected with any of the health facility buffers
linelist_sf_hf_2k %>% 
  filter(is.na(osm_id.y)) %>%
  nrow()

tmap_mode("view")

# First display the cases in points
tm_shape(linelist_sf_hf) +
  tm_dots(size=0.08, col='nearest_clinic') +

# plot clinic facilities in large black dots
tm_shape(sle_hf) +                    
  tm_dots(size=0.3, col='black')+   

# Then overlay the health facility buffers in polylines
tm_shape(sle_hf_2k) +
  tm_borders(col = "black", lwd = 2) +

# Highlight cases that are not part of any health facility buffers
# in red dots  
tm_shape(linelist_sf_hf_2k %>%  filter(is.na(osm_id.y))) +
  tm_dots(size=0.1, col='red') +
tm_view(set.view = c(-13.2284,8.4699, 13), set.zoom.limits = c(13,14))+

# add title  
tm_layout(title = "Cases by clinic catchment area")


# Add population data and calculate cases per 10K population
case_adm3 <- case_adm3 %>% 
     left_join(sle_adm3_pop,                             # add columns from pop dataset
               by = c("admin3pcod" = "adm3_pcode")) %>%  # join based on common values across these two columns
     select(names(case_adm3), total) %>%                 # keep only important columns, including total population
     mutate(case_10kpop = round(cases/total * 10000, 3)) # make new column with case rate per 10000, rounded to 3 decimals

case_adm3                                                # print to console for viewing

case_adm3_sf <- case_adm3 %>%                 # begin with cases & rate by admin unit
  left_join(sle_adm3, by="admin3pcod") %>%    # join to shapefile data by common column
  select(objectid, admin3pcod,                # keep only certain columns of interest
         admin3name = admin3name.x,           # clean name of one column
         admin2name, admin1name,
         cases, total, case_10kpop,
         geometry) %>%                        # keep geometry so polygons can be plotted
  drop_na(objectid) %>%                       # drop any empty rows
  st_as_sf()                                  # convert to shapefile


# tmap mode
tmap_mode("plot")               # view static map

# plot polygons
tm_shape(case_adm3_sf) + 
        tm_polygons("cases") +  # color by number of cases column
        tm_text("admin3name")   # name display

# Cases per 10K population
tmap_mode("plot")             # static viewing mode

# plot
tm_shape(case_adm3_sf) +                # plot polygons
  tm_polygons("case_10kpop",            # color by column containing case rate
              breaks=c(0, 10, 50, 100), # define break points for colors
              palette = "Purples"       # use a purple color palette
              ) +
  tm_text("admin3name")                 # display text


sle_adm3

sle_adm3_dat <- sle_adm3 %>% 
  inner_join(case_adm3, by = "admin3pcod") # inner join = retain only if in both data objects

select(sle_adm3_dat, admin3name.x, cases) # print selected variables to console

ggplot(data=sle_adm3_dat) +
  geom_col(aes(x=fct_reorder(admin3name.x, cases, .desc=T),   # reorder x axis by descending 'cases'
               y=cases)) +                                  # y axis is number of cases by region
  theme_bw() +
  labs(                                                     # set figure text
    title="Number of cases, by administrative unit",
    x="Admin level 3",
    y="Number of cases"
  ) + 
  guides(x=guide_axis(angle=45))                            # angle x-axis labels 45 degrees to fit better


ggplot(data=sle_adm3_dat) + 
  geom_sf(aes(fill=cases))    # set fill to vary by case count variable


ggplot(data=sle_adm3_dat) +                           
  geom_sf(aes(fill=cases)) +						
  scale_fill_continuous(high="#54278f", low="#f2f0f7") +    # change color gradient
  theme_bw() +
  labs(title = "Number of cases, by administrative unit",   # set figure text
       subtitle = "Admin level 3"
  )

# load package
pacman::p_load(OpenStreetMap)

# Fit basemap by range of lat/long coordinates. Choose tile type
map <- OpenStreetMap::openmap(
  upperLeft = c(max(linelist$lat, na.rm=T), max(linelist$lon, na.rm=T)),   # limits of basemap tile
  lowerRight = c(min(linelist$lat, na.rm=T), min(linelist$lon, na.rm=T)),
  zoom = NULL,
  type = c("osm", "stamen-toner", "stamen-terrain", "stamen-watercolor", "esri","esri-topo")[1])

autoplot.OpenStreetMap(map)

# Projection WGS84
map_latlon <- openproj(map, projection = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs")

# Plot map. Must use "autoplot" in order to work with ggplot
autoplot.OpenStreetMap(map_latlon)

# Plot map. Must be autoplotted to work with ggplot
autoplot.OpenStreetMap(map_latlon)+                 # begin with the basemap
  geom_point(                                       # add xy points from linelist lon and lat columns 
    data = linelist,                                
    aes(x = lon, y = lat),
    size = 1, 
    alpha = 0.5,
    show.legend = FALSE) +                          # drop legend entirely
  labs(x = "Longitude",                             # titles & labels
       y = "Latitude",
       title = "Cumulative cases")


# begin with the basemap
autoplot.OpenStreetMap(map_latlon)+
  
  # add the density plot
  ggplot2::stat_density_2d(
        data = linelist,
        aes(
          x = lon,
          y = lat,
          fill = ..level..,
          alpha = ..level..),
        bins = 10,
        geom = "polygon",
        contour_var = "count",
        show.legend = F) +                          
  
  # specify color scale
  scale_fill_gradient(low = "black", high = "red")+
  
  # labels 
  labs(x = "Longitude",
       y = "Latitude",
       title = "Distribution of cumulative cases")


# Extract month of onset
linelist <- linelist %>% 
  mutate(date_onset_ym = format(date_onset, "%Y-%m"))

# Examine the values 
table(linelist$date_onset_ym, useNA = "always")

# packages
pacman::p_load(OpenStreetMap, tidyverse)

# begin with the basemap
autoplot.OpenStreetMap(map_latlon)+
  
  # add the density plot
  ggplot2::stat_density_2d(
        data = linelist,
        aes(
          x = lon,
          y = lat,
          fill = ..level..,
          alpha = ..level..),
        bins = 10,
        geom = "polygon",
        contour_var = "count",
        show.legend = F) +                          
  
  # specify color scale
  scale_fill_gradient(low = "black", high = "red")+
  
  # labels 
  labs(x = "Longitude",
       y = "Latitude",
       title = "Distribution of cumulative cases over time")+
  
  # facet the plot by month-year of onset
  facet_wrap(~ date_onset_ym, ncol = 4)               


sle_nb <- spdep::poly2nb(sle_adm3_dat, queen=T) # create neighbors 
sle_adjmat <- spdep::nb2mat(sle_nb)    # create matrix summarizing neighbor relationships
sle_listw <- spdep::nb2listw(sle_nb)   # create listw (list of weights) object -- we will need this later

sle_nb
round(sle_adjmat, digits = 2)

plot(sle_adm3_dat$geometry) +                                           # plot region boundaries
  spdep::plot.nb(sle_nb,as(sle_adm3_dat, 'Spatial'), col='grey', add=T) # add neighbor relationships

moran_i <-spdep::moran.test(sle_adm3_dat$cases,    # numeric vector with variable of interest
                            listw=sle_listw)       # listw object summarizing neighbor relationships

moran_i                                            # print results of Moran's I test

# calculate local Moran's I
local_moran <- spdep::localmoran(                  
  sle_adm3_dat$cases,                              # variable of interest
  listw=sle_listw                                  # listw object with neighbor weights
)

# join results to sf data
sle_adm3_dat<- cbind(sle_adm3_dat, local_moran)    

# plot map
ggplot(data=sle_adm3_dat) +
  geom_sf(aes(fill=Ii)) +
  theme_bw() +
  scale_fill_gradient2(low="#2c7bb6", mid="#ffffbf", high="#d7191c",
                       name="Local Moran's I") +
  labs(title="Local Moran's I statistic for Ebola cases",
       subtitle="Admin level 3 regions, Sierra Leone")


# Perform local G analysis
getis_ord <- spdep::localG(
  sle_adm3_dat$cases,
  sle_listw
)

# join results to sf data
sle_adm3_dat$getis_ord <- as.numeric(getis_ord)

# plot map
ggplot(data=sle_adm3_dat) +
  geom_sf(aes(fill=getis_ord)) +
  theme_bw() +
  scale_fill_gradient2(low="#2c7bb6", mid="#ffffbf", high="#d7191c",
                       name="Gi*") +
  labs(title="Getis-Ord Gi* statistic for Ebola cases",
       subtitle="Admin level 3 regions, Sierra Leone")


sle_adm3_dat <- sle_adm3_dat %>% 
  rename(population = total)                          # rename 'total' to 'population'

tmap_mode("plot")

cases_map <- tm_shape(sle_adm3_dat) + tm_polygons("cases") + tm_layout(main.title="Cases")
pop_map <- tm_shape(sle_adm3_dat) + tm_polygons("population") + tm_layout(main.title="Population")

tmap_arrange(cases_map, pop_map, ncol=2)   # arrange into 2x1 facets

lee_test <- spdep::lee.test(
  x=sle_adm3_dat$cases,          # variable 1 to compare
  y=sle_adm3_dat$population,     # variable 2 to compare
  listw=sle_listw                # listw object with neighbor weights
)

lee_test



# Chapter 29 - Tables for presentation


linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL

border_style = officer::fp_border(color="black", width=1)

pacman::p_load(
  rio,            # import/export
  here,           # file pathways
  flextable,      # make HTML tables 
  officer,        # helper functions for tables
  tidyverse)      # data management, summary, and visualization

table <- linelist %>% 
  # filter
  ########
  #filter(!is.na(outcome) & hospital != "Missing") %>%  # Remove cases with missing outcome or hospital
  
  # Get summary values per hospital-outcome group
  ###############################################
  group_by(hospital, outcome) %>%                      # Group data
  summarise(                                           # Create new summary columns of indicators of interest
    N = n(),                                            # Number of rows per hospital-outcome group     
    ct_value = median(ct_blood, na.rm=T)) %>%           # median CT value per group
  
  # add totals
  ############
  bind_rows(                                           # Bind the previous table with this mini-table of totals
    linelist %>% 
      filter(!is.na(outcome) & hospital != "Missing") %>%
      group_by(outcome) %>%                            # Grouped only by outcome, not by hospital    
      summarise(
        N = n(),                                       # Number of rows for whole dataset     
        ct_value = median(ct_blood, na.rm=T))) %>%     # Median CT for whole dataset
  
  # Pivot wider and format
  ########################
  mutate(hospital = replace_na(hospital, "Total")) %>% 
  pivot_wider(                                         # Pivot from long to wide
    values_from = c(ct_value, N),                       # new values are from ct and count columns
    names_from = outcome) %>%                           # new column names are from outcomes
  mutate(                                              # Add new columns
    N_Known = N_Death + N_Recover,                               # number with known outcome
    Pct_Death = scales::percent(N_Death / N_Known, 0.1),         # percent cases who died (to 1 decimal)
    Pct_Recover = scales::percent(N_Recover / N_Known, 0.1)) %>% # percent who recovered (to 1 decimal)
  select(                                              # Re-order columns
    hospital, N_Known,                                   # Intro columns
    N_Recover, Pct_Recover, ct_value_Recover,            # Recovered columns
    N_Death, Pct_Death, ct_value_Death)  %>%             # Death columns
  arrange(N_Known) %>%                                 # Arrange rows from lowest to highest (Total row at bottom)

  # formatting
  ############
  flextable() %>% 
  add_header_row(
    top = TRUE,                # New header goes on top of existing header row
    values = c("Hospital",     # Header values for each column below
               "Total cases with known outcome", 
               "Recovered",    # This will be the top-level header for this and two next columns
               "",
               "",
               "Died",         # This will be the top-level header for this and two next columns
               "",             # Leave blank, as it will be merged with "Died"
               "")) %>% 
    set_header_labels(         # Rename the columns in original header row
      hospital = "", 
      N_Known = "",                  
      N_Recover = "Total",
      Pct_Recover = "% of cases",
      ct_value_Recover = "Median CT values",
      N_Death = "Total",
      Pct_Death = "% of cases",
      ct_value_Death = "Median CT values")  %>% 
  merge_at(i = 1, j = 3:5, part = "header") %>% # Horizontally merge columns 3 to 5 in new header row
  merge_at(i = 1, j = 6:8, part = "header") %>%  
  border_remove() %>%  
  theme_booktabs() %>% 
  vline(part = "all", j = 2, border = border_style) %>%   # at column 2 
  vline(part = "all", j = 5, border = border_style) %>%   # at column 5
  merge_at(i = 1:2, j = 1, part = "header") %>% 
  merge_at(i = 1:2, j = 2, part = "header") %>% 
  width(j=1, width = 2.7) %>% 
  width(j=2, width = 1.5) %>% 
  width(j=c(4,5,7,8), width = 1) %>% 
  flextable::align(., align = "center", j = c(2:8), part = "all") %>% 
  bg(., part = "body", bg = "gray95")  %>% 
  #bg(., j=c(1:8), i= ~ hospital == "Military Hospital", part = "body", bg = "#91c293") %>% 
  bg(j = 7, i = ~ Pct_Death >= 55, part = "body", bg = "red") %>% 
  colformat_num(., j = c(4,7), digits = 1) %>%
  bold(i = 1, bold = TRUE, part = "header") %>% 
  bold(i = 7, bold = TRUE, part = "body")

table

pacman::p_load(
  rio,            # import/export
  here,           # file pathways
  flextable,      # make HTML tables 
  officer,        # helper functions for tables
  tidyverse)      # data management, summary, and visualization


# import the linelist into R
linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL

# # import the linelist
# linelist <- import("linelist_cleaned.rds")

table <- linelist %>% 
  
  # Get summary values per hospital-outcome group
  ###############################################
  group_by(hospital, outcome) %>%                      # Group data
  summarise(                                           # Create new summary columns of indicators of interest
    N = n(),                                            # Number of rows per hospital-outcome group     
    ct_value = median(ct_blood, na.rm=T)) %>%           # median CT value per group
  
  # add totals
  ############
  bind_rows(                                           # Bind the previous table with this mini-table of totals
    linelist %>% 
      filter(!is.na(outcome) & hospital != "Missing") %>%
      group_by(outcome) %>%                            # Grouped only by outcome, not by hospital    
      summarise(
        N = n(),                                       # Number of rows for whole dataset     
        ct_value = median(ct_blood, na.rm=T))) %>%     # Median CT for whole dataset
  
  # Pivot wider and format
  ########################
  mutate(hospital = replace_na(hospital, "Total")) %>% 
  pivot_wider(                                         # Pivot from long to wide
    values_from = c(ct_value, N),                       # new values are from ct and count columns
    names_from = outcome) %>%                           # new column names are from outcomes
  mutate(                                              # Add new columns
    N_Known = N_Death + N_Recover,                               # number with known outcome
    Pct_Death = scales::percent(N_Death / N_Known, 0.1),         # percent cases who died (to 1 decimal)
    Pct_Recover = scales::percent(N_Recover / N_Known, 0.1)) %>% # percent who recovered (to 1 decimal)
  select(                                              # Re-order columns
    hospital, N_Known,                                   # Intro columns
    N_Recover, Pct_Recover, ct_value_Recover,            # Recovered columns
    N_Death, Pct_Death, ct_value_Death)  %>%             # Death columns
  arrange(N_Known)                                    # Arrange rows from lowest to highest (Total row at bottom)

table  # print



my_table <- flextable(table) 
my_table



my_table %>% autofit()



my_table <- my_table %>% 
  width(j=1, width = 2.7) %>% 
  width(j=2, width = 1.5) %>% 
  width(j=c(4,5,7,8), width = 1)

my_table
  

my_table <- my_table %>% 
  
  add_header_row(
    top = TRUE,                # New header goes on top of existing header row
    values = c("Hospital",     # Header values for each column below
               "Total cases with known outcome", 
               "Recovered",    # This will be the top-level header for this and two next columns
               "",
               "",
               "Died",         # This will be the top-level header for this and two next columns
               "",             # Leave blank, as it will be merged with "Died"
               "")) %>% 
    
  set_header_labels(         # Rename the columns in original header row
      hospital = "", 
      N_Known = "",                  
      N_Recover = "Total",
      Pct_Recover = "% of cases",
      ct_value_Recover = "Median CT values",
      N_Death = "Total",
      Pct_Death = "% of cases",
      ct_value_Death = "Median CT values")  %>% 
  
  merge_at(i = 1, j = 3:5, part = "header") %>% # Horizontally merge columns 3 to 5 in new header row
  merge_at(i = 1, j = 6:8, part = "header")     # Horizontally merge columns 6 to 8 in new header row

my_table  # print


# define style for border line
border_style = officer::fp_border(color="black", width=1)

# add border lines to table
my_table <- my_table %>% 

  # Remove all existing borders
  border_remove() %>%  
  
  # add horizontal lines via a pre-determined theme setting
  theme_booktabs() %>% 
  
  # add vertical lines to separate Recovered and Died sections
  vline(part = "all", j = 2, border = border_style) %>%   # at column 2 
  vline(part = "all", j = 5, border = border_style)       # at column 5

my_table

my_table <- my_table %>% 
   flextable::align(align = "center", j = c(2:8), part = "all") 
my_table


my_table <-  my_table %>%  
  fontsize(i = 1, size = 12, part = "header") %>%   # adjust font size of header
  bold(i = 1, bold = TRUE, part = "header") %>%     # adjust bold face of header
  bold(i = 7, bold = TRUE, part = "body")           # adjust bold face of total row (row 7 of body)

my_table


my_table <- colformat_num(my_table, j = c(4,7), digits = 1)
my_table

my_table <- my_table %>% 
  merge_at(i = 1:2, j = 1, part = "header") %>% 
  merge_at(i = 1:2, j = 2, part = "header")

my_table

my_table <- my_table %>% 
    bg(part = "body", bg = "gray95")  

my_table 


my_table %>% 
  bg(j = 7, i = ~ Pct_Death >= 55, part = "body", bg = "red") 



my_table %>% 
  bg(., i= ~ hospital == "Military Hospital", part = "body", bg = "#91c293") 



border_style = officer::fp_border(color="black", width=1)

pacman::p_load(
  rio,            # import/export
  here,           # file pathways
  flextable,      # make HTML tables 
  officer,        # helper functions for tables
  tidyverse)      # data management, summary, and visualization

table <- linelist %>% 

  # Get summary values per hospital-outcome group
  ###############################################
  group_by(hospital, outcome) %>%                      # Group data
  summarise(                                           # Create new summary columns of indicators of interest
    N = n(),                                            # Number of rows per hospital-outcome group     
    ct_value = median(ct_blood, na.rm=T)) %>%           # median CT value per group
  
  # add totals
  ############
  bind_rows(                                           # Bind the previous table with this mini-table of totals
    linelist %>% 
      filter(!is.na(outcome) & hospital != "Missing") %>%
      group_by(outcome) %>%                            # Grouped only by outcome, not by hospital    
      summarise(
        N = n(),                                       # Number of rows for whole dataset     
        ct_value = median(ct_blood, na.rm=T))) %>%     # Median CT for whole dataset
  
  # Pivot wider and format
  ########################
  mutate(hospital = replace_na(hospital, "Total")) %>% 
  pivot_wider(                                         # Pivot from long to wide
    values_from = c(ct_value, N),                       # new values are from ct and count columns
    names_from = outcome) %>%                           # new column names are from outcomes
  mutate(                                              # Add new columns
    N_Known = N_Death + N_Recover,                               # number with known outcome
    Pct_Death = scales::percent(N_Death / N_Known, 0.1),         # percent cases who died (to 1 decimal)
    Pct_Recover = scales::percent(N_Recover / N_Known, 0.1)) %>% # percent who recovered (to 1 decimal)
  select(                                              # Re-order columns
    hospital, N_Known,                                   # Intro columns
    N_Recover, Pct_Recover, ct_value_Recover,            # Recovered columns
    N_Death, Pct_Death, ct_value_Death)  %>%             # Death columns
  arrange(N_Known) %>%                                 # Arrange rows from lowest to highest (Total row at bottom)

  # formatting
  ############
  flextable() %>%              # table is piped in from above
  add_header_row(
    top = TRUE,                # New header goes on top of existing header row
    values = c("Hospital",     # Header values for each column below
               "Total cases with known outcome", 
               "Recovered",    # This will be the top-level header for this and two next columns
               "",
               "",
               "Died",         # This will be the top-level header for this and two next columns
               "",             # Leave blank, as it will be merged with "Died"
               "")) %>% 
    set_header_labels(         # Rename the columns in original header row
      hospital = "", 
      N_Known = "",                  
      N_Recover = "Total",
      Pct_Recover = "% of cases",
      ct_value_Recover = "Median CT values",
      N_Death = "Total",
      Pct_Death = "% of cases",
      ct_value_Death = "Median CT values")  %>% 
  merge_at(i = 1, j = 3:5, part = "header") %>% # Horizontally merge columns 3 to 5 in new header row
  merge_at(i = 1, j = 6:8, part = "header") %>%  
  border_remove() %>%  
  theme_booktabs() %>% 
  vline(part = "all", j = 2, border = border_style) %>%   # at column 2 
  vline(part = "all", j = 5, border = border_style) %>%   # at column 5
  merge_at(i = 1:2, j = 1, part = "header") %>% 
  merge_at(i = 1:2, j = 2, part = "header") %>% 
  width(j=1, width = 2.7) %>% 
  width(j=2, width = 1.5) %>% 
  width(j=c(4,5,7,8), width = 1) %>% 
  flextable::align(., align = "center", j = c(2:8), part = "all") %>% 
  bg(., part = "body", bg = "gray95")  %>% 
  bg(., j=c(1:8), i= ~ hospital == "Military Hospital", part = "body", bg = "#91c293") %>% 
  colformat_num(., j = c(4,7), digits = 1) %>%
  bold(i = 1, bold = TRUE, part = "header") %>% 
  bold(i = 7, bold = TRUE, part = "body")

table

# # Edit the 'my table' as needed for the title of table.  
# save_as_docx("my table" = my_table, path = "file.docx")
#
# save_as_image(my_table, path = "file.png")

# print(my_table, preview = "docx") # Word document example
# print(my_table, preview = "pptx") # Powerpoint example



# Chapter 30 - ggplot basics

pacman::p_load(
  tidyverse,      # includes ggplot2 and other data management tools
  janitor,        # cleaning and summary tables
  ggforce,        # ggplot extras
  rio,            # import/export
  here,           # file locator
  stringr         # working with characters   
)

linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL


# linelist <- rio::import("linelist_cleaned.rds")

# make display version of columns with more friendly names
linelist <- linelist %>%
  mutate(
    gender_disp = case_when(gender == "m" ~ "Male",        # m to Male 
                            gender == "f" ~ "Female",      # f to Female,
                            is.na(gender) ~ "Unknown"),    # NA to Unknown
    
    outcome_disp = replace_na(outcome, "Unknown")          # replace NA outcome with "unknown"
  )

symptoms_data <- linelist %>% 
  select(c(case_id, fever, chills, cough, aches, vomit))

symptoms_data_long <- symptoms_data %>%    # begin with "mini" linelist called symptoms_data
  
  pivot_longer(
    cols = -case_id,                       # pivot all columns except case_id (all the symptoms columns)
    names_to = "symptom_name",             # assign name for new column that holds the symptoms
    values_to = "symptom_is_present") %>%  # assign name for new column that holds the values (yes/no)
  
  mutate(symptom_is_present = replace_na(symptom_is_present, "unknown")) # convert NA to "unknown"


# # plot data from my_data columns as red points
# ggplot(data = my_data)+                   # use the dataset "my_data"
#   geom_point(                             # add a layer of points (dots)
#     mapping = aes(x = col1, y = col2),    # "map" data column to axes
#     color = "red")+                       # other specification for the geom
#   labs()+                                 # here you add titles, axes labels, etc.
#   theme()                                 # here you adjust color, font, size etc of non-data plot elements (axes, title, etc.) 

# # This will create plot that is a blank canvas
# ggplot(data = linelist)

ggplot(data = linelist, mapping = aes(x = age, y = wt_kg))+
  geom_point()

ggplot(data = linelist, mapping = aes(x = age))+
  geom_histogram()

# scatterplot
ggplot(data = linelist, mapping = aes(x = age, y = wt_kg))+  # set data and axes mapping
  geom_point(color = "darkgreen", size = 0.5, alpha = 0.2)         # set static point aesthetics

# histogram
ggplot(data = linelist, mapping = aes(x = age))+       # set data and axes
  geom_histogram(              # display histogram
    binwidth = 7,                # width of bins
    color = "red",               # bin line color
    fill = "blue",               # bin interior color
    alpha = 0.1)                 # bin transparency

# scatterplot
ggplot(data = linelist,   # set data
       mapping = aes(     # map aesthetics to column values
         x = age,           # map x-axis to age            
         y = wt_kg,         # map y-axis to weight
         color = age)
       )+     # map color to age
  geom_point()         # display data as points 

# scatterplot
ggplot(data = linelist,   # set data
       mapping = aes(     # map aesthetics to column values
         x = age,           # map x-axis to age            
         y = wt_kg,         # map y-axis to weight
         color = age,       # map color to age
         size = age))+      # map size to age
  geom_point(             # display data as points
    shape = "diamond",      # points display as diamonds
    alpha = 0.3)            # point transparency at 30%



ggplot(data = linelist,
       mapping = aes(           # map aesthetics to columns
         x = age,
         y = wt_kg,
         color = age_years)
       ) + 
  geom_point(                   # add points for each row of data
    size = 1,
    alpha = 0.5) +  
  geom_smooth(                  # add a trend line 
    method = "lm",              # with linear method
    linewidth = 2)                   # size (width of line) of 2

# # These commands will produce the exact same plot
# ggplot(data = linelist, mapping = aes(x = age))+
#   geom_histogram()
#
# ggplot(data = linelist)+
#   geom_histogram(mapping = aes(x = age))
#
# ggplot()+
#   geom_histogram(data = linelist, mapping = aes(x = age))

ggplot(data = linelist,
       mapping = aes(x = age, y = wt_kg, color = gender))+
  geom_point(alpha = 0.5)

# # This alternative code produces the same plot
# ggplot(data = linelist,
#        mapping = aes(x = age, y = wt_kg))+
#   geom_point(
#     mapping = aes(color = gender),
#     alpha = 0.5)
#

# These data are daily counts of malaria cases, by facility-day
malaria_data <- import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/malaria_facility_count_data.rds") %>%  # import  # FIX: local file -> URL
  select(-submitted_date, -Province, -newid)                                 # remove unneeded columns


# A plot with facets by district
ggplot(malaria_data, aes(x = data_date, y = malaria_tot)) +
  geom_col(width = 1, fill = "darkred") +       # plot the count data as columns
  theme_minimal()+                              # simplify the background panels
  labs(                                         # add plot labels, title, etc.
    x = "Date of report",
    y = "Malaria cases",
    title = "Malaria cases by district") +
  facet_wrap(~District)                       # the facets are created

malaria_age <- malaria_data %>%
  select(-malaria_tot) %>% 
  pivot_longer(
    cols = c(starts_with("malaria_rdt_")),  # choose columns to pivot longer
    names_to = "age_group",      # column names become age group
    values_to = "num_cases"      # values to a single column (num_cases)
  ) %>%
  mutate(
    age_group = str_replace(age_group, "malaria_rdt_", ""),
    age_group = forcats::fct_relevel(age_group, "5-14", after = 1))

ggplot(malaria_age, aes(x = data_date, y = num_cases)) +
  geom_col(fill = "darkred", width = 1) +
  theme_minimal()+
  labs(
    x = "Date of report",
    y = "Malaria cases",
    title = "Malaria cases by district and age group"
  ) +
  facet_grid(District ~ age_group)


# Free y-axis
ggplot(malaria_data, aes(x = data_date, y = malaria_tot)) +
  geom_col(width = 1, fill = "darkred") +       # plot the count data as columns
  theme_minimal()+                              # simplify the background panels
  labs(                                         # add plot labels, title, etc.
    x = "Date of report",
    y = "Malaria cases",
    title = "Malaria cases by district - 'free' x and y axes") +
  facet_wrap(~District, scales = "free")        # the facets are created

# define plot
age_by_wt <- ggplot(data = linelist, mapping = aes(x = age_years, y = wt_kg, color = age_years))+
  geom_point(alpha = 0.1)

# print
age_by_wt    

age_by_wt+
  geom_vline(xintercept = 50)

age_by_wt <- ggplot(
  data = linelist,   # set data
  mapping = aes(     # map aesthetics to column values
         x = age,           # map x-axis to age            
         y = wt_kg,         # map y-axis to weight
         color = age))+     # map color to age
  geom_point()+           # display data as points
  labs(
    title = "Age and weight distribution",
    subtitle = "Fictional Ebola outbreak, 2014",
    x = "Age in years",
    y = "Weight in kilos",
    color = "Age",
    caption = stringr::str_glue("Data as of {max(linelist$date_hospitalisation, na.rm=T)}"))

age_by_wt


ggplot(data = linelist, mapping = aes(x = age, y = wt_kg))+  
  geom_point(color = "darkgreen", size = 0.5, alpha = 0.2)+
  labs(title = "Theme classic")+
  theme_classic()

ggplot(data = linelist, mapping = aes(x = age, y = wt_kg))+  
  geom_point(color = "darkgreen", size = 0.5, alpha = 0.2)+
  labs(title = "Theme bw")+
  theme_bw()

ggplot(data = linelist, mapping = aes(x = age, y = wt_kg))+  
  geom_point(color = "darkgreen", size = 0.5, alpha = 0.2)+
  labs(title = "Theme minimal")+
  theme_minimal()

ggplot(data = linelist, mapping = aes(x = age, y = wt_kg))+  
  geom_point(color = "darkgreen", size = 0.5, alpha = 0.2)+
  labs(title = "Theme gray")+
  theme_gray()
  



age_by_wt + 
  theme_classic()+                                 # pre-defined theme adjustments
  theme(
    legend.position = "bottom",                    # move legend to bottom
    
    plot.title = element_text(size = 30),          # size of title to 30
    plot.caption = element_text(hjust = 0),        # left-align caption
    plot.subtitle = element_text(face = "italic"), # italicize subtitle
    
    axis.text.x = element_text(color = "red", size = 15, angle = 90), # adjusts only x-axis text
    axis.text.y = element_text(size = 15),         # adjusts only y-axis text
    
    axis.title = element_text(size = 20)           # adjusts both axes titles
    )     

linelist %>%                                                     # begin with linelist
  select(c(case_id, fever, chills, cough, aches, vomit)) %>%     # select columns
  pivot_longer(                                                  # pivot longer
    cols = -case_id,                                  
    names_to = "symptom_name",
    values_to = "symptom_is_present") %>%
  mutate(                                                        # replace missing values
    symptom_is_present = replace_na(symptom_is_present, "unknown")) %>% 
  
  ggplot(                                                        # begin ggplot!
    mapping = aes(x = symptom_name, fill = symptom_is_present))+
  geom_bar(position = "fill", col = "black") +                    
  theme_classic() +
  labs(
    x = "Symptom",
    y = "Symptom status (proportion)"
  )

# A) Regular histogram
ggplot(data = linelist, aes(x = age))+  # provide x variable
  geom_histogram()+
  labs(title = "A) Default histogram (30 bins)")

# B) More bins
ggplot(data = linelist, aes(x = age))+  # provide x variable
  geom_histogram(bins = 50)+
  labs(title = "B) Set to 50 bins")

# C) Fewer bins
ggplot(data = linelist, aes(x = age))+  # provide x variable
  geom_histogram(bins = 5)+
  labs(title = "C) Set to 5 bins")


# D) More bins
ggplot(data = linelist, aes(x = age))+  # provide x variable
  geom_histogram(binwidth = 1)+
  labs(title = "D) binwidth of 1")


# Frequency with proportion axis, smoothed
ggplot(data = linelist, mapping = aes(x = age)) +
  geom_density(linewidth = 2, alpha = 0.2)+
  labs(title = "Proportional density")

# Stacked frequency with proportion axis, smoothed
ggplot(data = linelist, mapping = aes(x = age, fill = gender)) +
  geom_density(linewidth = 2, alpha = 0.2, position = "stack")+
  labs(title = "'Stacked' proportional densities")

# "Stacked" histogram
ggplot(data = linelist, mapping = aes(x = age, fill = gender)) +
  geom_histogram(binwidth = 2)+
  labs(title = "'Stacked' histogram")

# Frequency 
ggplot(data = linelist, mapping = aes(x = age, color = gender)) +
  geom_freqpoly(binwidth = 2, linewidth = 2)+
  labs(title = "Freqpoly")

# Frequency with proportion axis
ggplot(data = linelist, mapping = aes(x = age, y = after_stat(density), color = gender)) +
  geom_freqpoly(binwidth = 5, linewidth = 2)+
  labs(title = "Proportional freqpoly")

# Frequency with proportion axis, smoothed
ggplot(data = linelist, mapping = aes(x = age, y = after_stat(density), fill = gender)) +
  geom_density(linewidth = 2, alpha = 0.2)+
  labs(title = "Proportional, smoothed with geom_density()")

# A) Overall boxplot
ggplot(data = linelist)+  
  geom_boxplot(mapping = aes(y = age))+   # only y axis mapped (not x)
  labs(title = "A) Overall boxplot")

# B) Box plot by group
ggplot(data = linelist, mapping = aes(y = age, x = gender, fill = gender)) + 
  geom_boxplot()+                     
  theme(legend.position = "none")+   # remove legend (redundant)
  labs(title = "B) Boxplot by gender")      



# A) Jitter plot by group
ggplot(data = linelist %>% drop_na(outcome),      # remove missing values
       mapping = aes(y = age,                     # Continuous variable
           x = outcome,                           # Grouping variable
           color = outcome))+                     # Color variable
  geom_jitter()+                                  # Create the violin plot
  labs(title = "A) jitter plot by gender")     



# B) Violin plot by group
ggplot(data = linelist %>% drop_na(outcome),       # remove missing values
       mapping = aes(y = age,                      # Continuous variable
           x = outcome,                            # Grouping variable
           fill = outcome))+                       # fill variable (color)
  geom_violin()+                                   # create the violin plot
  labs(title = "B) violin plot by gender")    


# A) Sina plot by group
ggplot(
  data = linelist %>% drop_na(outcome), 
  aes(y = age,           # numeric variable
      x = outcome)) +    # group variable
  geom_violin(
    aes(fill = outcome), # fill (color of violin background)
    color = "white",     # white outline
    alpha = 0.2)+        # transparency
  geom_sina(
    size=1,                # Change the size of the jitter
    aes(color = outcome))+ # color (color of dots)
  scale_fill_manual(       # Define fill for violin background by death/recover
    values = c("Death" = "#bf5300", 
              "Recover" = "#11118c")) + 
  scale_color_manual(      # Define colours for points by death/recover
    values = c("Death" = "#bf5300", 
              "Recover" = "#11118c")) + 
  theme_minimal() +                                # Remove the gray background
  theme(legend.position = "none") +                # Remove unnecessary legend
  labs(title = "B) violin and sina plot by gender, with extra formatting")      



# Basic scatter plot of weight and age
ggplot(data = linelist, 
       mapping = aes(y = wt_kg, x = age))+
  geom_point() +
  labs(title = "A) Scatter plot of weight and age")

# Scatter plot of weight and age by gender and Ebola outcome
ggplot(data = linelist %>% drop_na(gender, outcome), # filter retains non-missing gender/outcome
       mapping = aes(y = wt_kg, x = age))+
  geom_point() +
  labs(title = "B) Scatter plot of weight and age faceted by gender and outcome")+
  facet_grid(gender ~ outcome) 


# View class of hospital column - we can see it is a character
class(linelist$hospital)

# Look at values and proportions within hospital column
linelist %>% 
  tabyl(hospital)

# Convert to factor and define level order so "Other" and "Missing" are last
linelist <- linelist %>% 
  mutate(
    hospital = fct_relevel(hospital, 
      "St. Mark's Maternity Hospital (SMMH)",
      "Port Hospital", 
      "Central Hospital",
      "Military Hospital",
      "Other",
      "Missing"))


levels(linelist$hospital)

# A) Outcomes in all cases
ggplot(linelist %>% drop_na(outcome)) + 
  geom_bar(aes(y = fct_rev(hospital)), width = 0.7) +
  theme_minimal()+
  labs(title = "A) Number of cases by hospital",
       y = "Hospital")


# B) Outcomes in all cases by hosptial
ggplot(linelist %>% drop_na(outcome)) + 
  geom_bar(aes(y = fct_rev(hospital), fill = outcome), width = 0.7) +
  theme_minimal()+
  theme(legend.position = "bottom") +
  labs(title = "B) Number of recovered and dead Ebola cases, by hospital",
       y = "Hospital")


outcomes <- linelist %>% 
  drop_na() %>% 
  group_by(outcome) %>% 
  count %>% 
  ungroup() %>% # Ungroup so proportion is out of total
  mutate(proportion = n/sum(n)*100) # Caculate percentage
  
outcomes #View full table

# Outcomes in all cases
ggplot(outcomes) + 
  geom_col(aes(x=outcome, y = proportion)) +
  labs(subtitle = "Number of recovered and dead Ebola cases")


outcomes2 <- linelist %>% 
  drop_na(outcome) %>% 
  count(hospital, outcome) %>%  # get counts by hospital and outcome
  group_by(hospital) %>%        # Group so proportions are out of hospital total
  mutate(proportion = n/sum(n)*100) # calculate proportions of hospital total

head(outcomes2) # Preview data


# Outcomes in all cases by hospital
ggplot(outcomes2) +  
  geom_col(
    mapping = aes(
      x = proportion,                 # show pre-calculated proportion values
      y = fct_rev(hospital),          # reverse level order so missing/other at bottom
      fill = outcome),                # stacked by outcome
    width = 0.5)+                    # thinner bars (out of 1)
  theme_minimal() +                  # Minimal theme 
  theme(legend.position = "bottom")+
  labs(subtitle = "Number of recovered and dead Ebola cases, by hospital",
       fill = "Outcome",             # legend title
       y = "Count",                  # y axis title
       x = "Hospital of admission")+ # x axis title
  scale_fill_manual(                 # adding colors manually
    values = c("Death"= "#3B1c8C",
               "Recover" = "#21908D" )) 




# Chapter 31 - ggplot tips

pacman::p_load(
  tidyverse,      # includes ggplot2 and other
  rio,            # import/export
  here,           # file locator
  stringr,        # working with characters   
  scales,         # transform numbers
  ggrepel,        # smartly-placed labels
  gghighlight,    # highlight one part of plot
  RColorBrewer    # color scales
)

linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL


# linelist <- rio::import("linelist_cleaned.rds")

# histogram - 
ggplot(data = linelist, mapping = aes(x = age))+       # set data and axes
  geom_histogram(              # display histogram
    binwidth = 7,                # width of bins
    color = "red",               # bin line color
    fill = "lightblue")          # bin interior color (fill) 

# Static color for points and for line
ggplot(data = linelist, mapping = aes(x = age, y = wt_kg))+     
  geom_point(color = "purple")+
  geom_vline(xintercept = 50, color = "orange")+
  labs(title = "Static color for points and line")

# Color mapped to continuous column
ggplot(data = linelist, mapping = aes(x = age, y = wt_kg))+     
  geom_point(mapping = aes(color = temp))+         
  labs(title = "Color mapped to continuous column")

# Color mapped to discrete column
ggplot(data = linelist, mapping = aes(x = age, y = wt_kg))+     
  geom_point(mapping = aes(color = gender))+         
  labs(title = "Color mapped to discrete column")

# bar plot, fill to discrete column, color to static value
ggplot(data = linelist, mapping = aes(x = hospital))+     
  geom_bar(mapping = aes(fill = gender), color = "yellow")+         
  labs(title = "Fill mapped to discrete column, static color")


# BASELINE - no scale adjustment
ggplot(data = linelist)+
  geom_bar(mapping = aes(x = outcome, fill = gender))+
  labs(title = "Baseline - no scale adjustments")

# SCALES ADJUSTED
ggplot(data = linelist)+
  
  geom_bar(mapping = aes(x = outcome, fill = gender), color = "black")+
  
  theme_minimal()+                   # simplify background
  
  scale_y_continuous(                # continuous scale for y-axis (counts)
    expand = c(0,0),                 # no padding
    breaks = seq(from = 0,
                 to = 3000,
                 by = 500))+
  
  scale_x_discrete(                   # discrete scale for x-axis (gender)
    expand = c(0,0),                  # no padding
    drop = FALSE,                     # show all factor levels (even if not in data)
    na.translate = FALSE,             # remove NA outcomes from plot
    labels = c("Died", "Recovered"))+ # Change display of values
    
  
  scale_fill_manual(                  # Manually specify fill (bar interior color)
    values = c("m" = "violetred",     # reference values in data to assign colors
               "f" = "aquamarine"),
    labels = c("m" = "Male",          # re-label the legend (use "=" assignment to avoid mistakes)
              "f" = "Female",
              "Missing"),
    name = "Gender",                  # title of legend
    na.value = "grey"                 # assign a color for missing values
  )+
  labs(title = "Adjustment of scales") # Adjust the title of the fill legend

# BASELINE - no scale adjustment
ggplot(data = linelist)+
  geom_bar(mapping = aes(x = outcome, fill = gender))+
  labs(title = "Baseline - no scale adjustments")

# 
ggplot(data = linelist)+
  geom_bar(mapping = aes(x = outcome, fill = gender))+
  scale_y_continuous(
    breaks = seq(
      from = 0,
      to = 3000,
      by = 100)
  )+
  labs(title = "Adjusted y-axis breaks")


# Original y-axis proportions
#############################
linelist %>%                                   # start with linelist
  group_by(hospital) %>%                       # group data by hospital
  summarise(                                   # create summary columns
    n = n(),                                     # total number of rows in group
    deaths = sum(outcome == "Death", na.rm=T),   # number of deaths in group
    prop_death = deaths/n) %>%                   # proportion deaths in group
  ggplot(                                      # begin plotting
    mapping = aes(
      x = hospital,
      y = prop_death))+ 
  geom_col()+
  theme_minimal()+
  labs(title = "Display y-axis original proportions")



# Display y-axis proportions as percents
########################################
linelist %>%         
  group_by(hospital) %>% 
  summarise(
    n = n(),
    deaths = sum(outcome == "Death", na.rm=T),
    prop_death = deaths/n) %>% 
  ggplot(
    mapping = aes(
      x = hospital,
      y = prop_death))+
  geom_col()+
  theme_minimal()+
  labs(title = "Display y-axis as percents (%)")+
  scale_y_continuous(
    labels = scales::percent                    # display proportions as percents
  )


plot_data <- data.frame(
  region = c("A", "B", "C", "D", "E", "F", "G", "H", "I"),
  preparedness_index = c(8.8, 7.5, 3.4, 3.6, 2.1, 7.9, 7.0, 5.6, 1.0),
  cases_cumulative = c(15, 45, 80, 20, 21, 7, 51, 30, 1442)
)

plot_data

# Original y-axis
preparedness_plot <- ggplot(data = plot_data,  
       mapping = aes(
         x = preparedness_index,
         y = cases_cumulative))+
  geom_point(size = 2)+            # points for each region 
  geom_text(
    mapping = aes(label = region),
    vjust = 1.5)+                  # add text labels
  theme_minimal()

preparedness_plot                  # print original plot


# print with y-axis transformed
preparedness_plot+                   # begin with plot saved above
  scale_y_continuous(trans = "log2") # add transformation for y-axis

case_source_relationships <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/godata/relationships_clean.rds") %>%  # FIX: local file -> URL
  select(source_age, target_age) 

trans_matrix <- ggplot(
    data = case_source_relationships,
    mapping = aes(x = source_age, y = target_age))+
  stat_density2d(
    geom = "raster",
    mapping = aes(fill = after_stat(density)),
    contour = FALSE)+
  theme_minimal()

trans_matrix
trans_matrix + scale_fill_viridis_c(option = "plasma")

trans_matrix + 
  scale_fill_gradient(     # 2-sided gradient scale
    low = "aquamarine",    # low value
    high = "purple",       # high value
    na.value = "grey",     # value for NA
    name = "Density")+     # Legend title
  labs(title = "Manually specify high/low colors")

# 3+ colors to scale
trans_matrix + 
  scale_fill_gradientn(    # 3-color scale (low/mid/high)
    colors = c("blue", "yellow","red") # provide colors in vector
  )+
  labs(title = "3-color scale")

# Use of rescale() to adjust placement of colors along scale
trans_matrix + 
  scale_fill_gradientn(    # provide any number of colors
    colors = c("blue", "yellow","red", "black"),
    values = scales::rescale(c(0, 0.05, 0.07, 0.10, 0.15, 0.20, 0.3, 0.5)) # positions for colors are rescaled between 0 and 1
    )+
  labs(title = "Colors not evenly positioned")

# use of limits to cut-off values that get fill color
trans_matrix + 
  scale_fill_gradientn(    
    colors = c("blue", "yellow","red"),
    limits = c(0, 0.0002))+
  labs(title = "Restrict value limits, resulting in grey space")


symp_plot <- linelist %>%                                         # begin with linelist
  select(c(case_id, fever, chills, cough, aches, vomit)) %>%     # select columns
  pivot_longer(                                                  # pivot longer
    cols = -case_id,                                  
    names_to = "symptom_name",
    values_to = "symptom_is_present") %>%
  mutate(                                                        # replace missing values
    symptom_is_present = replace_na(symptom_is_present, "unknown")) %>% 
  ggplot(                                                        # begin ggplot!
    mapping = aes(x = symptom_name, fill = symptom_is_present))+
  geom_bar(position = "fill", col = "black") +                    
  theme_classic() +
  theme(legend.position = "bottom")+
  labs(
    x = "Symptom",
    y = "Symptom status (proportion)"
  )

symp_plot  # print with default colors

#################################
# print with manually-specified colors
symp_plot +
  scale_fill_manual(
    values = c("yes" = "black",         # explicitly define colours
               "no" = "white",
               "unknown" = "grey"),
    breaks = c("yes", "no", "unknown"), # order the factors correctly
    name = ""                           # set legend to no title

  ) 

#################################
# print with viridis discrete colors
symp_plot +
  scale_fill_viridis_d(
    breaks = c("yes", "no", "unknown"),
    name = ""
  )



ggplot(
  data = linelist %>% drop_na(age_cat5),                         # remove rows where age_cat5 is missing
  mapping = aes(x = fct_relevel(age_cat5, "5-9", after = 1))) +  # relevel factor

  geom_bar() +
  
  labs(x = "Age group", y = "Number of hospitalisations",
       title = "Total hospitalisations by age group") +
  
  theme_minimal()



case_source_relationships %>% 
  ggplot(aes(x = source_age, y = target_age))+
  stat_density2d()+
  geom_point()+
  theme_minimal()+
  labs(title = "stat_density2d() + geom_point()")


case_source_relationships %>% 
  ggplot(aes(x = source_age, y = target_age))+
  stat_density2d_filled()+
  theme_minimal()+
  labs(title = "stat_density2d_filled()")


# Install/load ggExtra
pacman::p_load(ggExtra)

# Basic scatter plot of weight and age
scatter_plot <- ggplot(data = linelist)+
  geom_point(mapping = aes(y = wt_kg, x = age)) +
  labs(title = "Scatter plot of weight and age")

# with histograms
ggMarginal(
  scatter_plot,                     # add marginal histograms
  type = "histogram",               # specify histograms
  fill = "lightblue",               # bar fill
  xparams = list(binwidth = 10),    # other parameters for x-axis marginal
  yparams = list(binwidth = 5))     # other parameters for y-axis marginal


# Scatter plot, colored by outcome
# Outcome column is assigned as color in ggplot. groupFill in ggMarginal set to TRUE
scatter_plot_color <- ggplot(data = linelist %>% drop_na(gender))+
  geom_point(mapping = aes(y = wt_kg, x = age, color = gender)) +
  labs(title = "Scatter plot of weight and age")+
  theme(legend.position = "bottom")

ggMarginal(scatter_plot_color, type = "density", groupFill = TRUE)

# with boxplot 
ggMarginal(
  scatter_plot,
  margins = "x",      # only show x-axis marginal plot
  type = "boxplot")   

pacman::p_load(ggrepel)

linelist %>%                                               # start with linelist
  group_by(hospital) %>%                                   # group by hospital
  summarise(                                               # create new dataset with summary values per hospital
    n_cases = n(),                                           # number of cases per hospital
    delay_mean = round(mean(days_onset_hosp, na.rm=T),1),    # mean delay per hospital
  ) %>% 
  ggplot(mapping = aes(x = n_cases, y = delay_mean))+      # send data frame to ggplot
  geom_point(size = 2)+                                    # add points
  geom_label_repel(                                        # add point labels
    mapping = aes(
      label = stringr::str_glue(
        "{hospital}\n{n_cases} cases, {delay_mean} days")  # how label displays
      ), 
    size = 3,                                              # text size in labels
    min.segment.length = 0)+                               # show all line segments                
  labs(                                                    # add axes labels
    title = "Mean delay to admission, by hospital",
    x = "Number of cases",
    y = "Mean delay (days)")


ggplot()+
  # All points in grey
  geom_point(
    data = linelist,                                   # all data provided to this layer
    mapping = aes(x = ht_cm, y = wt_kg),
    color = "grey",
    alpha = 0.5)+                                              # grey and semi-transparent
  
  # Few points in black
  geom_point(
    data = linelist %>% filter(days_onset_hosp > 15),  # filtered data provided to this layer
    mapping = aes(x = ht_cm, y = wt_kg),
    alpha = 1)+                                                # default black and not transparent
  
  # point labels for few points
  geom_label_repel(
    data = linelist %>% filter(days_onset_hosp > 15),  # filter the data for the labels
    mapping = aes(
      x = ht_cm,
      y = wt_kg,
      fill = outcome,                                          # label color by outcome
      label = stringr::str_glue("Delay: {days_onset_hosp}d")), # label created with str_glue()
    min.segment.length = 0) +                                  # show line segments for all
  
  # remove letter "a" from inside legend boxes
  guides(fill = guide_legend(override.aes = aes(color = NA)))+
  
  # axis labels
  labs(
    title = "Cases with long delay to admission",
    y = "weight (kg)",
    x = "height(cm)")

# make epi curve by date of onset when available
ggplot(linelist, aes(x = date_onset)) +
  geom_histogram(binwidth = 7) +
  scale_x_date(
    # 1 break every 1 month
    date_breaks = "1 months",
    # labels should show month then date
    date_labels = "%b %d"
  ) +
  theme_classic()


ggplot(linelist, aes(x = date_onset)) +
  geom_histogram(binwidth = 7) +
  scale_x_date(
    labels = scales::label_date_short()  # automatically efficient date labels
  )+
  theme_classic()


# load gghighlight
library(gghighlight)

# replace NA values with unknown in the outcome variable
linelist <- linelist %>%
  mutate(outcome = replace_na(outcome, "Unknown"))

# produce a histogram of all cases by age
ggplot(
  data = linelist,
  mapping = aes(x = age_years, fill = outcome)) +
  geom_histogram() + 
  gghighlight::gghighlight(outcome == "Death")     # highlight instances where the patient has died.



# produce a histogram of all cases by age
linelist %>% 
  count(week = lubridate::floor_date(date_hospitalisation, "week"),
        hospital) %>% 
  ggplot()+
  geom_line(aes(x = week, y = n, color = hospital))+
  theme_minimal()+
  gghighlight::gghighlight() +                      # highlight instances where the patient has died
  facet_wrap(~hospital)                              # make facets by outcome


pacman::p_load(
  tidyverse,      # data manipulation and visualisation
  cowplot,        # combine plots
  patchwork       # combine plots
)

malaria_data <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/malaria_facility_count_data.rds")  # FIX: local file -> URL

# bar chart of total cases by district
p1 <- ggplot(malaria_data, aes(x = District, y = malaria_tot)) +
  geom_bar(stat = "identity") +
  labs(
    x = "District",
    y = "Total number of cases",
    title = "Total malaria cases by district"
  ) +
  theme_minimal()

# epidemic curve over time
p2 <- ggplot(malaria_data, aes(x = data_date, y = malaria_tot)) +
  geom_col(width = 1) +
  labs(
    x = "Date of data submission",
    y =  "number of cases"
  ) +
  theme_minimal()

cowplot::plot_grid(p1, p2,
                  # 1 column and two rows - stacked on top of each other
                   ncol = 1,
                   nrow = 2,
                   # top plot is 2/3 as tall as second
                   rel_heights = c(2, 3))



p1 <- linelist %>% 
  mutate(hospital = recode(hospital, "St. Mark's Maternity Hospital (SMMH)" = "St. Marks")) %>% 
  count(hospital, outcome) %>% 
  ggplot()+
  geom_col(mapping = aes(x = hospital, y = n, fill = outcome))+
  scale_fill_brewer(type = "qual", palette = 4, na.value = "grey")+
  coord_flip()+
  theme_minimal()+
  labs(title = "Cases by outcome")


p2 <- linelist %>% 
  mutate(hospital = recode(hospital, "St. Mark's Maternity Hospital (SMMH)" = "St. Marks")) %>% 
  count(hospital, age_cat) %>% 
  ggplot()+
  geom_col(mapping = aes(x = hospital, y = n, fill = age_cat))+
  scale_fill_brewer(type = "qual", palette = 1, na.value = "grey")+
  coord_flip()+
  theme_minimal()+
  theme(axis.text.y = element_blank())+
  labs(title = "Cases by age")


cowplot::plot_grid(p1, p2, rel_widths = c(0.3))


# Define plot 1 without legend
p1 <- linelist %>% 
  mutate(hospital = recode(hospital, "St. Mark's Maternity Hospital (SMMH)" = "St. Marks")) %>% 
  count(hospital, outcome) %>% 
  ggplot()+
  geom_col(mapping = aes(x = hospital, y = n, fill = outcome))+
  scale_fill_brewer(type = "qual", palette = 4, na.value = "grey")+
  coord_flip()+
  theme_minimal()+
  theme(legend.position = "none")+
  labs(title = "Cases by outcome")


# Define plot 2 without legend
p2 <- linelist %>% 
  mutate(hospital = recode(hospital, "St. Mark's Maternity Hospital (SMMH)" = "St. Marks")) %>% 
  count(hospital, age_cat) %>% 
  ggplot()+
  geom_col(mapping = aes(x = hospital, y = n, fill = age_cat))+
  scale_fill_brewer(type = "qual", palette = 1, na.value = "grey")+
  coord_flip()+
  theme_minimal()+
  theme(
    legend.position = "none",
    axis.text.y = element_blank(),
    axis.title.y = element_blank()
  )+
  labs(title = "Cases by age")


# extract legend from p1 (from p1 + legend)
leg_p1 <- cowplot::get_legend(p1 +
                                theme(legend.position = "right",        # extract vertical legend
                                      legend.justification = c(0,0.5))+ # so legends  align
                                labs(fill = "Outcome"))                 # title of legend
# extract legend from p2 (from p2 + legend)
leg_p2 <- cowplot::get_legend(p2 + 
                                theme(legend.position = "right",         # extract vertical legend   
                                      legend.justification = c(0,0.5))+  # so legends align
                                labs(fill = "Age Category"))             # title of legend

# create a blank plot for legend alignment
#blank_p <- patchwork::plot_spacer() + theme_void()

# create legends panel, can be one on top of the other (or use spacer commented above)
legends <- cowplot::plot_grid(leg_p1, leg_p2, nrow = 2, rel_heights = c(.3, .7))

# combine two plots and the combined legends panel
combined <- cowplot::plot_grid(p1, p2, legends, ncol = 3, rel_widths = c(.4, .4, .2))

combined  # print




# Define main plot
main_plot <- ggplot(data = linelist)+
  geom_histogram(aes(x = date_onset, fill = hospital))+
  scale_fill_brewer(type = "qual", palette = 1, na.value = "grey")+ 
  theme_half_open()+
  theme(legend.position = "bottom")+
  labs(title = "Epidemic curve and outcomes by hospital")


# Define inset plot
inset_plot <- linelist %>% 
  mutate(hospital = recode(hospital, "St. Mark's Maternity Hospital (SMMH)" = "St. Marks")) %>% 
  count(hospital, outcome) %>% 
  ggplot()+
    geom_col(mapping = aes(x = hospital, y = n, fill = outcome))+
    scale_fill_brewer(type = "qual", palette = 4, na.value = "grey")+
    coord_flip()+
    theme_minimal()+
    theme(legend.position = "none",
          axis.title.y = element_blank())+
    labs(title = "Cases by outcome") 


# Combine main with inset
cowplot::ggdraw(main_plot)+
     draw_plot(inset_plot,
               x = .6, y = .55,    #x = .07, y = .65,
               width = .4, height = .4)


pacman::p_load(cowplot)            # load/install cowplot

p1 <- linelist %>%                 # save plot as object
     count(
       epiweek = lubridate::floor_date(date_onset, "week")) %>% 
     ggplot()+
          geom_area(aes(x = epiweek, y = n), fill = "grey")+
          scale_x_date(
               date_breaks = "month",
               date_labels = "%b")+
     theme_cowplot()+
     labs(
       y = "Weekly cases"
     )

p1                                      # view plot 


p2 <- linelist %>%         # save plot as object
     group_by(
       epiweek = lubridate::floor_date(date_onset, "week")) %>% 
     summarise(
       n = n(),
       pct_death = 100*sum(outcome == "Death", na.rm=T) / n) %>% 
     ggplot(aes(x = epiweek, y = pct_death))+
          geom_line()+
          scale_x_date(
               date_breaks = "month",
               date_labels = "%b")+
          scale_y_continuous(
               position = "right")+
          theme_cowplot()+
          labs(
            x = "Epiweek of symptom onset",
            y = "Weekly percent of deaths",
            title = "Weekly case incidence and percent deaths"
          )

p2     # view plot

aligned_plots <- cowplot::align_plots(p1, p2, align="hv", axis="tblr")         # align the two plots and save them as list
aligned_plotted <- ggdraw(aligned_plots[[1]]) + draw_plot(aligned_plots[[2]])  # overlay them and save the visual plot
aligned_plotted                                                                # print the overlayed plots


# options(scipen=999)

scales::number(6.2e5)
scales::number(1506800.62,  accuracy = 0.1,)
scales::comma(1506800.62, accuracy = 0.01)
scales::comma(1506800.62, accuracy = 0.01,  big.mark = "." , decimal.mark = ",")
scales::percent(0.1)
scales::dollar(56)
scales::scientific(100000)



# Chapter 32 - Epidemic curves

pacman::p_load(
  rio,          # file import/export
  here,         # relative filepaths 
  lubridate,    # working with dates/epiweeks
  aweek,        # alternative package for working with dates/epiweeks
  incidence2,   # epicurves of linelist data
  i2extras,     # supplement to incidence2
  stringr,      # search and manipulate character strings
  forcats,      # working with factors
  RColorBrewer, # Color palettes from colorbrewer2.org
  tidyverse     # data management + ggplot2 graphics
) 

# import the linelist into R
linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL

# import the counts data into R
count_data <- linelist %>% 
  group_by(hospital, date_hospitalisation) %>% 
  summarize(n_cases = dplyr::n()) %>% 
  filter(date_hospitalisation > as.Date("2013-06-01")) %>% 
  ungroup()

# linelist <- import("linelist_cleaned.xlsx")

# # import the counts data into R
# count_data <- linelist %>% 
#   group_by(hospital, date_hospitalisation) %>% 
#   summarize(n_cases = dplyr::n()) %>% 
#   filter(date_hospitalisation > as.Date("2013-06-01")) %>% 
#   ungroup()

## set the report date for the report
## note: can be set to Sys.Date() for the current date
data_date <- as.Date("2015-05-15")

# check range of onset dates
ggplot(data = linelist)+
  geom_histogram(aes(x = date_onset))

# import the linelist into R
linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL

central_data <- linelist %>% 
  filter(hospital == "Central Hospital")

format(min(central_data$date_onset, na.rm=T), "%A %d %b, %Y")

monthly_breaks <- seq.Date(from = as.Date("2014-02-01"),
                           to = as.Date("2015-07-15"),
                           by = "months")

monthly_breaks   # print

# monthly 
ggplot(data = central_data) +  
  geom_histogram(
    mapping = aes(x = date_onset),
    breaks = monthly_breaks)+         # provide the pre-defined vector of breaks                    
  labs(title = "Monthly case bins")   # title

weekly_breaks <- seq.Date(from = as.Date("2014-02-01"),
                          to = as.Date("2015-07-15"),
                          by = "week")

# Sequence of weekly Monday dates for CENTRAL HOSPITAL
weekly_breaks_central <- seq.Date(
  from = floor_date(min(central_data$date_onset, na.rm=T),   "week", week_start = 1), # monday before first case
  to   = ceiling_date(max(central_data$date_onset, na.rm=T), "week", week_start = 1), # monday after last case
  by   = "week")

# Sequence for the entire outbreak
weekly_breaks_all <- seq.Date(
  from = floor_date(min(linelist$date_onset, na.rm=T),   "week", week_start = 1), # monday before first case
  to   = ceiling_date(max(linelist$date_onset, na.rm=T), "week", week_start = 1), # monday after last case
  by   = "week")

# TOTAL MONDAY WEEK ALIGNMENT
#############################
# Define sequence of weekly breaks
weekly_breaks_central <- seq.Date(
      from = floor_date(min(central_data$date_onset, na.rm=T),   "week", week_start = 1), # Monday before first case
      to   = ceiling_date(max(central_data$date_onset, na.rm=T), "week", week_start = 1), # Monday after last case
      by   = "week")    # bins are 7-days 


ggplot(data = central_data) + 
  
  # make histogram: specify bin break points: starts the Monday before first case, end Monday after last case
  geom_histogram(
    
    # mapping aesthetics
    mapping = aes(x = date_onset),  # date column mapped to x-axis
    
    # histogram bin breaks
    breaks = weekly_breaks_central, # histogram bin breaks defined previously
      
    closed = "left",  # count cases from start of breakpoint
    
    # bars
    color = "darkblue",     # color of lines around bars
    fill = "lightblue"      # color of fill within bars
  )+ 
    
  # x-axis labels
  scale_x_date(
    expand            = c(0,0),           # remove excess x-axis space before and after case bars
    date_breaks       = "4 weeks",        # date labels and major vertical gridlines appear every 3 Monday weeks
    date_minor_breaks = "week",           # minor vertical lines appear every Monday week
    date_labels       = "%a\n%d %b\n%Y")+ # date labels format
  
  # y-axis
  scale_y_continuous(
    expand = c(0,0))+             # remove excess y-axis space below 0 (align histogram flush with x-axis)
  
  # aesthetic themes
  theme_minimal()+                # simplify plot background
  
  theme(
    plot.caption = element_text(hjust = 0,        # caption on left side
                                face = "italic"), # caption in italics
    axis.title = element_text(face = "bold"))+    # axis titles in bold
  
  # labels including dynamic caption
  labs(
    title    = "Weekly incidence of cases (Monday weeks)",
    subtitle = "Note alignment of bars, vertical gridlines, and axis labels on Monday weeks",
    x        = "Week of symptom onset",
    y        = "Weekly incident cases reported",
    caption  = stringr::str_glue("n = {nrow(central_data)} from Central Hospital; Case onsets range from {format(min(central_data$date_onset, na.rm=T), format = '%a %d %b %Y')} to {format(max(central_data$date_onset, na.rm=T), format = '%a %d %b %Y')}\n{nrow(central_data %>% filter(is.na(date_onset)))} cases missing date of onset and not shown"))

# scale_x_date(
#     expand = c(0,0),
#
#     # specify interval of date labels and major vertical gridlines
#     breaks = seq.Date(
#       from = floor_date(min(central_data$date_onset, na.rm=T),   "week", week_start = 7), # Sunday before first case
#       to   = ceiling_date(max(central_data$date_onset, na.rm=T), "week", week_start = 7), # Sunday after last case
#       by   = "4 weeks"),
#
#     # specify interval of minor vertical gridline 
#     minor_breaks = seq.Date(
#       from = floor_date(min(central_data$date_onset, na.rm=T),   "week", week_start = 7), # Sunday before first case
#       to   = ceiling_date(max(central_data$date_onset, na.rm=T), "week", week_start = 7), # Sunday after last case
#       by   = "week"),
#
#     # date label format
#     #date_labels = "%a\n%d %b\n%Y")+         # day, above month abbrev., above 2-digit year
#     label = scales::label_date_short())+ # automatic label formatting
#

# aes(x = date_onset, group = gender, fill = gender)

ggplot(data = linelist) +     # begin with linelist (many hospitals)
  
  # make histogram: specify bin break points: starts the Monday before first case, end Monday after last case
  geom_histogram(
    mapping = aes(
      x = date_onset,
      group = hospital,       # set data to be grouped by hospital
      fill = hospital),       # bar fill (inside color) by hospital
    
    # bin breaks are Monday weeks
    breaks = weekly_breaks_all,   # sequence of weekly Monday bin breaks for whole outbreak, defined in previous code       
    
    closed = "left",          # count cases from start of breakpoint

    # Color around bars
    color = "black")

ggplot(data = linelist)+           # begin with linelist (many hospitals)
  
  # make histogram
  geom_histogram(
    mapping = aes(x = date_onset,
        group = hospital,          # cases grouped by hospital
        fill = hospital),          # bar fill by hospital
    
    # bin breaks
    breaks = weekly_breaks_all,    # sequence of weekly Monday bin breaks, defined in previous code
    
    closed = "left",               # count cases from start of breakpoint

    # Color around bars
    color = "black")+              # border color of each bar
  
  # manual specification of colors
  scale_fill_manual(
    values = c("black", "orange", "grey", "beige", "blue", "brown"),
    labels = c("St. Mark's Maternity Hospital (SMMH)" = "St. Mark's"),
    name = "Hospital") # specify fill colors ("values") - attention to order!

# load forcats package for working with factors
pacman::p_load(forcats)

# Define new dataset with hospital as factor
plot_data <- linelist %>% 
  mutate(hospital = fct_relevel(hospital, c("Missing", "Other"))) # Convert to factor and set "Missing" and "Other" as top levels to appear on epicurve top

levels(plot_data$hospital) # print levels in order

ggplot(plot_data) +                     # Use NEW dataset with hospital as re-ordered factor
  
  # make histogram
  geom_histogram(
    mapping = aes(x = date_onset,
        group = hospital,               # cases grouped by hospital
        fill = hospital),               # bar fill (color) by hospital
    
    breaks = weekly_breaks_all,         # sequence of weekly Monday bin breaks for whole outbreak, defined at top of ggplot section
    
    closed = "left",                    # count cases from start of breakpoint

    color = "black")+                   # border color around each bar
    
  # x-axis labels
  scale_x_date(
    expand            = c(0,0),           # remove excess x-axis space before and after case bars
    date_breaks       = "3 weeks",        # labels appear every 3 Monday weeks
    date_minor_breaks = "week",           # vertical lines appear every Monday week
    label = scales::label_date_short()) + # efficient label formatting
  
  # y-axis
  scale_y_continuous(
    expand = c(0,0))+                   # remove excess y-axis space below 0
  
  # manual specification of colors, ! attention to order
  scale_fill_manual(
    values = c("grey", "beige", "black", "orange", "blue", "brown"),
    labels = c("St. Mark's Maternity Hospital (SMMH)" = "St. Mark's"),
    name = "Hospital")+ 
  
  # aesthetic themes
  theme_minimal()+                      # simplify plot background
  
  theme(
    plot.caption = element_text(face = "italic", # caption on left side in italics
                                hjust = 0), 
    axis.title = element_text(face = "bold"))+   # axis titles in bold
  
  # labels
  labs(
    title    = "Weekly incidence of cases by hospital",
    subtitle = "Hospital as re-ordered factor",
    x        = "Week of symptom onset",
    y        = "Weekly cases")

ggplot(central_data %>% drop_na(gender))+   # begin with Central Hospital cases dropping missing gender
    geom_histogram(
        mapping = aes(
          x = date_onset,
          group = gender,         # cases grouped by gender
          fill = gender),         # bars filled by gender
        
        # histogram bin breaks
        breaks = weekly_breaks_central,   # sequence of weekly dates for Central outbreak - defined at top of ggplot section
        
        closed = "left",          # count cases from start of breakpoint
        
        color = "black",          # bar edge color
        
        position = "dodge")+      # SIDE-BY-SIDE bars
                      
  
  # The labels on the x-axis
  scale_x_date(expand            = c(0,0),          # remove excess x-axis space below and after case bars
               date_breaks       = "3 weeks",       # labels appear every 3 Monday weeks
               date_minor_breaks = "week",          # vertical lines appear every Monday week
               label = scales::label_date_short())+ # efficient date labels
  
  # y-axis
  scale_y_continuous(expand = c(0,0))+             # removes excess y-axis space between bottom of bars and the labels
  
  #scale of colors and legend labels
  scale_fill_manual(values = c("brown", "orange"),  # specify fill colors ("values") - attention to order!
                    na.value = "grey" )+     

  # aesthetic themes
  theme_minimal()+                                               # a set of themes to simplify plot
  theme(plot.caption = element_text(face = "italic", hjust = 0), # caption on left side in italics
        axis.title = element_text(face = "bold"))+               # axis titles in bold
  
  # labels
  labs(title    = "Weekly incidence of cases, by gender",
       subtitle = "Subtitle",
       fill     = "Gender",                                      # provide new title for legend
       x        = "Week of symptom onset",
       y        = "Weekly incident cases reported")

# scale_x_date(limits = c(as.Date("2014-04-01"), NA)) # sets a minimum date but leaves the maximum open.  

# scale_x_date(limits = c(NA, Sys.Date()) # ensures date axis will extend until current date  

# 7-day bins + Monday labels
#############################
ggplot(central_data) +
  geom_histogram(
    mapping = aes(x = date_onset),
    binwidth = 7,                 # 7-day bins with start at first case
    color = "darkblue",
    fill = "lightblue") +
  
  scale_x_date(
    expand = c(0,0),                     # remove excess x-axis space below and after case bars
    date_breaks = "3 weeks",             # Monday every 3 weeks
    date_minor_breaks = "week",          # Monday weeks
    label = scales::label_date_short())+ # automatic label formatting
  
  scale_y_continuous(
    expand = c(0,0))+              # remove excess space under x-axis, make flush
  
  labs(
    title = "MISALIGNED",
    subtitle = "! CAUTION: 7-day bars start Thursdays at first case\nDate labels and gridlines on Mondays\nNote how ticks don't align with bars")



# 7-day bins + Months
#####################
ggplot(central_data) +
  geom_histogram(
    mapping = aes(x = date_onset),
    binwidth = 7,
    color = "darkblue",
    fill = "lightblue") +
  
  scale_x_date(
    expand = c(0,0),                     # remove excess x-axis space below and after case bars
    date_breaks = "months",              # 1st of month
    date_minor_breaks = "week",          # Monday weeks
    label = scales::label_date_short())+ # automatic label formatting
  
  scale_y_continuous(
    expand = c(0,0))+                 # remove excess space under x-axis, make flush 
  
  labs(
    title = "MISALIGNED",
    subtitle = "! CAUTION: 7-day bars start Thursdays with first case\nMajor gridlines and date labels at 1st of each month\nMinor gridlines weekly on Mondays\nNote uneven spacing of some gridlines and ticks unaligned with bars")


# TOTAL MONDAY ALIGNMENT: specify manual bin breaks to be mondays
#################################################################
ggplot(central_data) + 
  geom_histogram(
    mapping = aes(x = date_onset),
    
    # histogram breaks set to 7 days beginning Monday before first case
    breaks = weekly_breaks_central,    # defined earlier in this page
    
    closed = "left",                   # count cases from start of breakpoint
    
    color = "darkblue",
    
    fill = "lightblue") + 
  
  scale_x_date(
    expand = c(0,0),                     # remove excess x-axis space below and after case bars
    date_breaks = "4 weeks",             # Monday every 4 weeks
    date_minor_breaks = "week",          # Monday weeks 
    label = scales::label_date_short())+ # label formatting
  
  scale_y_continuous(
    expand = c(0,0))+                  # remove excess space under x-axis, make flush 
  
  labs(
    title = "ALIGNED Mondays",
    subtitle = "7-day bins manually set to begin Monday before first case (28 Apr)\nDate labels and gridlines on Mondays as well")


# TOTAL MONDAY ALIGNMENT WITH MONTHS LABELS:
############################################
ggplot(central_data) + 
  geom_histogram(
    mapping = aes(x = date_onset),
    
    # histogram breaks set to 7 days beginning Monday before first case
    breaks = weekly_breaks_central,    # defined earlier in this page
    
    closed = "left",                   # count cases from start of breakpoint
    
    color = "darkblue",
    
    fill = "lightblue") + 
  
  scale_x_date(
    expand = c(0,0),                     # remove excess x-axis space below and after case bars
    date_breaks = "months",              # Monday every 4 weeks
    date_minor_breaks = "week",          # Monday weeks 
    label = scales::label_date_short())+ # label formatting
  
  scale_y_continuous(
    expand = c(0,0))+                  # remove excess space under x-axis, make flush 
  
  theme(panel.grid.major = element_blank())+  # Remove major gridlines (fall on 1st of month)
          
  labs(
    title = "ALIGNED Mondays with MONTHLY labels",
    subtitle = "7-day bins manually set to begin Monday before first case (28 Apr)\nDate labels on 1st of Month\nMonthly major gridlines removed")


# TOTAL SUNDAY ALIGNMENT: specify manual bin breaks AND labels to be Sundays
############################################################################
ggplot(central_data) + 
  geom_histogram(
    mapping = aes(x = date_onset),
    
    # histogram breaks set to 7 days beginning Sunday before first case
    breaks = seq.Date(from = floor_date(min(central_data$date_onset, na.rm=T),   "week", week_start = 7),
                      to   = ceiling_date(max(central_data$date_onset, na.rm=T), "week", week_start = 7),
                      by   = "7 days"),
    
    closed = "left",                    # count cases from start of breakpoint

    color = "darkblue",
    
    fill = "lightblue") + 
  
  scale_x_date(
    expand = c(0,0),
    # date label breaks and major gridlines set to every 3 weeks beginning Sunday before first case
    breaks = seq.Date(from = floor_date(min(central_data$date_onset, na.rm=T),   "week", week_start = 7),
                      to   = ceiling_date(max(central_data$date_onset, na.rm=T), "week", week_start = 7),
                      by   = "3 weeks"),
    
    # minor gridlines set to weekly beginning Sunday before first case
    minor_breaks = seq.Date(from = floor_date(min(central_data$date_onset, na.rm=T),   "week", week_start = 7),
                            to   = ceiling_date(max(central_data$date_onset, na.rm=T), "week", week_start = 7),
                            by   = "7 days"),
    
    label = scales::label_date_short())+ # label formatting
  
  scale_y_continuous(
    expand = c(0,0))+                # remove excess space under x-axis, make flush 
  
  labs(title = "ALIGNED Sundays",
       subtitle = "7-day bins manually set to begin Sunday before first case (27 Apr)\nDate labels and gridlines manually set to Sundays as well")


ggplot(data = count_data)+
  geom_histogram(
   mapping = aes(x = date_hospitalisation, y = n_cases),
   stat = "identity",
   width = 1)+                # for daily counts, set width = 1 to avoid white space between bars
  labs(
    x = "Date of report", 
    y = "Number of cases",
    title = "Daily case incidence, from daily count data")

# Create weekly dataset with epiweek column
count_data_weekly <- count_data %>%
  mutate(epiweek = lubridate::floor_date(date_hospitalisation, "week")) %>% 
  group_by(hospital, epiweek, .drop=F) %>% 
  summarize(n_cases_weekly = sum(n_cases, na.rm=T))   

ggplot(data = count_data_weekly)+
  
  geom_histogram(
    mapping = aes(
      x = epiweek,           # x-axis is epiweek (as class Date)
      y = n_cases_weekly,    # y-axis height in the weekly case counts
      group = hospital,      # we are grouping the bars and coloring by hospital
      fill = hospital),
    stat = "identity")+      # this is also required when plotting count data
     
  # labels for x-axis
  scale_x_date(
    date_breaks = "2 months",      # labels every 2 months 
    date_minor_breaks = "1 month", # gridlines every month
    label = scales::label_date_short())+ # label formatting
     
  # Choose color palette (uses RColorBrewer package)
  scale_fill_brewer(palette = "Pastel2")+ 
  
  theme_minimal()+
  
  labs(
    x = "Week of onset", 
    y = "Weekly case incidence",
    fill = "Hospital",
    title = "Weekly case incidence, from aggregated count data by hospital")

# load package
pacman::p_load(slider)  # slider used to calculate rolling averages

# make dataset of daily counts and 7-day moving average
#######################################################
ll_counts_7day <- linelist %>%    # begin with linelist
  
  ## count cases by date
  count(date_onset, name = "new_cases") %>%   # name new column with counts as "new_cases"
  drop_na(date_onset) %>%                     # remove cases with missing date_onset
  
  ## calculate the average number of cases in 7-day window
  mutate(
    avg_7day = slider::slide_index(    # create new column
      new_cases,                       # calculate based on value in new_cases column
      .i = date_onset,                 # index is date_onset col, so non-present dates are included in window 
      .f = ~mean(.x, na.rm = TRUE),    # function is mean() with missing values removed
      .before = 6,                     # window is the day and 6-days before
      .complete = FALSE),              # must be FALSE for unlist() to work in next step
    avg_7day = unlist(avg_7day))       # convert class list to class numeric


# plot
######
ggplot(data = ll_counts_7day) +  # begin with new dataset defined above 
    geom_histogram(              # create epicurve histogram
      mapping = aes(
        x = date_onset,          # date column as x-axis
        y = new_cases),          # height is number of daily new cases
        stat = "identity",       # height is y value
        fill="#92a8d1",          # cool color for bars
        colour = "#92a8d1",      # same color for bar border
        )+ 
    geom_line(                   # make line for rolling average
      mapping = aes(
        x = date_onset,          # date column for x-axis
        y = avg_7day,            # y-value set to rolling average column
        lty = "7-day \nrolling avg"), # name of line in legend
      color="red",               # color of line
      linewidth = 1) +                # width of line
    scale_x_date(                # date scale
      date_breaks = "1 month",
      label = scales::label_date_short(), # label formatting
      expand = c(0,0)) +
    scale_y_continuous(          # y-axis scale
      expand = c(0,0),
      limits = c(0, NA)) +       
    labs(
      x="",
      y ="Number of confirmed cases",
      fill = "Legend")+ 
    theme_minimal()+
    theme(legend.title = element_blank())  # removes title of legend

my_labels <- as_labeller(c(
     "0-4"   = "Ages 0-4",
     "5-9"   = "Ages 5-9",
     "10-14" = "Ages 10-14",
     "15-19" = "Ages 15-19",
     "20-29" = "Ages 20-29",
     "30-49" = "Ages 30-49",
     "50-69" = "Ages 50-69",
     "70+"   = "Over age 70"))

# make plot
###########
ggplot(central_data) + 
  
  geom_histogram(
    mapping = aes(
      x = date_onset,
      group = age_cat,
      fill = age_cat),    # arguments inside aes() apply by group
      
    color = "black",      # arguments outside aes() apply to all data
        
    # histogram breaks
    breaks = weekly_breaks_central, # pre-defined date vector (see earlier in this page)
    closed = "left" # count cases from start of breakpoint
    )+  
                      
  # The labels on the x-axis
  scale_x_date(
    expand            = c(0,0),          # remove excess x-axis space below and after case bars
    date_breaks       = "2 months",      # labels appear every 2 months
    date_minor_breaks = "1 month",       # vertical lines appear every 1 month 
    label = scales::label_date_short())+ # label formatting
  
  # y-axis
  scale_y_continuous(expand = c(0,0))+                       # removes excess y-axis space between bottom of bars and the labels
  
  # aesthetic themes
  theme_minimal()+                                           # a set of themes to simplify plot
  theme(
    plot.caption = element_text(face = "italic", hjust = 0), # caption on left side in italics
    axis.title = element_text(face = "bold"),
    legend.position = "bottom",
    strip.text = element_text(face = "bold", size = 10),
    strip.background = element_rect(fill = "grey"))+         # axis titles in bold
  
  # create facets
  facet_wrap(
    ~age_cat,
    ncol = 4,
    strip.position = "top",
    labeller = my_labels)+             
  
  # labels
  labs(
    title    = "Weekly incidence of cases, by age category",
    subtitle = "Subtitle",
    fill     = "Age category",                                      # provide new title for legend
    x        = "Week of symptom onset",
    y        = "Weekly incident cases reported",
    caption  = stringr::str_glue("n = {nrow(central_data)} from Central Hospital; Case onsets range from {format(min(central_data$date_onset, na.rm=T), format = '%a %d %b %Y')} to {format(max(central_data$date_onset, na.rm=T), format = '%a %d %b %Y')}\n{nrow(central_data %>% filter(is.na(date_onset)))} cases missing date of onset and not shown"))

ggplot(central_data) + 
  
  # epicurves by group
  geom_histogram(
    mapping = aes(
      x = date_onset,
      group = age_cat,
      fill = age_cat),  # arguments inside aes() apply by group
    
    color = "black",    # arguments outside aes() apply to all data
    
    # histogram breaks
    breaks = weekly_breaks_central, # pre-defined date vector (see earlier in this page)
    
    closed = "left", # count cases from start of breakpoint
    )+     # pre-defined date vector (see top of ggplot section)                
  
  # add grey epidemic in background to each facet
  gghighlight::gghighlight()+
  
  # labels on x-axis
  scale_x_date(
    expand            = c(0,0),          # remove excess x-axis space below and after case bars
    date_breaks       = "2 months",      # labels appear every 2 months
    date_minor_breaks = "1 month",       # vertical lines appear every 1 month 
    label = scales::label_date_short())+ # label formatting
  
  # y-axis
  scale_y_continuous(expand = c(0,0))+  # removes excess y-axis space below 0
  
  # aesthetic themes
  theme_minimal()+                                           # a set of themes to simplify plot
  theme(
    plot.caption = element_text(face = "italic", hjust = 0), # caption on left side in italics
    axis.title = element_text(face = "bold"),
    legend.position = "bottom",
    strip.text = element_text(face = "bold", size = 10),
    strip.background = element_rect(fill = "white"))+        # axis titles in bold
  
  # create facets
  facet_wrap(
    ~age_cat,                          # each plot is one value of age_cat
    ncol = 4,                          # number of columns
    strip.position = "top",            # position of the facet title/strip
    labeller = my_labels)+             # labeller defines above
  
  # labels
  labs(
    title    = "Weekly incidence of cases, by age category",
    subtitle = "Subtitle",
    fill     = "Age category",                                      # provide new title for legend
    x        = "Week of symptom onset",
    y        = "Weekly incident cases reported",
    caption  = stringr::str_glue("n = {nrow(central_data)} from Central Hospital; Case onsets range from {format(min(central_data$date_onset, na.rm=T), format = '%a %d %b %Y')} to {format(max(central_data$date_onset, na.rm=T), format = '%a %d %b %Y')}\n{nrow(central_data %>% filter(is.na(date_onset)))} cases missing date of onset and not shown"))

# Define helper function
CreateAllFacet <- function(df, col){
     df$facet <- df[[col]]
     temp <- df
     temp$facet <- "all"
     merged <-rbind(temp, df)
     
     # ensure the facet value is a factor
     merged[[col]] <- as.factor(merged[[col]])
     
     return(merged)
}

# Create dataset that is duplicated and with new column "facet" to show "all" age categories as another facet level
central_data2 <- CreateAllFacet(central_data, col = "age_cat") %>%
  
  # set factor levels
  mutate(facet = fct_relevel(facet, "all", "0-4", "5-9",
                             "10-14", "15-19", "20-29",
                             "30-49", "50-69", "70+"))

# check levels
table(central_data2$facet, useNA = "always")

ggplot(central_data2) + 
  
  # actual epicurves by group
  geom_histogram(
        mapping = aes(
          x = date_onset,
          group = age_cat,
          fill = age_cat),  # arguments inside aes() apply by group
        color = "black",    # arguments outside aes() apply to all data
        
        # histogram breaks
        breaks = weekly_breaks_central, # pre-defined date vector (see earlier in this page)
        
        closed = "left", # count cases from start of breakpoint
        )+    # pre-defined date vector (see top of ggplot section)
                     
  # Labels on x-axis
  scale_x_date(
    expand            = c(0,0),          # remove excess x-axis space below and after case bars
    date_breaks       = "2 months",      # labels appear every 2 months
    date_minor_breaks = "1 month",       # vertical lines appear every 1 month 
    label = scales::label_date_short())+ # automatic label formatting
  
  # y-axis
  scale_y_continuous(expand = c(0,0))+  # removes excess y-axis space between bottom of bars and the labels
  
  # aesthetic themes
  theme_minimal()+                                           # a set of themes to simplify plot
  theme(
    plot.caption = element_text(face = "italic", hjust = 0), # caption on left side in italics
    axis.title = element_text(face = "bold"),
    legend.position = "bottom")+               
  
  # create facets
  facet_wrap(facet~. ,                            # each plot is one value of facet
             ncol = 1)+            

  # labels
  labs(title    = "Weekly incidence of cases, by age category",
       subtitle = "Subtitle",
       fill     = "Age category",                                      # provide new title for legend
       x        = "Week of symptom onset",
       y        = "Weekly incident cases reported",
       caption  = stringr::str_glue("n = {nrow(central_data)} from Central Hospital; Case onsets range from {format(min(central_data$date_onset, na.rm=T), format = '%a %d %b %Y')} to {format(max(central_data$date_onset, na.rm=T), format = '%a %d %b %Y')}\n{nrow(central_data %>% filter(is.na(date_onset)))} cases missing date of onset and not shown"))

ggplot(central_data) + 
  
  # histogram
  geom_histogram(
    mapping = aes(x = date_onset),
    
    breaks = weekly_breaks_central,   # pre-defined date vector - see top of ggplot section
    
    closed = "left", # count cases from start of breakpoint
    
    color = "darkblue",
    
    fill = "lightblue") +

  # scales
  scale_y_continuous(expand = c(0,0))+
  scale_x_date(
    expand = c(0,0),                     # remove excess x-axis space below and after case bars
    date_breaks = "1 month",             # 1st of month
    date_minor_breaks = "1 month",       # 1st of month
    label = scales::label_date_short())+ # automatic label formatting
  
  # labels and theme
  labs(
    title = "Using annotate()\nRectangle and line showing that data from last 21-days are tentative",
    x = "Week of symptom onset",
    y = "Weekly case indicence")+ 
  theme_minimal()+
  
  # add semi-transparent red rectangle to tentative data
  annotate(
    "rect",
    xmin  = as.Date(max(central_data$date_onset, na.rm = T) - 21), # note must be wrapped in as.Date()
    xmax  = as.Date(Inf),                                          # note must be wrapped in as.Date()
    ymin  = 0,
    ymax  = Inf,
    alpha = 0.2,          # alpha easy and intuitive to adjust using annotate()
    fill  = "red")+
  
  # add black vertical line on top of other layers
  annotate(
    "segment",
    x     = max(central_data$date_onset, na.rm = T) - 21, # 21 days before last data
    xend  = max(central_data$date_onset, na.rm = T) - 21, 
    y     = 0,         # line begins at y = 0
    yend  = Inf,       # line to top of plot
    linewidth  = 2,         # line size
    color = "black",
    lty   = "solid")+   # linetype e.g. "solid", "dashed"

  # add text in rectangle
  annotate(
    "text",
    x = max(central_data$date_onset, na.rm = T) - 15,
    y = 15,
    label = "Subject to reporting delays",
    angle = 90)

# geom_vline(xintercept = max(central_data$date_onset, na.rm = T) - 21,
#            linewidth = 2,
#            color = "black")

# add column
############
plot_data <- central_data %>% 
  mutate(tentative = case_when(
    date_onset >= max(date_onset, na.rm=T) - 7 ~ "Tentative", # tenative if in last 7 days
    TRUE                                       ~ "Reliable")) # all else reliable

# plot
######
ggplot(plot_data, aes(x = date_onset, fill = tentative)) + 
  
  # histogram
  geom_histogram(
    breaks = weekly_breaks_central,   # pre-defined data vector, see top of ggplot page
    closed = "left", # count cases from start of breakpoint
    color = "black") +

  # scales
  scale_y_continuous(expand = c(0,0))+
  scale_fill_manual(values = c("lightblue", "grey"))+
  scale_x_date(
    expand = c(0,0),                     # remove excess x-axis space below and after case bars
    date_breaks = "3 weeks",             # Monday every 3 weeks
    date_minor_breaks = "week",          # Monday weeks 
    label = scales::label_date_short())+ # automatic label formatting
  
  # labels and theme
  labs(title = "Show days that are tentative reporting",
    subtitle = "")+ 
  theme_minimal()+
  theme(legend.title = element_blank())                 # remove title of legend
  

ggplot(central_data) + 
  
  # histogram
  geom_histogram(
    mapping = aes(x = date_onset),
    breaks = weekly_breaks_central,   # pre-defined date vector - see top of ggplot section
    closed = "left",                  # count cases from start of breakpoint
    color = "darkblue",
    fill = "lightblue") +

  # y-axis scale as before 
  scale_y_continuous(expand = c(0,0))+
  
  # x-axis scale sets efficient date labels
  scale_x_date(
    expand = c(0,0),                      # remove excess x-axis space below and after case bars
    labels = scales::label_date_short())+ # auto efficient date labels
  
  # labels and theme
  labs(
    title = "Using label_date_short()\nTo make automatic and efficient date labels",
    x = "Week of symptom onset",
    y = "Weekly case indicence")+ 
  theme_minimal()


# Create dataset of case counts by week
#######################################
central_weekly <- linelist %>%
  filter(hospital == "Central Hospital") %>%   # filter linelist
  mutate(week = lubridate::floor_date(date_onset, unit = "weeks")) %>%  
  count(week) %>%                              # summarize weekly case counts
  drop_na(week) %>%                            # remove cases with missing onset_date
  complete(                                    # fill-in all weeks with no cases reported
    week = seq.Date(
      from = min(week),   
      to   = max(week),
      by   = "week"),
    fill = list(n = 0))                        # convert new NA values to 0 counts

# plot with no facet box border
#################################
ggplot(central_weekly,
       aes(x = week, y = n)) +              # establish x and y for entire plot
  geom_line(stat = "identity",              # make line, line height is count number
            color = "#69b3a2") +            # line color
  geom_point(size=1, color="#69b3a2") +     # make points at the weekly data points
  geom_area(fill = "#69b3a2",               # fill area below line
            alpha = 0.4)+                   # fill transparency
  scale_x_date(date_labels="%b",            # date label format show month 
               date_breaks="month",         # date labels on 1st of each month
               expand=c(0,0)) +             # remove excess space
  scale_y_continuous(
    expand  = c(0,0))+                      # remove excess space below x-axis
  facet_grid(~lubridate::year(week),        # facet on year (of Date class column)
             space="free_x",                
             scales="free_x",               # x-axes adapt to data range (not "fixed")
             switch="x") +                  # facet labels (year) on bottom
  theme_bw() +
  theme(strip.placement = "outside",                  # facet label placement
          strip.background = element_blank(),         # no facet lable background
          panel.grid.minor.x = element_blank(),          
          panel.border = element_blank(),             # no border for facet panel
          panel.spacing=unit(0,"cm"))+                # No space between facet panels
  labs(title = "Nested year labels - points, shaded, no label border")

#load package
pacman::p_load(cowplot)

# Make first plot of epicurve histogram
#######################################
plot_cases <- linelist %>% 
  
  # plot cases per week
  ggplot()+
  
  # create histogram  
  geom_histogram(
    
    mapping = aes(x = date_onset),
    
    # bin breaks every week beginning monday before first case, going to monday after last case
    breaks = weekly_breaks_all)+  # pre-defined vector of weekly dates (see top of ggplot section)
        
  # specify beginning and end of date axis to align with other plot
  scale_x_date(
    limits = c(min(weekly_breaks_all), max(weekly_breaks_all)))+  # min/max of the pre-defined weekly breaks of histogram
  
  # labels
  labs(
      y = "Daily cases",
      x = "Date of symptom onset"
    )+
  theme_cowplot()


# make second plot of percent died per week
###########################################
plot_deaths <- linelist %>%                        # begin with linelist
  group_by(week = floor_date(date_onset, "week")) %>%  # create week column
  
  # summarise to get weekly percent of cases who died
  summarise(n_cases = n(),
            died = sum(outcome == "Death", na.rm=T),
            pct_died = 100*died/n_cases) %>% 
  
  # begin plot
  ggplot()+
  
  # line of weekly percent who died
  geom_line(                                # create line of percent died
    mapping = aes(x = week, y = pct_died),  # specify y-height as pct_died column
    stat = "identity",                      # set line height to the value in pct_death column, not the number of rows (which is default)
    linewidth = 2,
    color = "black")+
  
  # Same date-axis limits as the other plot - perfect alignment
  scale_x_date(
    limits = c(min(weekly_breaks_all), max(weekly_breaks_all)))+  # min/max of the pre-defined weekly breaks of histogram
  
  
  # y-axis adjustments
  scale_y_continuous(                # adjust y-axis
    breaks = seq(0,100, 10),         # set break intervals of percent axis
    limits = c(0, 100),              # set extent of percent axis
    position = "right")+             # move percent axis to the right
  
  # Y-axis label, no x-axis label
  labs(x = "",
       y = "Percent deceased")+      # percent axis label
  
  theme_cowplot()                   # add this to make the two plots merge together nicely

aligned_plots <- cowplot::align_plots(plot_cases, plot_deaths, align="hv", axis="tblr")
ggdraw(aligned_plots[[1]]) + draw_plot(aligned_plots[[2]])

cumulative_case_counts <- linelist %>% 
  count(date_onset) %>%                # count of rows per day (returned in column "n")   
  mutate(                         
    cumulative_cases = cumsum(n)       # new column of the cumulative number of rows at each date
    )

plot_cumulative <- ggplot()+
  geom_line(
    data = cumulative_case_counts,
    aes(x = date_onset, y = cumulative_cases),
    linewidth = 2,
    color = "blue")

plot_cumulative

#load package
pacman::p_load(cowplot)

# Make first plot of epicurve histogram
plot_cases <- ggplot()+
  geom_histogram(          
    data = linelist,
    aes(x = date_onset),
    binwidth = 1)+
  labs(
    y = "Daily cases",
    x = "Date of symptom onset"
  )+
  theme_cowplot()

# make second plot of cumulative cases line
plot_cumulative <- ggplot()+
  geom_line(
    data = cumulative_case_counts,
    aes(x = date_onset, y = cumulative_cases),
    linewidth = 2,
    color = "blue")+
  scale_y_continuous(
    position = "right")+
  labs(x = "",
       y = "Cumulative cases")+
  theme_cowplot()+
  theme(
    axis.line.x = element_blank(),
    axis.text.x = element_blank(),
    axis.title.x = element_blank(),
    axis.ticks = element_blank())

aligned_plots <- cowplot::align_plots(plot_cases, plot_cumulative, align="hv", axis="tblr")
ggdraw(aligned_plots[[1]]) + draw_plot(aligned_plots[[2]])



# Chapter 33 - Demographic pyramids and Likert-scales

pacman::p_load(rio,       # to import data
               here,      # to locate files
               tidyverse, # to clean, handle, and plot the data (includes ggplot2 package)
               apyramid,  # a package dedicated to creating age pyramids
               janitor,   # tables and cleaning data
               stringr)   # working with strings for titles, captions, etc.

# import the linelist into R
linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL

# # import case linelist 
# linelist <- import("linelist_cleaned.rds")

linelist %>% 
  tabyl(age_cat5, gender)

hist(linelist$age)

apyramid::age_pyramid(data = linelist,
                      age_group = "age_cat5",
                      split_by = "gender")

apyramid::age_pyramid(data = linelist,
                      age_group = "age_cat5",
                      split_by = "gender",
                      proportional = TRUE)

apyramid::age_pyramid(data = linelist,
                      age_group = "age_cat5",
                      split_by = "hospital")  

apyramid::age_pyramid(data = linelist,
                      age_group = "age_cat5",
                      split_by = "gender",
                      na.rm = FALSE)         # show patients missing age or gender

apyramid::age_pyramid(
  data = linelist,
  age_group = "age_cat5",
  split_by = "gender",
  proportional = TRUE,              # show percents, not counts
  show_midpoint = FALSE,            # remove bar mid-point line
  #pal = c("orange", "purple")      # can specify alt. colors here (but not labels)
  )+                 
  
  # additional ggplot commands
  theme_minimal()+                               # simplfy background
  scale_fill_manual(                             # specify colors AND labels
    values = c("orange", "purple"),              
    labels = c("m" = "Male", "f" = "Female"))+
  labs(y = "Percent of all cases",              # note x and y labs are switched
       x = "Age categories",                          
       fill = "Gender", 
       caption = "My data source and caption here",
       title = "Title of my plot",
       subtitle = "Subtitle with \n a second line...")+
  theme(
    legend.position = "bottom",                          # legend to bottom
    axis.text = element_text(size = 10, face = "bold"),  # fonts/sizes
    axis.title = element_text(size = 12, face = "bold"))

demo_agg <- linelist %>% 
  count(age_cat5, gender, name = "cases") %>% 
  pivot_wider(
    id_cols = age_cat5,
    names_from = gender,
    values_from = cases) %>% 
  rename(`missing_gender` = `NA`)

# pivot the aggregated data into long format
demo_agg_long <- demo_agg %>% 
  pivot_longer(
    col = c(f, m, missing_gender),            # cols to elongate
    names_to = "gender",                # name for new col of categories
    values_to = "counts") %>%           # name for new col of counts
  mutate(
    gender = na_if(gender, "missing_gender")) # convert "missing_gender" to NA

apyramid::age_pyramid(data = demo_agg_long,
                      age_group = "age_cat5",# column name for age category
                      split_by = "gender",   # column name for gender
                      count = "counts")      # column name for case counts

class(linelist$age)

  # begin ggplot
  ggplot(mapping = aes(x = age, fill = gender)) +
  
  # female histogram
  geom_histogram(data = linelist %>% filter(gender == "f"),
                 breaks = seq(0,85,5),
                 colour = "white") +
  
  # male histogram (values converted to negative)
  geom_histogram(data = linelist %>% filter(gender == "m"),
                 breaks = seq(0,85,5),
                 mapping = aes(y = ..count..*(-1)),
                 colour = "white") +
  
  # flip the X and Y axes
  coord_flip() +
  
  # adjust counts-axis scale
  scale_y_continuous(limits = c(-600, 900),
                     breaks = seq(-600,900,100),
                     labels = abs(seq(-600, 900, 100)))

# create dataset with proportion of total
pyramid_data <- linelist %>%
  count(age_cat5,
        gender,
        name = "counts") %>% 
  ungroup() %>%                 # ungroup so percents are not by group
  mutate(percent = round(100*(counts / sum(counts, na.rm=T)), digits = 1), 
         percent = case_when(
            gender == "f" ~ percent,
            gender == "m" ~ -percent,     # convert male to negative
            TRUE          ~ NA_real_))    # NA val must by numeric as well

max_per <- max(pyramid_data$percent, na.rm=T)
min_per <- min(pyramid_data$percent, na.rm=T)

max_per
min_per

# begin ggplot
  ggplot()+  # default x-axis is age in years;

  # case data graph
  geom_col(data = pyramid_data,
           mapping = aes(
             x = age_cat5,
             y = percent,
             fill = gender),         
           colour = "white")+       # white around each bar
  
  # flip the X and Y axes to make pyramid vertical
  coord_flip()+
  

  # adjust the axes scales
  # scale_x_continuous(breaks = seq(0,100,5), labels = seq(0,100,5)) +
  scale_y_continuous(
    limits = c(min_per, max_per),
    breaks = seq(from = floor(min_per),                # sequence of values, by 2s
                 to = ceiling(max_per),
                 by = 2),
    labels = paste0(abs(seq(from = floor(min_per),     # sequence of absolute values, by 2s, with "%"
                            to = ceiling(max_per),
                            by = 2)),
                    "%"))+  

  # designate colors and legend labels manually
  scale_fill_manual(
    values = c("f" = "orange",
               "m" = "darkgreen"),
    labels = c("Female", "Male")) +
  
  # label values (remember X and Y flipped now)
  labs(
    title = "Age and gender of cases",
    x = "Age group",
    y = "Percent of total",
    fill = NULL,
    caption = stringr::str_glue("Data are from linelist \nn = {nrow(linelist)} (age or sex missing for {sum(is.na(linelist$gender) | is.na(linelist$age_years))} cases) \nData as of: {format(Sys.Date(), '%d %b %Y')}")) +
  
  # display themes
  theme(
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.background = element_blank(),
    axis.line = element_line(colour = "black"),
    plot.title = element_text(hjust = 0.5), 
    plot.caption = element_text(hjust=0, size=11, face = "italic")
    )


# import the population demographics data
pop <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/standardization/country_demographics.csv")  # FIX: local file -> URL

# # import the population demographics data
# pop <- rio::import("country_demographics.csv")

# record correct age cat levels
age_levels <- c("0-4","5-9", "10-14", "15-19", "20-24",
                "25-29","30-34", "35-39", "40-44", "45-49",
                "50-54", "55-59", "60-64", "65-69", "70-74",
                "75-79", "80-84", "85+")

# create/transform populaton data, with percent of total
########################################################
pop_data <- pop %>% 
  pivot_longer(      # pivot gender columns longer
    cols = c(m, f),
    names_to = "gender",
    values_to = "counts") %>% 
  
  mutate(
    percent  = round(100*(counts / sum(counts, na.rm=T)),1),  # % of total
    percent  = case_when(                                                        
     gender == "f" ~ percent,
     gender == "m" ~ -percent,               # if male, convert % to negative
     TRUE          ~ NA_real_))

# create case data by age/gender, with percent of total
#######################################################
case_data <- linelist %>%
  count(age_cat5, gender, name = "counts") %>%  # counts by age-gender groups
  ungroup() %>% 
  mutate(
    percent = round(100*(counts / sum(counts, na.rm=T)),1),  # calculate % of total for age-gender groups
    percent = case_when(                                     # convert % to negative if male
      gender == "f" ~ percent,
      gender == "m" ~ -percent,
      TRUE          ~ NA_real_))

# combine case and population data (same column names, age_cat values, and gender values)
pyramid_data <- bind_rows("cases" = case_data, "population" = pop_data, .id = "data_source")

# Define extent of percent axis, used for plot limits
max_per <- max(pyramid_data$percent, na.rm=T)
min_per <- min(pyramid_data$percent, na.rm=T)


# begin ggplot
##############
ggplot()+  # default x-axis is age in years;

  # population data graph
  geom_col(
    data = pyramid_data %>% filter(data_source == "population"),
    mapping = aes(
      x = age_cat5,
      y = percent,
      fill = gender),
    colour = "black",                               # black color around bars
    alpha = 0.2,                                    # more transparent
    width = 1)+                                     # full width
  
  # case data graph
  geom_col(
    data = pyramid_data %>% filter(data_source == "cases"), 
    mapping = aes(
      x = age_cat5,                               # age categories as original X axis
      y = percent,                                # % as original Y-axis
      fill = gender),                             # fill of bars by gender
    colour = "black",                               # black color around bars
    alpha = 1,                                      # not transparent 
    width = 0.3)+                                   # half width
  
  # flip the X and Y axes to make pyramid vertical
  coord_flip()+
  
  # manually ensure that age-axis is ordered correctly
  scale_x_discrete(limits = age_levels)+     # defined in chunk above
  
  # set percent-axis 
  scale_y_continuous(
    limits = c(min_per, max_per),                                          # min and max defined above
    breaks = seq(floor(min_per), ceiling(max_per), by = 2),                # from min% to max% by 2 
    labels = paste0(                                                       # for the labels, paste together... 
              abs(seq(floor(min_per), ceiling(max_per), by = 2)), "%"))+                                                  

  # designate colors and legend labels manually
  scale_fill_manual(
    values = c("f" = "orange",         # assign colors to values in the data
               "m" = "darkgreen"),
    labels = c("f" = "Female",
               "m"= "Male"),      # change labels that appear in legend, note order
  ) +

  # plot labels, titles, caption    
  labs(
    title = "Case age and gender distribution,\nas compared to baseline population",
    subtitle = "",
    x = "Age category",
    y = "Percent of total",
    fill = NULL,
    caption = stringr::str_glue("Cases shown on top of country demographic baseline\nCase data are from linelist, n = {nrow(linelist)}\nAge or gender missing for {sum(is.na(linelist$gender) | is.na(linelist$age_years))} cases\nCase data as of: {format(max(linelist$date_onset, na.rm=T), '%d %b %Y')}")) +
  
  # optional aesthetic themes
  theme(
    legend.position = "bottom",                             # move legend to bottom
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.background = element_blank(),
    axis.line = element_line(colour = "black"),
    plot.title = element_text(hjust = 0), 
    plot.caption = element_text(hjust=0, size=11, face = "italic"))


# import the likert survey response data
likert_data <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/likert_data.csv")  # FIX: local file -> URL

# # import the likert survey response data
# likert_data <- rio::import("likert_data.csv")

melted <- likert_data %>% 
  pivot_longer(
    cols = Q1:Q8,
    names_to = "Question",
    values_to = "Response") %>% 
  mutate(
    
    direction = case_when(
      Response %in% c("Poor","Very Poor")  ~ "Negative",
      Response %in% c("Good", "Very Good") ~ "Positive",
      TRUE                                 ~ "Unknown"),
    
    status = fct_relevel(status, "Junior", "Intermediate", "Senior"),
    
    # must reverse 'Very Poor' and 'Poor' for ordering to work
    Response = fct_relevel(Response, "Very Good", "Good", "Very Poor", "Poor")) 

# get largest value for scale limits
melted_max <- melted %>% 
  count(status, Question) %>% # get counts
  pull(n) %>%                 # column 'n'
  max(na.rm=T)                # get max

# make plot
ggplot()+
     
  # bar graph of the "negative" responses 
     geom_bar(
       data = melted %>% filter(direction == "Negative"),
       mapping = aes(
         x = status,
         y = ..count..*(-1),    # counts inverted to negative
         fill = Response),
       color = "black",
       closed = "left",
       position = "stack")+
     
     # bar graph of the "positive responses
     geom_bar(
       data = melted %>% filter(direction == "Positive"),
       mapping = aes(
         x = status,
         fill = Response),
       colour = "black",
       closed = "left",
       position = "stack")+
     
     # flip the X and Y axes
     coord_flip()+
  
     # Black vertical line at 0
     geom_hline(yintercept = 0, color = "black", linewidth=1)+
     
    # convert labels to all positive numbers
    scale_y_continuous(
      
      # limits of the x-axis scale
      limits = c(-ceiling(melted_max/10)*11,    # seq from neg to pos by 10, edges rounded outward to nearest 5
                 ceiling(melted_max/10)*10),   
      
      # values of the x-axis scale
      breaks = seq(from = -ceiling(melted_max/10)*10,
                   to = ceiling(melted_max/10)*10,
                   by = 10),
      
      # labels of the x-axis scale
      labels = abs(unique(c(seq(-ceiling(melted_max/10)*10, 0, 10),
                            seq(0, ceiling(melted_max/10)*10, 10))))) +
     
    # color scales manually assigned 
    scale_fill_manual(
      values = c("Very Good"  = "green4", # assigns colors
                "Good"      = "green3",
                "Poor"      = "yellow",
                "Very Poor" = "red3"),
      breaks = c("Very Good", "Good", "Poor", "Very Poor"))+ # orders the legend
     
    
     
    # facet the entire plot so each question is a sub-plot
    facet_wrap( ~ Question, ncol = 3)+
     
    # labels, titles, caption
    labs(
      title = str_glue("Likert-style responses\nn = {nrow(likert_data)}"),
      x = "Respondent status",
      y = "Number of responses",
      fill = "")+

     # display adjustments 
     theme_minimal()+
     theme(axis.text = element_text(size = 12),
           axis.title = element_text(size = 14, face = "bold"),
           strip.text = element_text(size = 14, face = "bold"),  # facet sub-titles
           plot.title = element_text(size = 20, face = "bold"),
           panel.background = element_rect(fill = NA, color = "black")) # black box around each facet



# Chapter 34 - Heat plots

pacman::p_load(
  tidyverse,       # data manipulation and visualization
  rio,             # importing data 
  lubridate        # working with dates
  )

linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL

# linelist <- import("linelist_cleaned.rds")

case_ages <- linelist %>% 
  select(case_id, infector, age_cat) %>% 
  rename("case_age_cat" = "age_cat")

infectors <- linelist %>% 
  select(infector) %>% 
  drop_na(infector)

infector_ages <- infectors %>%             # begin with infectors
  left_join(                               # add the linelist data to each infector  
    linelist,
    by = c("infector" = "case_id")) %>%    # match infector to their information as a case
  select(infector, age_cat) %>%            # keep only columns of interest
  rename("infector_age_cat" = "age_cat")   # rename for clarity

ages_complete <- case_ages %>%  
  left_join(
    infector_ages,
    by = "infector") %>%        # each has the column infector
  drop_na()                     # drop rows with any missing data

table(cases = ages_complete$case_age_cat,
      infectors = ages_complete$infector_age_cat)

long_counts <- data.frame(table(
    cases     = ages_complete$case_age_cat,
    infectors = ages_complete$infector_age_cat))

long_prop <- data.frame(prop.table(table(
    cases = ages_complete$case_age_cat,
    infectors = ages_complete$infector_age_cat)))

ggplot(data = long_prop)+       # use long data, with proportions as Freq
  geom_tile(                    # visualize it in tiles
    aes(
      x = cases,         # x-axis is case age
      y = infectors,     # y-axis is infector age
      fill = Freq))+            # color of the tile is the Freq column in the data
  scale_fill_gradient(          # adjust the fill color of the tiles
    low = "blue",
    high = "orange")+
  labs(                         # labels
    x = "Case age",
    y = "Infector age",
    title = "Who infected whom",
    subtitle = "Frequency matrix of transmission events",
    fill = "Proportion of all\ntranmsission events"     # legend title
  )
  

facility_count_data <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/malaria_facility_count_data.rds") %>%  # FIX: local file -> URL
  select(location_name, data_date, District, malaria_tot)

# facility_count_data <- import("malaria_facility_count_data.rds")

# Create weekly summary dataset
agg_weeks <- facility_count_data %>% 
  
  # filter the data as appropriate
  filter(
    District == "Spring",
    data_date < as.Date("2020-08-01")) 

agg_weeks <- agg_weeks %>% 
  # Create week column from data_date
  mutate(
    week = lubridate::floor_date(                     # create new column of weeks
      data_date,                                      # date column
      unit = "week",                                  # give start of the week
      week_start = 1))                                # weeks to start on Mondays 

agg_weeks <- agg_weeks %>%   

  # Group into facility-weeks
  group_by(location_name, week) %>%
  
  # Create summary statistics columns on the grouped data
  summarize(
    n_days          = 7,                                          # 7 days per week           
    n_reports       = dplyr::n(),                                 # number of reports received per week (could be >7)
    malaria_tot     = sum(malaria_tot, na.rm = T),                # total malaria cases reported
    n_days_reported = length(unique(data_date)),                  # number of unique days reporting per week
    p_days_reported = round(100*(n_days_reported / n_days))) %>%  # percent of days reporting

  ungroup(location_name, week)                                    # ungroup so expand() works in next step

# Create data frame of every possible facility-week
expanded_weeks <- agg_weeks %>% 
  tidyr::expand(location_name, week)  # expand data frame to include all possible facility-week combinations

# Use a right-join with the expanded facility-week list to fill-in the missing gaps in the data
agg_weeks <- agg_weeks %>%      
  right_join(expanded_weeks) %>%                            # Ensure every possible facility-week combination appears in the data
  mutate(p_days_reported = replace_na(p_days_reported, 0))  # convert missing values to 0                           

ggplot(data = agg_weeks)+
  geom_tile(
    aes(x = week,
        y = location_name,
        fill = p_days_reported))

ggplot(data = agg_weeks)+ 
  
  # show data as tiles
  geom_tile(
    aes(x = week,
        y = location_name,
        fill = p_days_reported),      
    color = "white")+                 # white gridlines
  
  scale_fill_gradient(
    low = "orange",
    high = "darkgreen",
    na.value = "grey80")+
  
  # date axis
  scale_x_date(
    expand = c(0,0),             # remove extra space on sides
    date_breaks = "2 weeks",     # labels every 2 weeks
    date_labels = "%d\n%b")+     # format is day over month (\n in newline)
  
  # aesthetic themes
  theme_minimal()+                                  # simplify background
  
  theme(
    legend.title = element_text(size=12, face="bold"),
    legend.text  = element_text(size=10, face="bold"),
    legend.key.height = grid::unit(1,"cm"),           # height of legend key
    legend.key.width  = grid::unit(0.6,"cm"),         # width of legend key
    
    axis.text.x = element_text(size=12),              # axis text size
    axis.text.y = element_text(vjust=0.2),            # axis text alignment
    axis.ticks = element_line(linewidth=0.4),               
    axis.title = element_text(size=12, face="bold"),  # axis title size and bold
    
    plot.title = element_text(hjust=0,size=14,face="bold"),  # title right-aligned, large, bold
    plot.caption = element_text(hjust = 0, face = "italic")  # caption right-aligned and italic
    )+
  
  # plot labels
  labs(x = "Week",
       y = "Facility name",
       fill = "Reporting\nperformance (%)",           # legend title, because legend shows fill
       title = "Percent of days per week that facility reported data",
       subtitle = "District health facilities, May-July 2020",
       caption = "7-day weeks beginning on Mondays.")

facility_order <- agg_weeks %>% 
  group_by(location_name) %>% 
  summarize(tot_reports = sum(n_days_reported, na.rm=T)) %>% 
  arrange(tot_reports) # ascending order

# load package 
pacman::p_load(forcats)

# create factor and define levels manually
agg_weeks <- agg_weeks %>% 
  mutate(location_name = fct_relevel(
    location_name, facility_order$location_name)
    )

ggplot(data = agg_weeks)+ 
  
  # show data as tiles
  geom_tile(
    aes(x = week,
        y = location_name,
        fill = p_days_reported),      
    color = "white")+                 # white gridlines
  
  scale_fill_gradient(
    low = "orange",
    high = "darkgreen",
    na.value = "grey80")+
  
  # date axis
  scale_x_date(
    expand = c(0,0),             # remove extra space on sides
    date_breaks = "2 weeks",     # labels every 2 weeks
    date_labels = "%d\n%b")+     # format is day over month (\n in newline)
  
  # aesthetic themes
  theme_minimal()+                                  # simplify background
  
  theme(
    legend.title = element_text(size=12, face="bold"),
    legend.text  = element_text(size=10, face="bold"),
    legend.key.height = grid::unit(1,"cm"),           # height of legend key
    legend.key.width  = grid::unit(0.6,"cm"),         # width of legend key
    
    axis.text.x = element_text(size=12),              # axis text size
    axis.text.y = element_text(vjust=0.2),            # axis text alignment
    axis.ticks = element_line(linewidth=0.4),               
    axis.title = element_text(size=12, face="bold"),  # axis title size and bold
    
    plot.title = element_text(hjust=0,size=14,face="bold"),  # title right-aligned, large, bold
    plot.caption = element_text(hjust = 0, face = "italic")  # caption right-aligned and italic
    )+
  
  # plot labels
  labs(x = "Week",
       y = "Facility name",
       fill = "Reporting\nperformance (%)",           # legend title, because legend shows fill
       title = "Percent of days per week that facility reported data",
       subtitle = "District health facilities, May-July 2020",
       caption = "7-day weeks beginning on Mondays.")

ggplot(data = agg_weeks)+ 
  
  # show data as tiles
  geom_tile(
    aes(x = week,
        y = location_name,
        fill = p_days_reported),      
    color = "white")+                 # white gridlines
  
  # text
  geom_text(
    aes(
      x = week,
      y = location_name,
      label = p_days_reported))+      # add text on top of tile
  
  # fill scale
  scale_fill_gradient(
    low = "orange",
    high = "darkgreen",
    na.value = "grey80")+
  
  # date axis
  scale_x_date(
    expand = c(0,0),             # remove extra space on sides
    date_breaks = "2 weeks",     # labels every 2 weeks
    date_labels = "%d\n%b")+     # format is day over month (\n in newline)
  
  # aesthetic themes
  theme_minimal()+                                    # simplify background
  
  theme(
    legend.title = element_text(size=12, face="bold"),
    legend.text  = element_text(size=10, face="bold"),
    legend.key.height = grid::unit(1,"cm"),           # height of legend key
    legend.key.width  = grid::unit(0.6,"cm"),         # width of legend key
    
    axis.text.x = element_text(size=12),              # axis text size
    axis.text.y = element_text(vjust=0.2),            # axis text alignment
    axis.ticks = element_line(linewidth=0.4),               
    axis.title = element_text(size=12, face="bold"),  # axis title size and bold
    
    plot.title = element_text(hjust=0,size=14,face="bold"),  # title right-aligned, large, bold
    plot.caption = element_text(hjust = 0, face = "italic")  # caption right-aligned and italic
    )+
  
  # plot labels
  labs(x = "Week",
       y = "Facility name",
       fill = "Reporting\nperformance (%)",           # legend title, because legend shows fill
       title = "Percent of days per week that facility reported data",
       subtitle = "District health facilities, May-July 2020",
       caption = "7-day weeks beginning on Mondays.")



# Chapter 35 - Diagrams and charts

pacman::p_load(
  DiagrammeR,     # for flow diagrams
  networkD3,      # For alluvial/Sankey diagrams
  tidyverse)      # data management and visualization

# import the linelist into R
linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL

# # import the linelist
# linelist <- import("linelist_cleaned.rds")

# A minimal plot
DiagrammeR::grViz("digraph {
  
graph[layout = dot, rankdir = LR]

a
b
c

a -> b -> c
}")

grViz("                           # All instructions are within a large character string
digraph surveillance_diagram {    # 'digraph' means 'directional graph', then the graph name 
  
  # graph statement
  #################
  graph [layout = dot,
         rankdir = TB,
         overlap = true,
         fontsize = 10]
  
  # nodes
  #######
  node [shape = circle,           # shape = circle
       fixedsize = true
       width = 1.3]               # width of circles
  
  Primary                         # names of nodes
  Secondary
  Tertiary

  # edges
  #######
  Primary   -> Secondary [label = ' case transfer']
  Secondary -> Tertiary [label = ' case transfer']
}
")

DiagrammeR::grViz("               # All instructions are within a large character string
digraph surveillance_diagram {    # 'digraph' means 'directional graph', then the graph name 
  
  # graph statement
  #################
  graph [layout = dot,
         rankdir = TB,            # layout top-to-bottom
         fontsize = 10]
  

  # nodes (circles)
  #################
  node [shape = circle,           # shape = circle
       fixedsize = true
       width = 1.3]                      
  
  Primary   [label = 'Primary\nFacility'] 
  Secondary [label = 'Secondary\nFacility'] 
  Tertiary  [label = 'Tertiary\nFacility'] 
  SC        [label = 'Surveillance\nCoordination',
             fontcolor = darkgreen] 
  
  # edges
  #######
  Primary   -> Secondary [label = 'case transfer',
                          fontcolor = red,
                          color = red]
  Secondary -> Tertiary [label = 'case transfer',
                          fontcolor = red,
                          color = red]
  
  # grouped edge
  {Primary Secondary Tertiary} -> SC [label = 'case reporting',
                                      fontcolor = darkgreen,
                                      color = darkgreen,
                                      style = dashed]
}
")

DiagrammeR::grViz("             # All instructions are within a large character string
digraph surveillance_diagram {  # 'digraph' means 'directional graph', then the graph name 
  
  # graph statement
  #################
  graph [layout = dot,
         rankdir = TB,            
         overlap = true,
         fontsize = 10]
  

  # nodes (circles)
  #################
  node [shape = circle,                  # shape = circle
       fixedsize = true
       width = 1.3]                      # width of circles
  
  subgraph cluster_passive {
    Primary   [label = 'Primary\nFacility'] 
    Secondary [label = 'Secondary\nFacility'] 
    Tertiary  [label = 'Tertiary\nFacility'] 
    SC        [label = 'Surveillance\nCoordination',
               fontcolor = darkgreen] 
  }
  
  # nodes (boxes)
  ###############
  node [shape = box,                     # node shape
        fontname = Helvetica]            # text font in node
  
  subgraph cluster_active {
    Active [label = 'Active\nSurveillance'] 
    HCF_active [label = 'HCF\nActive Search']
  }
  
  subgraph cluster_EBD {
    EBS [label = 'Event-Based\nSurveillance (EBS)'] 
    'Social Media'
    Radio
  }
  
  subgraph cluster_CBS {
    CBS [label = 'Community-Based\nSurveillance (CBS)']
    RECOs
  }

  
  # edges
  #######
  {Primary Secondary Tertiary} -> SC [label = 'case reporting']

  Primary   -> Secondary [label = 'case transfer',
                          fontcolor = red]
  Secondary -> Tertiary [label = 'case transfer',
                          fontcolor = red]
  
  HCF_active -> Active
  
  {'Social Media' Radio} -> EBS
  
  RECOs -> CBS
}
")


DiagrammeR::grViz("digraph {

graph [layout = dot, rankdir = LR]

# define the global styles of the nodes. We can override these in box if we wish
node [shape = rectangle, style = filled, fillcolor = Linen]

data1 [label = 'Dataset 1', shape = folder, fillcolor = Beige]
data2 [label = 'Dataset 2', shape = folder, fillcolor = Beige]
process [label =  'Process \n Data']
statistical [label = 'Statistical \n Analysis']
results [label= 'Results']

# edge definitions with the node IDs
{data1 data2}  -> process -> statistical -> results
}")

pacman::p_load(
  networkD3,
  tidyverse)

# counts by hospital and age category
links <- linelist %>% 
  drop_na(age_cat) %>% 
  select(hospital, age_cat) %>%
  count(hospital, age_cat) %>% 
  rename(source = hospital,
         target = age_cat)

# The unique node names
nodes <- data.frame(
  name=c(as.character(links$source), as.character(links$target)) %>% 
    unique()
  )

nodes  # print

# match to numbers, not names
links$IDsource <- match(links$source, nodes$name)-1 
links$IDtarget <- match(links$target, nodes$name)-1


# plot
######
p <- sankeyNetwork(
  Links = links,
  Nodes = nodes,
  Source = "IDsource",
  Target = "IDtarget",
  Value = "n",
  NodeID = "name",
  units = "TWh",
  fontSize = 12,
  nodeWidth = 30,
  iterations = 0)        # ensure node order is as in data
p

# counts by hospital and age category
age_hosp_links <- linelist %>% 
  drop_na(age_cat) %>% 
  select(hospital, age_cat) %>%
  count(hospital, age_cat) %>% 
  rename(source = age_cat,          # re-name
         target = hospital)

hosp_out_links <- linelist %>% 
    drop_na(age_cat) %>% 
    select(hospital, outcome) %>% 
    count(hospital, outcome) %>% 
    rename(source = hospital,       # re-name
           target = outcome)

# combine links
links <- bind_rows(age_hosp_links, hosp_out_links)

# The unique node names
nodes <- data.frame(
  name=c(as.character(links$source), as.character(links$target)) %>% 
    unique()
  )

# Create id numbers
links$IDsource <- match(links$source, nodes$name)-1 
links$IDtarget <- match(links$target, nodes$name)-1

# plot
######
p <- sankeyNetwork(Links = links,
                   Nodes = nodes,
                   Source = "IDsource",
                   Target = "IDtarget",
                   Value = "n",
                   NodeID = "name",
                   units = "TWh",
                   fontSize = 12,
                   nodeWidth = 30,
                   iterations = 0)
p


# load package
pacman::p_load(vistime,  # make the timeline
               plotly    # for interactive visualization
               )

# reference: https://cran.r-project.org/web/packages/vistime/vignettes/vistime-vignette.html#ex.-2-project-planning

data <- read.csv(text="event, group, start, end, color
                       Event 1, Group A,2020-01-22,2020-01-22, #90caf9
                       Event 1, Group B,2020-01-23,2020-01-23, #90caf9
                       Event 1, Group C,2020-01-23,2020-01-23, #1565c0
                       Event 1, Group D,2020-01-25,2020-01-25, #f44336
                       Event 1, Group E,2020-01-25,2020-01-25, #90caf9
                       Event 1, Group F,2020-01-26,2020-01-26, #8d6e63
                       Event 1, Group G,2020-01-27,2020-01-27, #1565c0
                       Event 1, Group H,2020-01-27,2020-01-27, #90caf9
                       Event 1, Group I,2020-01-27,2020-01-27,#90a4ae
                       Event 2, Group A,2020-01-28,2020-01-28,#fc8d62
                       Event 2, Group C,2020-01-28,2020-01-28, #6a3d9a
                       Event 2, Group J,2020-01-28,2020-01-28, #90caf9
                       Event 2, Group J,2020-01-28,2020-01-28, #fc8d62
                       Event 2, Group J,2020-01-28,2020-01-28, #1565c0
")

p <- vistime(data)    # apply vistime

library(plotly)

# step 1: transform into a list
pp <- plotly_build(p)

# step 2: Marker size
for(i in 1:length(pp$x$data)){
  if(pp$x$data[[i]]$mode == "markers") pp$x$data[[i]]$marker$size <- 10
}

# step 3: text size
for(i in 1:length(pp$x$data)){
  if(pp$x$data[[i]]$mode == "text") pp$x$data[[i]]$textfont$size <- 10
}


# step 4: text position
for(i in 1:length(pp$x$data)){
  if(pp$x$data[[i]]$mode == "text") pp$x$data[[i]]$textposition <- "right"
}

#print
pp




# Chapter 36 - Combinations analysis

pacman::p_load(tidyverse,
               UpSetR,
               ggupset)

# import the linelist into R
linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL

# Adds new symptom variables to the linelist, with random "yes" or "no" values 
linelist_sym <- linelist %>% 
  mutate(fever  = sample(c("yes", "no"), nrow(linelist), replace = T, prob = c(0.80, 0.20)),
         chills = sample(c("yes", "no"), nrow(linelist), replace = T, prob = c(0.20, 0.80)),
         cough  = sample(c("yes", "no"), nrow(linelist), replace = T, prob = c(0.9, 0.15)),
         aches  = sample(c("yes", "no"), nrow(linelist), replace = T, prob = c(0.10, 0.90)),
         vomit = sample(c("yes", "no"), nrow(linelist), replace = T))

linelist_sym_2 <- linelist_sym %>% 
     
  #mutate(fever = ifelse(fever == "yes", colnames(linelist)[which(colnames(linelist) == "fever")]))
   mutate(across(.cols = c(fever, chills, cough, aches, vomit),
                 .fns = ~+(.x == "yes")))   

     
  #mutate(across(c("fever", "chills", "cough", "aches", "vomit"), ~ifelse(.x = "yes", colnames(.)[which(colnames(.) == "fever")], 0)))   
  

# Make the plot
UpSetR::upset(
  select(linelist_sym_2, fever, chills, cough, aches, vomit),
  sets = c("fever", "chills", "cough", "aches", "vomit"),
  order.by = "freq",
  sets.bar.color = c("blue", "red", "yellow", "darkgreen", "orange"), # optional colors
  empty.intersections = "on",
  # nsets = 3,
  number.angles = 0,
  point.size = 3.5,
  line.size = 2, 
  mainbar.y.label = "Symptoms Combinations",
  sets.x.label = "Patients with Symptom")


pacman::p_load(
  tidyverse,     # data management and visualization
  UpSetR,        # special package for combination plots
  ggupset)       # special package for combination plots

# import the linelist into R
linelist_sym <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL

# # import case linelist 
# linelist_sym <- import("linelist_cleaned.rds")

# create column with the symptoms named, separated by semicolons
linelist_sym_1 <- linelist_sym %>% 

  # convert the "yes" and "no" values into the symptom name itself
  # if old value is "yes", new value is "fever", otherwise set to missing (NA)
mutate(fever = ifelse(fever == "yes", "fever", NA), 
       chills = ifelse(chills == "yes", "chills", NA),
       cough = ifelse(cough == "yes", "cough", NA),
       aches = ifelse(aches == "yes", "aches", NA),
       vomit = ifelse(vomit == "yes", "vomit", NA))

linelist_sym_1 <- linelist_sym_1 %>% 
  unite(col = "all_symptoms",
        c(fever, chills, cough, aches, vomit), 
        sep = "; ",
        remove = TRUE,
        na.rm = TRUE) %>% 
  mutate(
    # make a copy of all_symptoms column, but of class "list" (which is required to use ggupset() in next step)
    all_symptoms_list = as.list(strsplit(all_symptoms, "; "))
    )

pacman::p_load(ggupset)

ggplot(
  data = linelist_sym_1,
  mapping = aes(x = all_symptoms_list)) +
geom_bar() +
scale_x_upset(
  reverse = FALSE,
  n_intersections = 10,
  sets = c("fever", "chills", "cough", "aches", "vomit"))+
labs(
  title = "Signs & symptoms",
  subtitle = "10 most frequent combinations of signs and symptoms",
  caption = "Caption here.",
  x = "Symptom combination",
  y = "Frequency in dataset")


pacman::p_load(UpSetR)

linelist_sym_2 <- linelist_sym %>% 
     # convert the "yes" and "no" values into 1s and 0s
     mutate(fever = ifelse(fever == "yes", 1, 0), 
            chills = ifelse(chills == "yes", 1, 0),
            cough = ifelse(cough == "yes", 1, 0),
            aches = ifelse(aches == "yes", 1, 0),
            vomit = ifelse(vomit == "yes", 1, 0))
            

# # Efficiently convert "yes" to 1 and 0
# linelist_sym_2 <- linelist_sym %>% 
#
#   # convert the "yes" and "no" values into 1s and 0s
#   mutate(across(c(fever, chills, cough, aches, vomit), .fns = ~+(.x == "yes")))


# Make the plot
linelist_sym_2 %>% 
  UpSetR::upset(
       sets = c("fever", "chills", "cough", "aches", "vomit"),
       order.by = "freq",
       sets.bar.color = c("blue", "red", "yellow", "darkgreen", "orange"), # optional colors
       empty.intersections = "on",
       # nsets = 3,
       number.angles = 0,
       point.size = 3.5,
       line.size = 2, 
       mainbar.y.label = "Symptoms Combinations",
       sets.x.label = "Patients with Symptom")




# Chapter 37 - Transmission chains


# install development version of epicontacts
if(
  !"epicontacts" %in% rownames(installed.packages()) |
  packageVersion("epicontacts") != "1.2.0"
) remotes::install_github("reconhub/epicontacts@timeline")

## install and load packages
pacman::p_load(tidyverse,
               #epicontacts,
               magrittr, here, webshot, visNetwork)

library(epicontacts)

## load linelist
linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds") %>%  # FIX: local file -> URL
  filter(!duplicated(case_id))
## generate contacts
contacts <- linelist %>%
  transmute(
    from = infector,
    to = case_id,
    location = sample(c("Community", "Nosocomial"), n(), TRUE),
    duration = sample.int(10, n(), TRUE)
  ) %>%
  drop_na(from)

## generate epicontacts
epic <- epicontacts::make_epicontacts(
  linelist = linelist,
  contacts = contacts, 
  directed = TRUE
)

## subset object
#epic %<>% subset(
epic_small <- epic %>% 
  subset(
    node_attribute = list(date_onset = c(as.Date(c("2014-06-01", "2014-07-01"))))) %>%
  epicontacts::thin("contacts")

# plot with date of onset as x-axis
plot(
  epic_small,
  x_axis = "date_onset",
  label = FALSE,
  node_color = "outcome",
  col_pal = c(Death = "firebrick", Recover = "green"),
  node_shape = "gender",
  shapes = c(f = "female", m = "male"),
  unlinked_pos = "bottom",
  date_labels = "%b %d %Y",
  node_size = 35,
  font_size = 20,
  arrow_size = 0.5,
  height = 800,
  width = 700,
  edge_linetype = "location",
  legend_width = 0.15,
  highlight_downstream = TRUE,
  selector = FALSE
)


# pacman::p_load(
#    rio,          # File import
#    here,         # File locator
#    tidyverse,    # Data management + ggplot2 graphics
#    remotes       # Package installation from github
# )

# pacman::p_install_gh("reconhub/epicontacts@timeline")

# import the linelist into R
linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL

# # import the linelist
# linelist <- import("linelist_cleaned.xlsx")

## generate contacts
contacts <- linelist %>%
  transmute(
    infector = infector,
    case_id = case_id,
    location = sample(c("Community", "Nosocomial"), n(), TRUE),
    duration = sample.int(10, n(), TRUE)
  ) %>%
  drop_na(infector)

## generate epicontacts object
epic <- make_epicontacts(
  linelist = linelist,
  contacts = contacts,
  id = "case_id",
  from = "infector",
  to = "case_id",
  directed = TRUE
)

## view epicontacts object
epic

sub_attributes <- subset(
  epic,
  node_attribute = list(
    gender = "m",
    date_infection = as.Date(c("2014-04-01", "2014-07-01"))
  ), 
  edge_attribute = list(location = "Nosocomial")
)
sub_attributes

sub_attributes <- thin(sub_attributes, what = "contacts")
nrow(sub_attributes$contacts)

sub_id <- subset(epic, cluster_id = c("2ae019","71577a"))
nrow(sub_id$linelist)

sub_cs <- subset(epic, cs_min = 10)
nrow(sub_cs$linelist)

contacts_ids <- get_id(epic, "contacts")
head(contacts_ids, n = 10)

length(get_id(epic, "common"))

## subset epicontacts object
sub <- epic %>%
  subset(
    node_attribute = list(date_onset = c(as.Date(c("2014-06-30", "2014-06-01"))))
  ) %>%
 thin("contacts")

## plot epicontacts object
plot(
  sub,
  width = 700,
  height = 700
)

plot(
  sub, 
  node_color = "outcome",
  node_shape = "gender",
  node_size = "age",
  col_pal = c(Death = "firebrick", Recover = "green"),
  shapes = c(f = "female", m = "male"),
  size_range = c(40, 60),
  height = 700,
  width = 700
)


plot(
  sub, 
  node_color = "outcome",
  node_shape = "gender",
  node_size = 'age',
  col_pal = c(Death = "firebrick", Recover = "green"),
  shapes = c(f = "female", m = "male"),
  size_range = c(40, 60),
  edge_color = 'location',
  edge_linetype = 'location',
  edge_width = 'duration',
  edge_col_pal = c(Community = "orange", Nosocomial = "purple"),
  width_range = c(1, 3),
  height = 700,
  width = 700
)


plot(
  sub,
  x_axis = "date_onset",
  node_color = "outcome",
  col_pal = c(Death = "firebrick", Recover = "green"),
  arrow_size = 0.5,
  node_size = 13,
  label = FALSE,
  height = 700,
  width = 700
)

plot(
  sub,
  x_axis = "date_onset",
  network_shape = "rectangle",
  node_color = "outcome",
  col_pal = c(Death = "firebrick", Recover = "green"),
  arrow_size = 0.5,
  node_size = 13,
  label = FALSE,
  height = 700,
  width = 700
)

plot(
  sub,
  x_axis = "date_onset",
  network_shape = "rectangle",
  node_color = "outcome",
  col_pal = c(Death = "firebrick", Recover = "green"),
  position_dodge = TRUE,
  unlinked_pos = "bottom",
  arrow_size = 0.5,
  node_size = 13,
  label = FALSE,
  height = 700,
  width = 700
)

plot(
  sub,
  x_axis = "date_onset",
  network_shape = "rectangle",
  node_color = "outcome",
  col_pal = c(Death = "firebrick", Recover = "green"),
  parent_pos = "top",
  arrow_size = 0.5,
  node_size = 13,
  label = FALSE,
  height = 700,
  width = 700
)

#
# plot(
#   sub,
#   x_axis = "date_onset",
#   network_shape = "rectangle",
#   node_color = "outcome",
#   col_pal = c(Death = "firebrick", Recover = "green"),
#   parent_pos = "top",
#   arrow_size = 0.5,
#   node_size = 13,
#   label = FALSE,
#   height = 700,
#   width = 700
# ) %>%
#   visNetwork::visSave("network.html")
#

# webshot(url = "network.html", file = "network.png")


## generate timeline
timeline <- linelist %>%
  transmute(
    id = case_id,
    start = date_onset,
    end = date_outcome,
    outcome = outcome,
    hospital = hospital
  )



## define shapes
shapes <- c(
  f = "female",
  m = "male",
  Death = "user-times",
  Recover = "heartbeat",
  "NA" = "question-circle"
)

## define colours
colours <- c(
  Death = "firebrick",
  Recover = "green",
  "NA" = "grey"
)

## make plot
plot(
  sub,
  ## max x coordinate to date of onset
  x_axis = "date_onset",
  ## use rectangular network shape
  network_shape = "rectangle",
  ## mape case node shapes to gender column
  node_shape = "gender",
  ## we don't want to map node colour to any columns - this is important as the
  ## default value is to map to node id, which will mess up the colour scheme
  node_color = NULL,
  ## set case node size to 30 (as this is not a character, node_size is not
  ## mapped to a column but instead interpreted as the actual node size)
  node_size = 30,
  ## set transmission link width to 4 (as this is not a character, edge_width is
  ## not mapped to a column but instead interpreted as the actual edge width)
  edge_width = 4,
  ## provide the timeline object
  timeline = timeline,
  ## map the shape of the end node to the outcome column in the timeline object
  tl_end_node_shape = "outcome",
  ## set the size of the end node to 15 (as this is not a character, this
  ## argument is not mapped to a column but instead interpreted as the actual
  ## node size)
  tl_end_node_size = 15,
  ## map the colour of the timeline edge to the hospital column
  tl_edge_color = "hospital",
  ## set the width of the timeline edge to 2 (as this is not a character, this
  ## argument is not mapped to a column but instead interpreted as the actual
  ## edge width)
  tl_edge_width = 2,
  ## map edge labels to the hospital variable
  tl_edge_label = "hospital",
  ## specify the shape for everyone node attribute (defined above)
  shapes = shapes,
  ## specify the colour palette (defined above)
  col_pal = colours,
  ## set the size of the arrow to 0.5
  arrow_size = 0.5,
  ## use two columns in the legend
  legend_ncol = 2,
  ## set font size
  font_size = 15,
  ## define formatting for dates
  date_labels = c("%d %b %Y"),
  ## don't plot the ID labels below nodes
  label = FALSE,
  ## specify height
  height = 1000,
  ## specify width
  width = 1200,
  ## ensure each case node has a unique y-coordinate - this is very important
  ## when using timelines, otherwise you will have overlapping timelines from
  ## different cases
  position_dodge = TRUE
)


## summarise epicontacts object
summary(epic)

si <- get_pairwise(epic, "date_onset")   
summary(si)
tibble(si = si) %>%
  ggplot(aes(si)) +
  geom_histogram() +
  labs(
    x = "Serial interval",
    y = "Frequency"
  )

head(get_pairwise(epic, "gender"), n = 10)
get_pairwise(epic, "gender", f = table)
fisher.test(get_pairwise(epic, "gender", f = table))

clust <- get_clusters(epic, output = "data.frame")
table(clust$cluster_size)
ggplot(clust, aes(cluster_size)) +
  geom_bar() +
  labs(
    x = "Cluster size",
    y = "Frequency"
  )

epic <- get_clusters(epic)
max_size <- max(epic$linelist$cluster_size)
plot(subset(epic, cs = max_size))

deg_both <- get_degree(epic, type = "both", only_linelist = TRUE)

head(sort(deg_both, decreasing = TRUE), 10)

mean(deg_both)



# Chapter 38 - Phylogenetic trees


pacman::p_load(here, ggplot2, dplyr, ape, ggtree, treeio, ggnewscale, tidytree)

tree <- ape::read.tree("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/phylo/Shigella_tree.txt")  # FIX: local file -> URL

sample_data <- read.csv("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/phylo/sample_data_Shigella_tree.csv",sep=",", na.strings=c("NA"), head = TRUE, stringsAsFactors=F)  # FIX: local file -> URL


ggtree(tree, layout="circular", branch.length='none') %<+% sample_data + # the %<+% is used to add your dataframe with sample data to the tree
  aes(color=Belgium)+ # color the branches according to a variable in your dataframe
  scale_color_manual(name = "Sample Origin", # name of your color scheme (will show up in the legend like this)
                    breaks = c("Yes", "No"), # the different options in your variable
                   labels = c("NRCSS Belgium", "Other"), # how you want the different options named in your legend, allows for formatting
                 values= c("blue", "black"), # the color you want to assign to the variable 
                 na.value = "black") + # color NA values in black as well
  new_scale_color()+ # allows to add an additional color scheme for another variable
     geom_tippoint(aes(color=Continent), size=1.5)+ # color the tip point by continent, you may change shape adding "shape = "
scale_color_brewer(name = "Continent",  # name of your color scheme (will show up in the legend like this)
                       palette="Set1", # we choose a set of colors coming with the brewer package
                   na.value="grey")+ # for the NA values we choose the color grey
  theme(legend.position= "bottom")


pacman::p_load(
  rio,             # import/export
  here,            # relative file paths
  tidyverse,       # general data management and visualization
  ape,             # to import and export phylogenetic files
  ggtree,          # to visualize phylogenetic files
  treeio,          # to visualize phylogenetic files
  ggnewscale)      # to add additional layers of color schemes


tree <- ape::read.tree("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/phylo/Shigella_tree.txt")  # FIX: local file -> URL

# tree <- ape::read.tree("Shigella_tree.txt")

tree

sample_data <- import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/phylo/sample_data_Shigella_tree.csv")  # FIX: local file -> URL

# sample_data <- import("sample_data_Shigella_tree.csv")

head(tree$tip.label) 

colnames(sample_data)   

head(sample_data$Sample_ID) # we again inspect only the first 6 using head()

# sample_data$Sample_ID %in% tree$tip.label
#
# tree$tip.label %in% sample_data$Sample_ID

sample_data$Sample_ID[!tree$tip.label %in% sample_data$Sample_ID]


ggtree(tree)                                            # simple linear tree
ggtree(tree,  branch.length = "none")                   # simple linear tree with all tips aligned
ggtree(tree, layout="circular")                         # simple circular tree
ggtree(tree, layout="circular", branch.length = "none") # simple circular tree with all tips aligned



ggtree(tree, layout = "circular", branch.length = 'none') %<+% sample_data + # %<+% adds dataframe with sample data to tree
  aes(color = Belgium)+                       # color the branches according to a variable in your dataframe
  scale_color_manual(
    name = "Sample Origin",                      # name of your color scheme (will show up in the legend like this)
    breaks = c("Yes", "No"),                     # the different options in your variable
    labels = c("NRCSS Belgium", "Other"),        # how you want the different options named in your legend, allows for formatting
    values = c("blue", "black"),                  # the color you want to assign to the variable 
    na.value = "black") +                        # color NA values in black as well
  new_scale_color()+                             # allows to add an additional color scheme for another variable
    geom_tippoint(
      mapping = aes(color = Continent),          # tip color by continent. You may change shape adding "shape = "
      size = 1.5)+                               # define the size of the point at the tip
  scale_color_brewer(
    name = "Continent",                    # name of your color scheme (will show up in the legend like this)
    palette = "Set1",                      # we choose a set of colors coming with the brewer package
    na.value = "grey") +                    # for the NA values we choose the color grey
  geom_tiplab(                             # adds name of sample to tip of its branch 
    color = 'black',                       # (add as many text lines as you wish with + , but you may need to adjust offset value to place them next to each other)
    offset = 1,
    size = 1,
    geom = "text",
    align = TRUE)+    
  ggtitle("Phylogenetic tree of Shigella sonnei")+       # title of your graph
  theme(
    axis.title.x = element_blank(), # removes x-axis title
    axis.title.y = element_blank(), # removes y-axis title
    legend.title = element_text(    # defines font size and format of the legend title
      face = "bold",
      size = 12),   
    legend.text=element_text(       # defines font size and format of the legend text
      face = "bold",
      size = 10),  
    plot.title = element_text(      # defines font size and format of the plot title
      size = 12,
      face = "bold"),  
    legend.position = "bottom",     # defines placement of the legend
    legend.box = "vertical",        # defines placement of the legend
    legend.margin = margin())   

# ggsave("example_tree_circular_1.png", width = 12, height = 14)
#


p <- ggtree(tree,) %<+% sample_data +
  geom_tiplab(size = 1.5) +                # labels the tips of all branches with the sample name in the tree file
  geom_text2(
    mapping = aes(subset = !isTip,
                  label = node),
    size = 5,
    color = "darkred",
    hjust = 1,
    vjust = 1)                            # labels all the nodes in the tree

p  # print



viewClade(p, node = 452)



p_collapsed <- collapse(p, node = 452)
p_collapsed

p_collapsed + 
geom_point2(aes(subset = (node == 452)),  # we assign a symbol to the collapsed node
            size = 5,                     # define the size of the symbol
            shape = 23,                   # define the shape of the symbol
            fill = "steelblue")           # define the color of the symbol

ggtree(
  tree,
  branch.length = 'none',
  layout = 'circular') %<+% sample_data +               # we add the asmple data using the %<+% operator
  geom_tiplab(size = 1)+                                # label tips of all branches with sample name in tree file
  geom_text2(
    mapping = aes(subset = !isTip, label = node),
    size = 3,
    color = "darkred") +                                # labels all the nodes in the tree
 theme(
   legend.position = "none",                            # removes the legend all together
   axis.title.x = element_blank(),
   axis.title.y = element_blank(),
   plot.title = element_text(size = 12, face="bold"))

sub_tree1 <- tree_subset(
  tree,
  node = 528)                                            # we subset the tree at node 528

ggtree(sub_tree1) +
  geom_tiplab(size = 3) +
  ggtitle("Subset tree 1")

sub_tree2 <- tree_subset(
  tree,
  "S17BD07692",
  levels_back = 9) # levels back defines how many nodes backwards from the sample tip you want to go

ggtree(sub_tree2) +
  geom_tiplab(size =3)  +
  ggtitle("Subset tree 2")


# # to save in .nwk format
# ape::write.tree(sub_tree2, file='data/phylo/Shigella_subtree_2.nwk')
#
# # to save in .txt format
# ape::write.tree(sub_tree2, file='data/phylo/Shigella_subtree_2.txt')
#


p <- ggtree(sub_tree2) +  
  geom_tiplab(size = 4) +
  geom_text2(aes(subset=!isTip, label=node), # labels all the nodes in the tree
             size = 5,
             color = "darkred", 
             hjust = 1, 
             vjust = 1) 
p


p1 <- p + geom_hilight(  # highlights node 39 in blue, "extend =" allows us to define the length of the color block
  node = 39,
  fill = "steelblue",
  extend = 0.0017) +  
geom_hilight(            # highlights the node 37 in yellow
  node = 37,
  fill = "yellow",
  extend = 0.0017) +               
ggtitle("Original tree")


p1 # print

p2 <- ggtree::rotate(p1, 37) + 
      ggtitle("Rotated Node 37")


p2   # print


p3 <-  flip(p1, 39, 37) +
      ggtitle("Rotated Node 36")


p3   # print


ggtree(sub_tree2) %<+% sample_data +     # we use th %<+% operator to link to the sample_data
  geom_tiplab(                          # labels the tips of all branches with the sample name in the tree file
    size = 2.5,
    offset = 0.001,
    align = TRUE) + 
  theme_tree2()+
  xlim(0, 0.015)+                       # set the x-axis limits of our tree
  geom_tippoint(aes(color=Country),     # color the tip point by continent
                size = 1.5)+ 
  scale_color_brewer(
    name = "Country", 
    palette = "Set1", 
    na.value = "grey")+
  geom_tiplab(                          # add isolation year as a text label at the tips
    aes(label = Year),
    color = 'blue',
    offset = 0.0045,
    size = 3,
    linetype = "blank" ,
    geom = "text",
    align = TRUE)+ 
  geom_tiplab(                          # add travel history as a text label at the tips, in red color
    aes(label = Travel_history),
    color = 'red',
    offset = 0.006,
    size = 3,
    linetype = "blank",
    geom = "text",
    align = TRUE)+ 
  ggtitle("Phylogenetic tree of Belgian S. sonnei strains with travel history")+  # add plot title
  xlab("genetic distance (0.001 = 4 nucleotides difference)")+                    # add a label to the x-axis 
  theme(
    axis.title.x = element_text(size = 10),
    axis.title.y = element_blank(),
    legend.title = element_text(face = "bold", size = 12),
    legend.text = element_text(face = "bold", size = 10),
    plot.title = element_text(size = 12, face = "bold"))



p <- ggtree(sub_tree2, branch.length='none', layout='circular') %<+% sample_data +
  geom_tiplab(size =3) + 
 theme(
   legend.position = "none",
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    plot.title = element_text(
      size = 12,
      face = "bold",
      hjust = 0.5,
      vjust = -15))
p


gender <- data.frame("gender" = sample_data[,c("Gender")])
rownames(gender) <- sample_data$Sample_ID

cipR <- data.frame("cipR" = sample_data[,c("gyrA_mutations")])
rownames(cipR) <- sample_data$Sample_ID


MIC_Cip <- data.frame("mic_cip" = sample_data[,c("MIC_CIP")])
rownames(MIC_Cip) <- sample_data$Sample_ID


h1 <-  gheatmap(p, gender,                                 # we add a heatmap layer of the gender dataframe to our tree plot
                offset = 10,                               # offset shifts the heatmap to the right,
                width = 0.10,                              # width defines the width of the heatmap column,
                color = NULL,                              # color defines the boarder of the heatmap columns
         colnames = FALSE) +                               # hides column names for the heatmap
  scale_fill_manual(name = "Gender",                       # define the coloring scheme and legend for gender
                    values = c("#00d1b1", "purple"),
                    breaks = c("Male", "Female"),
                    labels = c("Male", "Female")) +
   theme(legend.position = "bottom",
        legend.title = element_text(size = 12),
        legend.text = element_text(size = 10),
        legend.box = "vertical", legend.margin = margin())
h1


h2 <- h1 + new_scale_fill() 


h3 <- gheatmap(h2, cipR,         # adds the second row of heatmap describing Ciprofloxacin resistance mutations
               offset = 12, 
               width = 0.10, 
               colnames = FALSE) +
  scale_fill_manual(name = "Ciprofloxacin resistance \n conferring mutation",
                    values = c("#fe9698","#ea0c92"),
                    breaks = c( "gyrA D87Y", "gyrA S83L"),
                    labels = c( "gyrA d87y", "gyrA s83l")) +
   theme(legend.position = "bottom",
        legend.title = element_text(size = 12),
        legend.text = element_text(size = 10),
        legend.box = "vertical", legend.margin = margin())+
  guides(fill = guide_legend(nrow = 2,byrow = TRUE))
h3

# First we add the new coloring scheme:
h4 <- h3 + new_scale_fill()

# then we combine the two into a new plot:
h5 <- gheatmap(h4, MIC_Cip,  
               offset = 14, 
               width = 0.10,
                colnames = FALSE)+
  scale_fill_continuous(name = "MIC for Ciprofloxacin",  # here we define a gradient color scheme for the continuous variable of MIC
                      low = "yellow", high = "red",
                      breaks = c(0, 0.50, 1.00),
                      na.value = "white") +
   guides(fill = guide_colourbar(barwidth = 5, barheight = 1))+
   theme(legend.position = "bottom",
        legend.title = element_text(size = 12),
        legend.text = element_text(size = 10),
        legend.box = "vertical", legend.margin = margin())
h5



p <- ggtree(sub_tree2) %<+% sample_data +
  geom_tiplab(size = 3) + # labels the tips
  theme_tree2()+
  xlab("genetic distance (0.001 = 4 nucleotides difference)")+
  xlim(0, 0.015)+
 theme(legend.position = "none",
      axis.title.y = element_blank(),
      plot.title = element_text(size = 12, 
                                face = "bold",
                                hjust = 0.5,
                                vjust = -15))
p


h1 <-  gheatmap(p, gender, 
                offset = 0.003,
                width = 0.1, 
                color="black", 
         colnames = FALSE)+
  scale_fill_manual(name = "Gender",
                    values = c("#00d1b1", "purple"),
                    breaks = c("Male", "Female"),
                    labels = c("Male", "Female"))+
   theme(legend.position = "bottom",
        legend.title = element_text(size = 12),
        legend.text = element_text(size = 10),
        legend.box = "vertical", legend.margin = margin())
h1


h2 <- h1 + new_scale_fill()
h3 <- gheatmap(h2, cipR,   
               offset = 0.004, 
               width = 0.1,
               color = "black",
                colnames = FALSE)+
  scale_fill_manual(name = "Ciprofloxacin resistance \n conferring mutation",
                    values = c("#fe9698","#ea0c92"),
                    breaks = c( "gyrA D87Y", "gyrA S83L"),
                    labels = c( "gyrA d87y", "gyrA s83l"))+
   theme(legend.position = "bottom",
        legend.title = element_text(size = 12),
        legend.text = element_text(size = 10),
        legend.box = "vertical", legend.margin = margin())+
  guides(fill = guide_legend(nrow = 2,byrow = TRUE))
 h3


h4 <- h3 + new_scale_fill()
h5 <- gheatmap(h4, MIC_Cip, 
               offset = 0.005,  
               width = 0.1,
               color = "black", 
                colnames = FALSE)+
  scale_fill_continuous(name = "MIC for Ciprofloxacin",
                      low = "yellow", high = "red",
                      breaks = c(0,0.50,1.00),
                      na.value = "white")+
   guides(fill = guide_colourbar(barwidth = 5, barheight = 1))+
   theme(legend.position = "bottom",
        legend.title = element_text(size = 10),
        legend.text = element_text(size = 8),
        legend.box = "horizontal", legend.margin = margin())+
  guides(shape = guide_legend(override.aes = list(size = 2)))
h5




# Chapter 39 - Interactive plots

pacman::p_load(plotly, rio, here, ggplot2, dplyr, lubridate)
linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL

## these buttons are superfluous/distracting
plotly_buttons_remove <- list('zoom2d','pan2d','lasso2d', 'select2d','zoomIn2d',
                              'zoomOut2d','autoScale2d','hoverClosestCartesian',
                              'toggleSpikelines','hoverCompareCartesian')

p <- linelist %>% 
  mutate(outcome = if_else(is.na(outcome), "Unknown", outcome),
         date_earliest = if_else(is.na(date_infection), date_onset, date_infection),
         week_earliest = floor_date(date_earliest, unit = "week",week_start = 1))%>% 
  count(week_earliest, outcome) %>% 
  ggplot()+
  geom_col(aes(week_earliest, n, fill = outcome))+
  xlab("Week of infection/onset") + ylab("Cases per week")+
  theme_minimal()

p %>% 
  ggplotly() %>% 
  partial_bundle() %>% 
  config(displaylogo = FALSE, modeBarButtonsToRemove = plotly_buttons_remove)


pacman::p_load(
  rio,       # import/export
  here,      # filepaths
  lubridate, # working with dates
  plotly,    # interactive plots
  scales,    # quick percents
  tidyverse  # data management and visualization
  ) 

# import the linelist into R
linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL

# # import case linelist 
# linelist <- import("linelist_cleaned.rds")

weekly_deaths <- linelist %>%
  group_by(epiweek = floor_date(date_onset, "week")) %>%  # create and group data by epiweek column
  summarise(                                              # create new summary data frame:
    n_known_outcome = sum(!is.na(outcome), na.rm=T),      # number of cases per group with known outcome
    n_death  = sum(outcome == "Death", na.rm=T),          # number of cases per group who died
    pct_death = 100*(n_death / n_known_outcome)           # percent of cases with known outcome who died
  )

deaths_plot <- ggplot(data = weekly_deaths)+            # begin with weekly deaths data
  geom_line(mapping = aes(x = epiweek, y = pct_death))  # make line 

deaths_plot   # print

deaths_plot %>% plotly::ggplotly()

# # Make epidemic curve with incidence2 pacakge
# p <- incidence2::incidence(
#   linelist,
#   date_index = date_onset,
#   interval = "weeks",
#   groups = outcome) %>% plot(fill = outcome)

# # Plot interactively  
# p %>% plotly::ggplotly()

p %>% 
  ggplotly() %>% 
  partial_bundle() 

# p <- p %>% 
#   plotly::ggplotly() %>%
#   plotly::partial_bundle()

# ## these buttons are distracting and we want to remove them
# plotly_buttons_remove <- list('zoom2d','pan2d','lasso2d', 'select2d','zoomIn2d',
#                               'zoomOut2d','autoScale2d','hoverClosestCartesian',
#                               'toggleSpikelines','hoverCompareCartesian')
#
# p <- p %>%          # re-define interactive plot without these buttons
#   plotly::config(displaylogo = FALSE, modeBarButtonsToRemove = plotly_buttons_remove)

# import data
facility_count_data <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/malaria_facility_count_data.rds")  # FIX: local file -> URL

# aggregate data into Weeks for Spring district
agg_weeks <- facility_count_data %>% 
  filter(District == "Spring",
         data_date < as.Date("2020-08-01")) %>% 
  mutate(week = aweek::date2week(
    data_date,
    start_date = "Monday",
    floor_day = TRUE,
    factor = TRUE)) %>% 
  group_by(location_name, week, .drop = F) %>%
  summarise(
    n_days          = 7,
    n_reports       = n(),
    malaria_tot     = sum(malaria_tot, na.rm = T),
    n_days_reported = length(unique(data_date)),
    p_days_reported = round(100*(n_days_reported / n_days))) %>% 
  ungroup(location_name, week) %>% 
  right_join(tidyr::expand(., week, location_name)) %>% 
  mutate(week = aweek::week2date(week))

# create plot
metrics_plot <- ggplot(agg_weeks,
       aes(x = week,
           y = location_name,
           fill = p_days_reported))+
  geom_tile(colour="white")+
  scale_fill_gradient(low = "orange", high = "darkgreen", na.value = "grey80")+
  scale_x_date(expand = c(0,0),
               date_breaks = "2 weeks",
               date_labels = "%d\n%b")+
  theme_minimal()+ 
  theme(
    legend.title = element_text(size=12, face="bold"),
    legend.text  = element_text(size=10, face="bold"),
    legend.key.height = grid::unit(1,"cm"),
    legend.key.width  = grid::unit(0.6,"cm"),
    axis.text.x = element_text(size=12),
    axis.text.y = element_text(vjust=0.2),
    axis.ticks = element_line(linewidth=0.4),
    axis.title = element_text(size=12, face="bold"),
    plot.title = element_text(hjust=0,size=14,face="bold"),
    plot.caption = element_text(hjust = 0, face = "italic")
    )+
  labs(x = "Week",
       y = "Facility name",
       fill = "Reporting\nperformance (%)",
       title = "Percent of days per week that facility reported data",
       subtitle = "District health facilities, April-May 2019",
       caption = "7-day weeks beginning on Mondays.")

metrics_plot # print

metrics_plot %>% 
  plotly::ggplotly() %>% 
  plotly::partial_bundle() %>% 
  plotly::config(displaylogo = FALSE, modeBarButtonsToRemove = plotly_buttons_remove)



# Chapter 40 - Reports with R Markdown

# pacman::p_load(tinytex)     # install tinytex package
# tinytex::install_tinytex()  # R command to install TinyTeX software

# pacman::p_load(rmarkdown)

# knitr::opts_chunk$set(echo = FALSE) 

# ![]("path/to/image.png")  

# knitr::include_graphics("path/to/image.png")

# knitr::include_graphics(here::here("path", "to", "image.png"))

# source("your-script.R", local = knitr::knit_global())
# # or sys.source("your-script.R", envir = knitr::knit_global())

# data <- import("datafile.csv") %>%       # Load data and save to environment
#   select(age, hospital, weight)          # Select limited columns
#
# rmarkdown::render(input = "create_output.Rmd")   # Create Rmd file

# rmarkdown::render(input = "my_report.Rmd")

# rmarkdown::render(
#   input = "create_output.Rmd",
#   output_file = stringr::str_glue("outputs/Report_{Sys.Date()}.docx")) 

# rmarkdown::render(
#   input = "surveillance_report.Rmd",  
#   output_file = stringr::str_glue("outputs/Report_{Sys.Date()}.docx"),
#   params = list(date = "2021-04-10", hospital  = "Central Hospital"))

# rmarkdown::render(
#   input = "surveillance_report.Rmd",  
#   output_file = stringr::str_glue("outputs/Report_{Sys.Date()}.docx"),
#   params = “ask”)

# # This is a R script that is separate from the R Markdown
#
# # define R objects
# hospital <- "Central Hospital"
# date <- "2021-04-10"
#
# # Render the R markdown
# rmarkdown::render(input = "create_output.Rmd") 

# hospitals <- c("Central Hospital",
#                 "Military Hospital", 
#                 "Port Hospital",
#                 "St. Mark's Maternity Hospital (SMMH)") 

# for(i in 1:length(hospitals)){
#   rmarkdown::render(
#     input = "surveillance_report.Rmd",
#     output_file = str_glue("output/Report_{hospitals[i]}_{Sys.Date()}.docx"),
#     params = list(hospital  = hospitals[i]))
# }       



# Chapter 41 - Organizing routine reports

# # Install and load the latest version of the package from Github
# pacman::p_load_current_gh("reconverse/reportfactory")
# #remotes::install_github("reconverse/reportfactory") # alternative

# # This will create the factory in the working directory
# new_factory()

# pacman::p_load(reportfactory)

# factory_overview()            # print overview of the factory to console

# linelist <- import(here("data", "clean", "linelist_cleaned.rds"))

# list_reports()

# # Compile the second and fourth Rmds in the "report_sources" folder
# compile_reports(reports = c(2, 4))

# compile_reports(
#      reports = "summary_for_partners.Rmd",
#      subfolder = "for_partners")

# compile_reports(reports = "for_partners/")

# compile_reports(
#   reports = "daily_sitrep.Rmd",
#   params = list(most_recent_data = TRUE,
#                 region = "NORTHERN",
#                 rates_denominator = 10000),
#   subfolder = "regional"
# )



# Chapter 42 - Dashboards with R Markdown

pacman::p_load(
  rio,             # data import/export     
  here,            # locate files
  tidyverse,       # data management and visualization
  flexdashboard,   # dashboard versions of R Markdown reports
  shiny,           # interactive figures
  plotly           # interactive figures
)

# import the linelist into R
linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL

# # import the linelist
# linelist <- import("linelist_cleaned.rds")

# title: "My document"
# author: "Me"
# date: "`r Sys.Date()`"

# title: "My dashboard"
# author: "Me"
# date: "`r Sys.Date()`"
# output:
#   flexdashboard::flex_dashboard:
#     orientation: rows
#     vertical_layout: scroll

# DT::datatable(linelist, 
#               rownames = FALSE, 
#               options = list(pageLength = 5, scrollX = TRUE), 
#               class = 'white-space: nowrap' )

# age_outbreak <- incidence(linelist, date_onset, "week", groups = age_cat)
# plot(age_outbreak, fill = age_cat, col_pal = muted, title = "") %>% 
#   plotly::ggplotly()



# Chapter 43 - Dashboards with Shiny

# pacman::p_load(shiny)

# # an example of app.R
#
# library(shiny)
#
# ui <- fluidPage(
#
#     # Application title
#     titlePanel("My app"),
#
#     # Sidebar with a slider input widget
#     sidebarLayout(
#         sidebarPanel(
#             sliderInput("input_1")
#         ),
#
#         # Show a plot 
#         mainPanel(
#            plotOutput("my_plot")
#         )
#     )
# )
#
# # Define server logic required to draw a histogram
# server <- function(input, output) {
#
#      plot_1 <- reactive({
#           plot_func(param = input_1)
#      })
#
#     output$my_plot <- renderPlot({
#        plot_1()
#     })
# }
#
#
# # Run the application 
# shinyApp(ui = ui, server = server)
#
#

#
# library(shiny)
#
# ui <- fluidPage(
#
#   titlePanel("Malaria facility visualisation app"),
#
#   sidebarLayout(
#
#     sidebarPanel(
#          # selector for district
#          selectInput(
#               inputId = "select_district",
#               label = "Select district",
#               choices = c(
#                    "All",
#                    "Spring",
#                    "Bolo",
#                    "Dingo",
#                    "Barnard"
#               ),
#               selected = "All",
#               multiple = TRUE
#          ),
#          # selector for age group
#          selectInput(
#               inputId = "select_agegroup",
#               label = "Select age group",
#               choices = c(
#                    "All ages" = "malaria_tot",
#                    "0-4 yrs" = "malaria_rdt_0-4",
#                    "5-14 yrs" = "malaria_rdt_5-14",
#                    "15+ yrs" = "malaria_rdt_15"
#               ), 
#               selected = "All",
#               multiple = FALSE
#          )
#
#     ),
#
#     mainPanel(
#       # epicurve goes here
#       plotOutput("malaria_epicurve")
#     )
#
#   )
# )
#
#

pacman::p_load("tidyverse", "lubridate")

# read data
malaria_data <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/malaria_facility_count_data.rds") %>%  # FIX: local file -> URL
  as_tibble()

print(malaria_data)




malaria_data <- malaria_data %>%
  select(-newid) %>%
  pivot_longer(cols = starts_with("malaria_"), names_to = "age_group", values_to = "cases_reported")

print(malaria_data)



plot_epicurve <- function(data, district = "All", agegroup = "malaria_tot") {
  
  if (!("All" %in% district)) {
    data <- data %>%
      filter(District %in% district)
    
    plot_title_district <- stringr::str_glue("{paste0(district, collapse = ', ')} districts")
    
  } else {
    
    plot_title_district <- "all districts"
    
  }
  
  # if no remaining data, return NULL
  if (nrow(data) == 0) {
    
    return(NULL)
  }
  
  data <- data %>%
    filter(age_group == agegroup)
  
  
  # if no remaining data, return NULL
  if (nrow(data) == 0) {
    
    return(NULL)
  }
  
  if (agegroup == "malaria_tot") {
      agegroup_title <- "All ages"
  } else {
    agegroup_title <- stringr::str_glue("{str_remove(agegroup, 'malaria_rdt')} years")
  }
  
  
  ggplot(data, aes(x = data_date, y = cases_reported)) +
    geom_col(width = 1, fill = "darkred") +
    theme_minimal() +
    labs(
      x = "date",
      y = "number of cases",
      title = stringr::str_glue("Malaria cases - {plot_title_district}"),
      subtitle = agegroup_title
    )
  
  
  
}



plot_epicurve(malaria_data, district = "Bolo", agegroup = "malaria_rdt_0-4")


# # global.R script
#
# pacman::p_load("tidyverse", "lubridate", "shiny")
#
# # read data
# malaria_data <- rio::import(here::here("data", "malaria_facility_count_data.rds")) %>% 
#   as_tibble()
#
# # clean data and pivot longer
# malaria_data <- malaria_data %>%
#   select(-newid) %>%
#   pivot_longer(cols = starts_with("malaria_"), names_to = "age_group", values_to = "cases_reported")
#
#
# # define plotting function
# plot_epicurve <- function(data, district = "All", agegroup = "malaria_tot") {
#
#   # create plot title
#   if (!("All" %in% district)) {            
#     data <- data %>%
#       filter(District %in% district)
#
#     plot_title_district <- stringr::str_glue("{paste0(district, collapse = ', ')} districts")
#
#   } else {
#
#     plot_title_district <- "all districts"
#
#   }
#
#   # if no remaining data, return NULL
#   if (nrow(data) == 0) {
#
#     return(NULL)
#   }
#
#   # filter to age group
#   data <- data %>%
#     filter(age_group == agegroup)
#
#
#   # if no remaining data, return NULL
#   if (nrow(data) == 0) {
#
#     return(NULL)
#   }
#
#   if (agegroup == "malaria_tot") {
#       agegroup_title <- "All ages"
#   } else {
#     agegroup_title <- stringr::str_glue("{str_remove(agegroup, 'malaria_rdt')} years")
#   }
#
#
#   ggplot(data, aes(x = data_date, y = cases_reported)) +
#     geom_col(width = 1, fill = "darkred") +
#     theme_minimal() +
#     labs(
#       x = "date",
#       y = "number of cases",
#       title = stringr::str_glue("Malaria cases - {plot_title_district}"),
#       subtitle = agegroup_title
#     )
#
#
#
# }
#
#
#

#
# source(here("funcs", "plot_epicurve.R"), local = TRUE)
#

#
# ui <- fluidPage(
#
#   titlePanel("Malaria facility visualisation app"),
#
#   sidebarLayout(
#
#     sidebarPanel(
#          # selector for district
#          selectInput(
#               inputId = "select_district",
#               label = "Select district",
#               choices = c(
#                    "All",
#                    "Spring",
#                    "Bolo",
#                    "Dingo",
#                    "Barnard"
#               ),
#               selected = "All",
#               multiple = TRUE
#          ),
#          # selector for age group
#          selectInput(
#               inputId = "select_agegroup",
#               label = "Select age group",
#               choices = c(
#                    "All ages" = "malaria_tot",
#                    "0-4 yrs" = "malaria_rdt_0-4",
#                    "5-14 yrs" = "malaria_rdt_5-14",
#                    "15+ yrs" = "malaria_rdt_15"
#               ), 
#               selected = "All",
#               multiple = FALSE
#          )
#
#     ),
#
#     mainPanel(
#       # epicurve goes here
#       plotOutput("malaria_epicurve")
#     )
#
#   )
# )
#
#

#
# server <- function(input, output, session) {
#
#   output$malaria_epicurve <- renderPlot(
#     plot_epicurve(malaria_data, district = input$select_district, agegroup = input$select_agegroup)
#   )
#
# }
#
#

#
# tags$ol(
#
#   tags$li("Item 1"),
#
#   tags$li("Item 2"),
#
#   tags$li("Item 3")
#
# )
#

#
# ui <- fluidPage(
#
#   titlePanel("Malaria facility visualisation app"),
#
#   sidebarLayout(
#
#     sidebarPanel(
#          h4("Options"),
#          # selector for district
#          selectInput(
#               inputId = "select_district",
#               label = "Select district",
#               choices = c(
#                    "All",
#                    "Spring",
#                    "Bolo",
#                    "Dingo",
#                    "Barnard"
#               ),
#               selected = "All",
#               multiple = TRUE
#          ),
#          # selector for age group
#          selectInput(
#               inputId = "select_agegroup",
#               label = "Select age group",
#               choices = c(
#                    "All ages" = "malaria_tot",
#                    "0-4 yrs" = "malaria_rdt_0-4",
#                    "5-14 yrs" = "malaria_rdt_5-14",
#                    "15+ yrs" = "malaria_rdt_15"
#               ), 
#               selected = "All",
#               multiple = FALSE
#          ),
#     ),
#
#     mainPanel(
#       # epicurve goes here
#       plotOutput("malaria_epicurve"),
#       br(),
#       hr(),
#       p("Welcome to the malaria facility visualisation app! To use this app, manipulate the widgets on the side to change the epidemic curve according to your preferences! To download a high quality image of the plot you've created, you can also download it with the download button. To see the raw data, use the raw data tab for an interactive form of the table. The data dictionary is as follows:"),
#     tags$ul(
#       tags$li(tags$b("location_name"), " - the facility that the data were collected at"),
#       tags$li(tags$b("data_date"), " - the date the data were collected at"),
#       tags$li(tags$b("submitted_daate"), " - the date the data were submitted at"),
#       tags$li(tags$b("Province"), " - the province the data were collected at (all 'North' for this dataset)"),
#       tags$li(tags$b("District"), " - the district the data were collected at"),
#       tags$li(tags$b("age_group"), " - the age group the data were collected for (0-5, 5-14, 15+, and all ages)"),
#       tags$li(tags$b("cases_reported"), " - the number of cases reported for the facility/age group on the given date")
#     )
#
#   )
# )
# )
#
#
#

# tags$a(href = "www.epiRhandbook.com", "Visit our website!")

#
# ui <- fluidPage(
#
#   titlePanel("Malaria facility visualisation app"),
#
#   sidebarLayout(
#
#     sidebarPanel(
#          # selector for district
#          selectInput(
#               inputId = "select_district",
#               label = "Select district",
#               choices = c(
#                    "All",
#                    "Spring",
#                    "Bolo",
#                    "Dingo",
#                    "Barnard"
#               ),
#               selected = "All",
#               multiple = FALSE
#          ),
#          # selector for age group
#          selectInput(
#               inputId = "select_agegroup",
#               label = "Select age group",
#               choices = c(
#                    "All ages" = "malaria_tot",
#                    "0-4 yrs" = "malaria_rdt_0-4",
#                    "5-14 yrs" = "malaria_rdt_5-14",
#                    "15+ yrs" = "malaria_rdt_15"
#               ), 
#               selected = "All",
#               multiple = FALSE
#          ),
#          # horizontal line
#          hr(),
#          downloadButton(
#            outputId = "download_epicurve",
#            label = "Download plot"
#          )
#
#     ),
#
#     mainPanel(
#       # epicurve goes here
#       plotOutput("malaria_epicurve"),
#       br(),
#       hr(),
#       p("Welcome to the malaria facility visualisation app! To use this app, manipulate the widgets on the side to change the epidemic curve according to your preferences! To download a high quality image of the plot you've created, you can also download it with the download button. To see the raw data, use the raw data tab for an interactive form of the table. The data dictionary is as follows:"),
#       tags$ul(
#         tags$li(tags$b("location_name"), " - the facility that the data were collected at"),
#         tags$li(tags$b("data_date"), " - the date the data were collected at"),
#         tags$li(tags$b("submitted_daate"), " - the date the data were submitted at"),
#         tags$li(tags$b("Province"), " - the province the data were collected at (all 'North' for this dataset)"),
#         tags$li(tags$b("District"), " - the district the data were collected at"),
#         tags$li(tags$b("age_group"), " - the age group the data were collected for (0-5, 5-14, 15+, and all ages)"),
#         tags$li(tags$b("cases_reported"), " - the number of cases reported for the facility/age group on the given date")
#       )
#
#     )
#
#   )
# )
#
#

#
# server <- function(input, output, session) {
#
#   output$malaria_epicurve <- renderPlot(
#     plot_epicurve(malaria_data, district = input$select_district, agegroup = input$select_agegroup)
#   )
#
#   output$download_epicurve <- downloadHandler(
#     filename = function() {
#       stringr::str_glue("malaria_epicurve_{input$select_district}.png")
#     },
#
#     content = function(file) {
#       ggsave(file, 
#              plot_epicurve(malaria_data, district = input$select_district, agegroup = input$select_agegroup),
#              width = 8, height = 5, dpi = 300)
#     }
#
#   )
#
# }
#
#

#
# malaria_plot_r <- reactive({
#
#   plot_epicurve(malaria_data, district = input$select_district, agegroup = input$select_agegroup)
#
# })
#
#
# # only runs when the district selector changes!
# malaria_plot_er <- eventReactive(input$select_district, {
#
#   plot_epicurve(malaria_data, district = input$select_district, agegroup = input$select_agegroup)
#
# })
#
#
#

#
# server <- function(input, output, session) {
#
#   malaria_plot <- reactive({
#     plot_epicurve(malaria_data, district = input$select_district, agegroup = input$select_agegroup)
#   })
#
#
#
#   output$malaria_epicurve <- renderPlot(
#     malaria_plot()
#   )
#
#   output$download_epicurve <- downloadHandler(
#
#     filename = function() {
#       stringr::str_glue("malaria_epicurve_{input$select_district}.png")
#     },
#
#     content = function(file) {
#       ggsave(file, 
#              malaria_plot(),
#              width = 8, height = 5, dpi = 300)
#     }
#
#   )
#
# }
#
#


plot_epicurve <- function(data, district = "All", agegroup = "malaria_tot", facility = "All") {
  
  if (!("All" %in% district)) {
    data <- data %>%
      filter(District %in% district)
    
    plot_title_district <- stringr::str_glue("{paste0(district, collapse = ', ')} districts")
    
  } else {
    
    plot_title_district <- "all districts"
    
  }
  
  # if no remaining data, return NULL
  if (nrow(data) == 0) {
    
    return(NULL)
  }
  
  data <- data %>%
    filter(age_group == agegroup)
  
  
  # if no remaining data, return NULL
  if (nrow(data) == 0) {
    
    return(NULL)
  }
  
  if (agegroup == "malaria_tot") {
      agegroup_title <- "All ages"
  } else {
    agegroup_title <- stringr::str_glue("{str_remove(agegroup, 'malaria_rdt')} years")
  }
  
    if (!("All" %in% facility)) {
    data <- data %>%
      filter(location_name == facility)
    
    plot_title_facility <- facility
    
  } else {
    
    plot_title_facility <- "all facilities"
    
  }
  
  # if no remaining data, return NULL
  if (nrow(data) == 0) {
    
    return(NULL)
  }

  
  
  ggplot(data, aes(x = data_date, y = cases_reported)) +
    geom_col(width = 1, fill = "darkred") +
    theme_minimal() +
    labs(
      x = "date",
      y = "number of cases",
      title = stringr::str_glue("Malaria cases - {plot_title_district}; {plot_title_facility}"),
      subtitle = agegroup_title
    )
  
  
  
}


plot_epicurve(malaria_data, district = "Spring", agegroup = "malaria_rdt_0-4", facility = "Facility 1")



all_districts <- c("All", unique(malaria_data$District))

# data frame of location names by district
facility_list <- malaria_data %>%
  group_by(location_name, District) %>%
  summarise() %>% 
  ungroup()


all_districts

facility_list

#
#
# ui <- fluidPage(
#
#   titlePanel("Malaria facility visualisation app"),
#
#   sidebarLayout(
#
#     sidebarPanel(
#          # selector for district
#          selectInput(
#               inputId = "select_district",
#               label = "Select district",
#               choices = all_districts,
#               selected = "All",
#               multiple = FALSE
#          ),
#          # selector for age group
#          selectInput(
#               inputId = "select_agegroup",
#               label = "Select age group",
#               choices = c(
#                    "All ages" = "malaria_tot",
#                    "0-4 yrs" = "malaria_rdt_0-4",
#                    "5-14 yrs" = "malaria_rdt_5-14",
#                    "15+ yrs" = "malaria_rdt_15"
#               ), 
#               selected = "All",
#               multiple = FALSE
#          ),
#          # selector for facility
#          selectInput(
#            inputId = "select_facility",
#            label = "Select Facility",
#            choices = c("All", facility_list$location_name),
#            selected = "All"
#          ),
#
#          # horizontal line
#          hr(),
#          downloadButton(
#            outputId = "download_epicurve",
#            label = "Download plot"
#          )
#
#     ),
#
#     mainPanel(
#       # epicurve goes here
#       plotOutput("malaria_epicurve"),
#       br(),
#       hr(),
#       p("Welcome to the malaria facility visualisation app! To use this app, manipulate the widgets on the side to change the epidemic curve according to your preferences! To download a high quality image of the plot you've created, you can also download it with the download button. To see the raw data, use the raw data tab for an interactive form of the table. The data dictionary is as follows:"),
#       tags$ul(
#         tags$li(tags$b("location_name"), " - the facility that the data were collected at"),
#         tags$li(tags$b("data_date"), " - the date the data were collected at"),
#         tags$li(tags$b("submitted_daate"), " - the date the data were submitted at"),
#         tags$li(tags$b("Province"), " - the province the data were collected at (all 'North' for this dataset)"),
#         tags$li(tags$b("District"), " - the district the data were collected at"),
#         tags$li(tags$b("age_group"), " - the age group the data were collected for (0-5, 5-14, 15+, and all ages)"),
#         tags$li(tags$b("cases_reported"), " - the number of cases reported for the facility/age group on the given date")
#       )
#
#     )
#
#   )
# )
#
#

#
# observe({
#
#   if (input$select_district == "All") {
#     new_choices <- facility_list$location_name
#   } else {
#     new_choices <- facility_list %>%
#       filter(District == input$select_district) %>%
#       pull(location_name)
#   }
#
#   new_choices <- c("All", new_choices)
#
#   updateSelectInput(session, inputId = "select_facility",
#                     choices = new_choices)
#
# })
#
#

# server <- function(input, output, session) {
#
#   malaria_plot <- reactive({
#     plot_epicurve(malaria_data, district = input$select_district, agegroup = input$select_agegroup, facility = input$select_facility)
#   })
#
#
#
#   observe({
#
#     if (input$select_district == "All") {
#       new_choices <- facility_list$location_name
#     } else {
#       new_choices <- facility_list %>%
#         filter(District == input$select_district) %>%
#         pull(location_name)
#     }
#
#     new_choices <- c("All", new_choices)
#
#     updateSelectInput(session, inputId = "select_facility",
#                       choices = new_choices)
#
#   })
#
#
#   output$malaria_epicurve <- renderPlot(
#     malaria_plot()
#   )
#
#   output$download_epicurve <- downloadHandler(
#
#     filename = function() {
#       stringr::str_glue("malaria_epicurve_{input$select_district}.png")
#     },
#
#     content = function(file) {
#       ggsave(file, 
#              malaria_plot(),
#              width = 8, height = 5, dpi = 300)
#     }
#
#   )
#
#
#
# }
#

#
#
# # ... the rest of ui
#
# mainPanel(
#
#   tabsetPanel(
#     type = "tabs",
#     tabPanel(
#       "Epidemic Curves",
#       ...
#     ),
#     tabPanel(
#       "Data",
#       ...
#     )
#   )
# )
#
#

library(DT)

# ui <- fluidPage(
#
#      titlePanel("Malaria facility visualisation app"),
#
#      sidebarLayout(
#
#           sidebarPanel(
#                # selector for district
#                selectInput(
#                     inputId = "select_district",
#                     label = "Select district",
#                     choices = all_districts,
#                     selected = "All",
#                     multiple = FALSE
#                ),
#                # selector for age group
#                selectInput(
#                     inputId = "select_agegroup",
#                     label = "Select age group",
#                     choices = c(
#                          "All ages" = "malaria_tot",
#                          "0-4 yrs" = "malaria_rdt_0-4",
#                          "5-14 yrs" = "malaria_rdt_5-14",
#                          "15+ yrs" = "malaria_rdt_15"
#                     ), 
#                     selected = "All",
#                     multiple = FALSE
#                ),
#                # selector for facility
#                selectInput(
#                     inputId = "select_facility",
#                     label = "Select Facility",
#                     choices = c("All", facility_list$location_name),
#                     selected = "All"
#                ),
#
#                # horizontal line
#                hr(),
#                downloadButton(
#                     outputId = "download_epicurve",
#                     label = "Download plot"
#                )
#
#           ),
#
#           mainPanel(
#                tabsetPanel(
#                     type = "tabs",
#                     tabPanel(
#                          "Epidemic Curves",
#                          plotOutput("malaria_epicurve")
#                     ),
#                     tabPanel(
#                          "Data",
#                          DT::dataTableOutput("raw_data")
#                     )
#                ),
#                br(),
#                hr(),
#                p("Welcome to the malaria facility visualisation app! To use this app, manipulate the widgets on the side to change the epidemic curve according to your preferences! To download a high quality image of the plot you've created, you can also download it with the download button. To see the raw data, use the raw data tab for an interactive form of the table. The data dictionary is as follows:"),
#                tags$ul(
#                     tags$li(tags$b("location_name"), " - the facility that the data were collected at"),
#                     tags$li(tags$b("data_date"), " - the date the data were collected at"),
#                     tags$li(tags$b("submitted_daate"), " - the date the data were submitted at"),
#                     tags$li(tags$b("Province"), " - the province the data were collected at (all 'North' for this dataset)"),
#                     tags$li(tags$b("District"), " - the district the data were collected at"),
#                     tags$li(tags$b("age_group"), " - the age group the data were collected for (0-5, 5-14, 15+, and all ages)"),
#                     tags$li(tags$b("cases_reported"), " - the number of cases reported for the facility/age group on the given date")
#                )
#
#
#           )
#      )
# )
#
#

# server <- function(input, output, session) {
#
#   malaria_plot <- reactive({
#     plot_epicurve(malaria_data, district = input$select_district, agegroup = input$select_agegroup, facility = input$select_facility)
#   })
#
#
#
#   observe({
#
#     if (input$select_district == "All") {
#       new_choices <- facility_list$location_name
#     } else {
#       new_choices <- facility_list %>%
#         filter(District == input$select_district) %>%
#         pull(location_name)
#     }
#
#     new_choices <- c("All", new_choices)
#
#     updateSelectInput(session, inputId = "select_facility",
#                       choices = new_choices)
#
#   })
#
#
#   output$malaria_epicurve <- renderPlot(
#     malaria_plot()
#   )
#
#   output$download_epicurve <- downloadHandler(
#
#     filename = function() {
#       stringr::str_glue("malaria_epicurve_{input$select_district}.png")
#     },
#
#     content = function(file) {
#       ggsave(file, 
#              malaria_plot(),
#              width = 8, height = 5, dpi = 300)
#     }
#
#   )
#
#   # render data table to ui
#   output$raw_data <- DT::renderDT(
#     malaria_data
#   )
#
#
# }
#
#



# Chapter 44 - Writing functions

pacman::p_load(
  rio,          # File import
  here,         # File locator
  skimr,        # get overview of data
  tidyverse,    # data management + ggplot2 graphics, 
  gtsummary,    # summary statistics and tests
  janitor,      # adding totals and percents to tables
  scales,       # easily convert proportions to percents  
  flextable,     # converting tables to HTML
  purrr,          #makes functional programming easier
  readr,          #to read csv files
  highcharter     #to create highchart object and draw particular plot
  )

# import the linelists into R
linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: local file -> URL

flu_china <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/fluH7N9_China_2013.csv")  # FIX: local file -> URL


#
# function_name <- function(argument_1, argument_2, argument_3){
#
#            function_task
#
#            return(output)
# }
#
#


contain_covid19 <- function(barrier_gest, wear_mask, get_vaccine){
  
                            if(barrier_gest == "yes" & wear_mask == "yes" & get_vaccine == "yes" ) 
       
                            return("success")
  
  else("please make sure all are yes, this pandemic has to end!")
}




formals(contain_covid19)
body(contain_covid19)
environment(contain_covid19)



contain_covid19(barrier_gest = "yes", wear_mask = "yes", get_vaccine = "yes")



contain_covid19("yes", "yes", "yes")



contain_covid19(barrier_gest = "yes", wear_mask = "yes", get_vaccine = "no")

# contain_covid19(barrier_gest = "sometimes", wear_mask = "yes", get_vaccine = "no")

# linelist %>% 
#   dplyr::slice_head(n=10) %>%  #equivalent to R base "head" function and that return first n observation of the  dataset
#   select(function(x) is.character(x)) 

# linelist %>%   
#    slice_head(n=20) %>% 
#    tibble::rownames_to_column() %>% # add indices of each obs as rownames to clearly see the final selection
#    filter(row_number() %%2 == 0)

#
# linelist_firstobs <- head(linelist, 20)
#
# linelist_firstobs[base::Filter(function(x) (x%%2 == 0), seq(nrow(linelist_firstobs))),]


linelist_firstobs <- head(linelist, 20)

linelist_firstobs[base::Filter(function(x) (x%%2 == 0), seq(nrow(linelist_firstobs))),] %>% 
DT::datatable(rownames = FALSE, filter="top", options = list(pageLength = 10, scrollX=T), class = 'white-space: nowrap' )



proptab_multiple <- function(my_data, var_to_tab){
  
  #print the name of each variable of interest before doing the tabulation
  print(var_to_tab)

  with(my_data,
       rbind( #bind the results of the two following function by row
        #tabulate the variable of interest: gives only numbers
          table(my_data[[var_to_tab]], useNA = "no"),
          #calculate the proportions for each variable of interest and round the value to 2 decimals
         round(prop.table(table(my_data[[var_to_tab]]))*100,2)
         )
       )
}


proptab_multiple(linelist, "gender")

proptab_multiple(linelist, "age_cat")

proptab_multiple(linelist, "outcome")





for(var_to_tab in c("gender","age_cat",  "outcome")){
  
  print(proptab_multiple(linelist, var_to_tab))
  
}



linelist_factor1 <- linelist %>%
      lapply(
          function(x) if(is.character(x)) as.factor(x) else x) %>%
      as.data.frame() %>% 
      glimpse()



linelist_factor2 <- linelist %>%
  purrr::map_if(is.character, as.factor)


linelist_factor2 %>%
        glimpse()



#precising options for the use of highchart
options(highcharter.theme =   highcharter::hc_theme_smpl(tooltip = list(valueDecimals = 2)))


#create a function called "chart_outcome_province" that takes as argument the dataset and the name of the province for which to plot the distribution of the outcome.

chart_outcome_province <- function(data_used, prov){
  
  tab_prov <- data_used %>% 
    filter(province == prov,
           !is.na(outcome))%>% 
    group_by(outcome) %>% 
    count() %>%
    adorn_totals(where = "row") %>% 
    adorn_percentages(denominator = "col", )%>%
    mutate(
        perc_outcome= round(n*100,2))
  
  
  tab_prov %>%
    filter(outcome != "Total") %>% 
  highcharter::hchart(
    "pie", hcaes(x = outcome, y = perc_outcome),
    name = paste0("Distibution of the outcome in:", prov)
    )
  
}

chart_outcome_province(flu_china, "Shanghai")
chart_outcome_province(flu_china,"Zhejiang")
chart_outcome_province(flu_china,"Jiangsu")





indic_1 <- flu_china %>% 
  group_by(province) %>% 
  mutate(
    date_hosp= strptime(date_of_hospitalisation, format = "%m/%d/%Y"),
    date_ons= strptime(date_of_onset, format = "%m/%d/%Y"), 
    delay_onset_hosp= as.numeric(date_hosp - date_ons)/86400,
    mean_delay_onset_hosp = round(mean(delay_onset_hosp, na.rm=TRUE ), 0)) %>%
  select(province, mean_delay_onset_hosp)  %>% 
  distinct()
     

indic_2 <-  flu_china %>% 
            filter(!is.na(outcome)) %>% 
            group_by(province, outcome) %>% 
            count() %>%
            pivot_wider(names_from = outcome, values_from = n) %>% 
    adorn_totals(where = "col") %>% 
    mutate(
        perc_recovery= round((Recover/Total)*100,2))%>% 
  select(province, perc_recovery)
    
    
    
indic_3 <-  flu_china %>% 
            group_by(province) %>% 
            mutate(
                    median_age_cases = median(as.numeric(age), na.rm = TRUE)
            ) %>% 
  select(province, median_age_cases)  %>% 
  distinct()

#join the three indicator datasets

table_indic_all <- indic_1 %>% 
  dplyr::left_join(indic_2, by = "province") %>% 
        left_join(indic_3, by = "province")


#print the indicators in a flextable


print_indic_prov <-  function(table_used, prov){
  
  #first transform a bit the dataframe for printing ease
  indic_prov <- table_used %>%
    filter(province==prov) %>%
    pivot_longer(names_to = "Indicateurs", cols = 2:4) %>% 
   mutate( indic_label = factor(Indicateurs,
   levels= c("mean_delay_onset_hosp","perc_recovery","median_age_cases"),
   labels=c("Mean delay onset-hosp","Percentage of recovery", "Median age of the cases"))
   ) %>% 
    ungroup(province) %>% 
    select(indic_label, value)
  

    tab_print <- flextable(indic_prov)  %>%
    theme_vanilla() %>% 
    flextable::fontsize(part = "body", size = 10) 
    
    
     tab_print <- tab_print %>% 
                  autofit()   %>%
                  set_header_labels( 
                indic_label= "Indicateurs", value= "Estimation") %>%
    flextable::bg( bg = "darkblue", part = "header") %>%
    flextable::bold(part = "header") %>%
    flextable::color(color = "white", part = "header") %>% 
    add_header_lines(values = paste0("Indicateurs pour la province de: ", prov)) %>% 
bold(part = "header")
 
 tab_print <- colformat_double(tab_print,
   digits = 2,
   na_str = "-")

tab_print 
    
}




print_indic_prov(table_indic_all, "Shanghai")
print_indic_prov(table_indic_all, "Jiangsu")



#
# var_summary <- function(data, var) {
#   data %>%
#     summarise(n = n(), min = min({{ var }}), max = max({{ var }}))
# }
# mtcars %>% 
#   group_by(cyl) %>% 
#   var_summary(mpg)
#

# FIX: commented out, errors on purpose in the book
#
# contain_covid19_missing <- function(barrier_gest, wear_mask, get_vaccine){
#
#   if (missing(barrier_gest)) (print("please provide arg1"))
#   if (missing(wear_mask)) print("please provide arg2")
#   if (missing(get_vaccine)) print("please provide arg3")
#
#
#   if (!barrier_gest == "yes" | wear_mask =="yes" | get_vaccine == "yes" ) 
#
#        return ("you can do better")
#
#   else("please make sure all are yes, this pandemic has to end!")
# }
#
#
# contain_covid19_missing(get_vaccine = "yes")
#

# FIX: commented out, errors on purpose in the book
#
# contain_covid19_stop <- function(barrier_gest, wear_mask, get_vaccine){
#
#   if(!is.character(barrier_gest)) (stop("arg1 should be a character, please enter the value with `yes`, `no` or `sometimes"))
#
#   if (barrier_gest == "yes" & wear_mask =="yes" & get_vaccine == "yes" ) 
#
#        return ("success")
#
#   else("please make sure all are yes, this pandemic has to end!")
# }
#
#
# contain_covid19_stop(barrier_gest=1, wear_mask="yes", get_vaccine = "no")
#


map(linelist, mean)

safe_mean <- safely(mean)
linelist %>% 
  map(safe_mean)




# Chapter 45 - Directory interactions

pacman::p_load(
  fs,             # file/directory interactions
  rio,            # import/export
  here,           # relative file pathways
  tidyverse)      # data management and visualization

# FIX: commented out, needs local files (get_data("all") from Ch 2 first)
# fs::dir_tree(path = here("data"), recurse = TRUE)

# FIX: commented out, needs local files (get_data("all") from Ch 2 first)
# # file names
# dir(here("data", "gis", "population"))

# FIX: commented out, needs local files (get_data("all") from Ch 2 first)
# # file paths
# dir_ls(here("data", "gis", "population"))

# # file info
# dir_info(here("data", "gis", "population"))

# file_info(here("data", "case_linelists", "linelist_cleaned.rds"))

# FIX: commented out, writes/reads local files
# file_info(here("data", "case_linelists", "linelist_cleaned.rds"))$modification_time

exists("linelist")

exists("data")
exists("data", inherit = FALSE)

# FIX: commented out, writes/reads local files
# is_dir(here("data"))

# FIX: commented out, writes/reads local files
# is_file(here("data", "case_linelists", "linelist_cleaned.rds"))

# dir_create(here("data", "test"))

# file_create(here("data", "test.rds"))

# source(here("scripts", "cleaning_scripts", "clean_testing_data.R"))

# for(script in dir(here("scripts"), pattern = ".R$")) {   # for each script name in the R Project's "scripts" folder (with .R extension)
#   source(here("scripts", script))                        # source the file with the matching name that exists in the scripts folder
# }

#
# scripts_to_run <- c(
#      "epicurves.R",
#      "demographic_tables.R",
#      "survival_curves.R"
# )
#
# for(script in scripts_to_run) {
#   source(here("scripts", script))
# }
#

# list.files(path = here("data"))
#
# list.files(path = here("data"), pattern = ".csv")
# # dir(path = here("data"), pattern = ".csv")
#
# list.files(path = here("data"), pattern = "evd", ignore.case = TRUE)
#



# Chapter 46 - Version control and collaboration with Git and Github

# (This chapter contains no R code presented in the handbook.)



# Chapter 47 - Common errors

# (This chapter contains no R code presented in the handbook.)



# Chapter 48 - Getting help

# # install/load tidyverse (which includes reprex)
# pacman::p_load(tidyverse)

# # load packages
# pacman::p_load(
#      tidyverse,  # data mgmt and vizualization
#      outbreaks)  # example outbreak datasets
#
# # flu epidemic case linelist
# outbreak_raw <- outbreaks::fluH7N9_china_2013  # retrieve dataset from outbreaks package
#
# # Clean dataset
# outbreak <- outbreak_raw %>% 
#      mutate(across(contains("date"), as.Date))
#
# # Plot epidemic
#
# ggplot(data = outbreak)+
#      geom_histogram(
#           mapping = aes(x = date_of_onset),
#           binwidth = 7
#      )+
#   scale_x_date(
#     date_format = "%d %m"
#   )
#

# reprex::reprex()



# Chapter 49 - R on network drives

# # Find libraries
# .libPaths()                   # Your library paths, listed in order that R installs/searches. 
#                               # Note: all libraries will be listed, but to install to some (e.g. C:) you 
#                               # may need to be running RStudio as an administrator (it won't appear in the 
#                               # install packages library drop-down menu) 

# # Switch order of libraries
# # this can effect the priority of R finding a package. E.g. you may want your C: library to be listed first
# myPaths <- .libPaths() # get the paths
# myPaths <- c(myPaths[2], myPaths[1]) # switch them
# .libPaths(myPaths) # reassign them

# # Find Pandoc
# Sys.getenv("RSTUDIO_PANDOC")  # Find where RStudio thinks your Pandoc installation is

# # Find a package
# # gives first location of package (note order of your libraries)
# find.package("rmarkdown", lib.loc = NULL, quiet = FALSE, verbose = getOption("verbose")) 

# # check/install tinytex, to C: location
# tinytex::install_tinytex()
# tinytex:::is_tinytex() # should return TRUE (note three colons)



# Chapter 50 - Data Table

pacman::p_load(
  rio,        # to import data
  data.table, # to group and clean data
  tidyverse,  # allows use of pipe (%>%) function in this chapter
  here 
  ) 

linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/linelist_cleaned.xlsx") %>% data.table()  # FIX: local file -> URL

dim(linelist) #gives the number of rows and columns in the data table

# linelist[1:5] #returns the 1st to 5th row
# linelist[age >= 18] #subsets cases are equal to or over 18 years
# linelist[age >= 18 & hospital != "Central Hospital"] #subsets cases equal to or over 18 years old but not diagnosed at the Central Hospital
#

# linelist[.N] #returns the last row
# linelist[15:.N] #returns the 15th to the last row

# linelist[hospital %like% "Hospital"] #filter rows where the hospital variable contains “Hospital”
# linelist[outcome %chin% c("Recover", "Death")] #filter rows where the outcome is “Recover” or “Death”
# linelist[age %between% c(40, 60)] #filter rows in the age range 40-60
#
# #%between% must take a vector of length 2, whereas %chin% can take vectors of length >= 1
#

# linelist[ , c(1,3,5)]
# linelist[ , -c("gender", "age", "wt_kg", "ht_cm")]
# linelist[ , list(case_id, outcome)] #linelist[ , .(case_id, outcome)] works just as well
#

linelist[days_onset_hosp > 7 , .N]
linelist[hospital %like% "Military" & outcome %chin% "Death", .(mean(age, na.rm = T))] #na.rm = T removes N/A values
linelist[hospital == "Central Hospital" & outcome == "Recover", 
                 .(mean_age = mean(age, na.rm = T),
                   median_age = median(age, na.rm = T),
                   sd_age = sd(age, na.rm = T))] #this syntax does not use the helper functions but works just as well


linelist[, .N, .(hospital)] #the number of cases by hospital
linelist[age > 18, .(mean_wt = mean(wt_kg, na.rm = T),
                             mean_ht = mean(ht_cm, na.rm = T)), .(gender, outcome)] #NAs represent the categories where the data is missing
linelist[days_onset_hosp > 7, .N, .(month = month(date_hospitalisation), hospital)]



linelist[, .N, .(hospital)][order(-N)][1:3] #1st selects all cases by hospital, 2nd orders the cases in descending order, 3rd subsets the 3 hospitals with the largest caseload




linelist[, .(uniqueN(gender))] #remember .() in the j argument returns a data table



linelist[, .(unique(gender))]


linelist[, .(uniqueN(case_id)), .(month = month(date_hospitalisation))]



linelist[, adult := age >= 18] #adds one column
linelist[, c("child", "wt_lbs") := .(age < 18, wt_kg*2.204)] #to add multiple columns requires c("") and list() or .() syntax
linelist[, `:=` (bmi_in_range = (bmi > 16 & bmi < 40),
                         no_infector_source_data = is.na(infector) | is.na(source))] #this method uses := as a functional operator `:=`
linelist[, adult := NULL] #deletes the column



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

# # install the latest version of the appliedepidata package
# pak::pak("appliedepi/appliedepidata")

# # load the cleaned case linelist directly into R
# linelist <- appliedepidata::get_data(name = "linelist_cleaned_rds")

# # write the raw linelist Excel file to your working directory
# appliedepidata::save_data(name = "case_linelists_linelist_raw", path = getwd())

# # browse datasets interactively
# appliedepidata::search_data()
#
# # list all dataset names programmatically
# appliedepidata::list_data()

# # the "raw" linelist - an Excel spreadsheet with messy data
# # use this to follow along with the Cleaning data and core functions page
# raw_linelist <- appliedepidata::get_data(name = "case_linelists_linelist_raw")
#
# # the "clean" linelist - an R-specific .rds file that preserves column classes
# # use this for all other pages of this handbook that use the linelist
# linelist <- appliedepidata::get_data(name = "linelist_cleaned_rds")
#
# # the "clean" linelist, as an Excel file instead
# linelist_excel <- appliedepidata::get_data(name = "linelist_cleaned_excel")

# cleaning_dict <- appliedepidata::get_data(name = "case_linelists_cleaning_dict")

# malaria_data <- appliedepidata::get_data(name = "malaria_facility_count_data")

# likert_data <- appliedepidata::get_data(name = "likert_data")

# # load the Sierra Leone admin-3 shapefile directly as an sf object
# sle_adm3 <- appliedepidata::get_data(name = "sle_adm3")
#
# # OR save the raw shapefile component files to a folder
# shp_dir <- "sle_adm3_files"
# dir.create(shp_dir)
# appliedepidata::save_data(name = "sle_adm3", path = shp_dir)
# utils::unzip(file.path(shp_dir, "sle_adm3.zip"), exdir = shp_dir)

# # the phylogenetic tree, as a "phylo" object (ape package)
# tree <- appliedepidata::get_data(name = "Shigella_tree")
#
# # additional information on each sample
# sample_data <- appliedepidata::get_data(name = "sample_data_Shigella_tree")
#
# # the subset-tree created later in the page
# subtree <- appliedepidata::get_data(name = "Shigella_subtree_2")

# ##############
# # Country A
# ##############
# # demographics for country A
# A_demo <- appliedepidata::get_data(name = "country_demographics")
#
# # deaths for country A
# A_deaths <- appliedepidata::get_data(name = "deaths_countryA")
#
# ##############
# # Country B
# ##############
# # demographics for country B
# B_demo <- appliedepidata::get_data(name = "country_demographics_2")
#
# # deaths for country B
# B_deaths <- appliedepidata::get_data(name = "deaths_countryB")
#
#
# ###############
# # Reference Pop
# ###############
# # world standard population, by sex
# standard_pop_data <- appliedepidata::get_data(name = "world_standard_population_by_sex")

# counts <- appliedepidata::get_data(name = "campylobacter_germany")

# # read the combined weather data directly as a stars object
# weather_data <- appliedepidata::get_data(name = "germany_weather")
#
# # OR save the raw yearly .nc files to a folder
# weather_dir <- "germany_weather_files"
# dir.create(weather_dir)
# appliedepidata::save_data(name = "germany_weather", path = weather_dir)
# utils::unzip(file.path(weather_dir, "germany_weather.zip"), exdir = weather_dir)

# # fictional survey data
# survey_data <- appliedepidata::get_data(name = "survey_data")
#
# # fictional survey data dictionary
# survey_dict <- appliedepidata::get_data(name = "survey_dict")
#
# # fictional survey population data
# population <- appliedepidata::get_data(name = "population")

# malaria_data <- appliedepidata::get_data(name = "malaria_facility_count_data")

# Chapter 3

# import the cleaned ebola linelist
linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")  # FIX: package won't install
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

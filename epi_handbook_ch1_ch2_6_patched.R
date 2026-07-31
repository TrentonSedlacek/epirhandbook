sessioninfo::session_info()

# install the latest version of the Epi R Handbook package
# FIX: package renamed to appliedepidata, and one of its datasets has an
# encoding defect that crashes the normal install, so lazy-loading is disabled
download.file("https://github.com/appliedepi/appliedepidata/archive/refs/heads/main.zip",
              "aed.zip", mode = "wb")
unzip("aed.zip")
d <- readLines("appliedepidata-main/DESCRIPTION")
d[grepl("^LazyData:", d)] <- "LazyData: false"
writeLines(d, "appliedepidata-main/DESCRIPTION")
remotes::install_local("appliedepidata-main")
file.remove(file.path(system.file("data", package = "appliedepidata"), "datalist"))

# load the package for use
pacman::p_load(appliedepidata)

# download the offline handbook to your computer
# FIX: download_book() no longer exists. Read online at epirhandbook.com
# download_book()

# download all the example data into a folder on your computer
# FIX: nothing to download, the data ships inside the package. list_data() shows it all
list_data()

# download only the linelist example data into a folder on your computer
# FIX: get_data() now returns the data, takes name = , and the handbook's
# dataset is linelist_cleaned_rds (POSIXct dates, age_cat as factor)
linelist <- get_data(name = "linelist_cleaned_rds")

pacman::p_load(rio) # install/load the rio package

# import the file directly from Github
cleaning_dict <- import("https://github.com/appliedepi/epirhandbook_eng/raw/master/data/case_linelists/cleaning_dict.csv")

# import the file directly from Github
likert_data <- import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/likert_data.csv")

ape::read.tree("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/phylo/Shigella_tree.txt")

##############
# Country A
##############
# import demographics for country A directly from Github
A_demo <- import("https://github.com/appliedepi/epirhandbook_eng/raw/master/data/standardization/country_demographics.csv")

# import deaths for country A directly from Github
A_deaths <- import("https://github.com/appliedepi/epirhandbook_eng/raw/master/data/standardization/deaths_countryA.csv")

##############
# Country B
##############
# import demographics for country B directly from Github
B_demo <- import("https://github.com/appliedepi/epirhandbook_eng/raw/master/data/standardization/country_demographics_2.csv")

# import deaths for country B directly from Github
B_deaths <- import("https://github.com/appliedepi/epirhandbook_eng/raw/master/data/standardization/deaths_countryB.csv")

###############
# Reference Pop
###############
# import demographics for country B directly from Github
standard_pop_data <- import("https://github.com/appliedepi/epirhandbook_eng/raw/master/data/standardization/world_standard_population_by_sex.csv")

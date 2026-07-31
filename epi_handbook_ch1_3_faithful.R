# =============================================================================
# The Epidemiologist R Handbook - Chapters 1-3, in book order
# Source: appliedepi/epirhandbook, branch `main`, commit 1d94ba0
#   Ch1 chapters/editorial_style.qmd | Ch2 chapters/data_used.qmd | Ch3 chapters/basics.qmd
#
# 3 lines deviate from the book. Each is marked # FIX with what the book said.
# Everything else is verbatim.
#
# NOTE: this follows the `main` branch, NOT the live epirhandbook.com pages.
# The live site's Chapter 2 is stale: it tells you to install a package
# ("appliedepi/epirhandbook") that is now the book's own source repo, and to run
# download_book() and get_data("all"), neither of which exists any more.
# =============================================================================


# --- FIX 1 of 3 -------------------------------------------------------------
# The book does not have this line. Chapter 2 opens with `pak::pak(...)` and
# Chapter 3 uses `pacman::p_load(...)`, both of which assume those two packages
# are already installed. A fresh Windows R has neither, so nothing below runs
# without this. Run it ONCE; delete it afterwards.
install.packages(c("pak", "pacman"))
# ----------------------------------------------------------------------------


# =============================================================================
# CHAPTER 1 - Editorial style
# =============================================================================
# This chapter has only one runnable line. Its other two code blocks are
# `eval=FALSE` in the book - style illustrations that the book never executes -
# so they are reproduced as comments below, exactly as the book treats them.

sessioninfo::session_info()

# linelist %>%
#   group_by(hospital) %>%  # group rows by hospital
#   slice_max(date, n = 1, with_ties = F) # if there's a tie (of date), take the first row

# linelist %>%
#   group_by(hospital) %>% # group rows by hospital
#   slice_max(
#     date,                # keep row per group with maximum date value
#     n = 1,               # keep only the single highest row
#     with_ties = F)       # if there's a tie (of date), take the first row


# =============================================================================
# CHAPTER 2 - Download handbook and data
# =============================================================================

# install the latest version of the appliedepidata package
pak::pak("appliedepi/appliedepidata")

# load the cleaned case linelist directly into R
linelist <- appliedepidata::get_data(name = "linelist_cleaned_rds")

# browse datasets interactively
# appliedepidata::search_data()

# list all dataset names programmatically
appliedepidata::list_data()

# write the raw linelist Excel file to your working directory
# appliedepidata::save_data(name = "case_linelists_linelist_raw", path = getwd())


# =============================================================================
# CHAPTER 3 - R Basics
# =============================================================================

# --- FIX 2 of 3 -------------------------------------------------------------
# The book says:  pacman::p_load(rio, tidyverse, here)
# Added `apyramid` and `janitor`. The book installs apyramid in a hidden
# (echo=F) setup chunk the reader never sees, and calls janitor::round_half_up()
# further down without ever installing janitor. Without both, the age pyramid
# and rounding sections error.
pacman::p_load(rio, tidyverse, here, apyramid, janitor)
# ----------------------------------------------------------------------------

sqrt(49)

# Print summary statistics of column 'age' in the dataset 'linelist'
summary(linelist$age)

# Create an age pyramid
age_pyramid(data = linelist, age_group = "age_cat5", split_by = "gender")

# Create an age pyramid
age_pyramid(
  data = linelist,        # use case linelist
  age_group = "age_cat5", # provide age group column
  split_by = "gender"     # use gender column for two sides of pyramid
  )

age_pyramid(
  linelist,                    # use case linelist
  "age_cat5",                  # age group column
  "gender",                    # split by gender
  proportional = TRUE,         # percents instead of counts
  pal = c("orange", "purple")  # colors
  )

# --- FIX 3 of 3 -------------------------------------------------------------
# The book shows:  linelist <- rio::import("linelist.xlsx", which = "Sheet1")
# Commented out. There is no linelist.xlsx anywhere in the repository, so this
# errors with "No such file: linelist.xlsx". This is open issue #417
# ("Missing dataset in Chapter 3: R Basics"), still unfixed on main. The book
# marks this chunk eval=FALSE so it never runs it either - and running it here
# would overwrite the good `linelist` loaded in Chapter 2.
# linelist <- rio::import("linelist.xlsx", which = "Sheet1")
# ----------------------------------------------------------------------------

current_week <- "2018-W10"   # this command creates the object current_week by assigning it a value
current_week                 # this command prints the current value of current_week object in the console

current_week <- "2018-W51"   # assigns a NEW value to the object current_week
current_week                 # prints the current value of current_week in the console

# printed to R console only
table(linelist$gender, linelist$outcome)

# save
gen_out_table <- table(linelist$gender, linelist$outcome)
# print
gen_out_table

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

# Print the table of counts in the console, but don't save it
linelist %>%
  count(age_cat)

rdt_result <- c("Positive", "Suspected", "Positive", NA)   # two positive cases, one suspected, and one unknown
is.na(rdt_result)  # Tests whether the value of rdt_result is NA

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

affirmative <- c("1", "Yes", "YES", "yes", "y", "Y", "oui", "Oui", "Si")
affirmative
# condense to
affirmative_str_search <- paste0(affirmative, collapse = "|")  # option with base R
affirmative_str_search <- str_c(affirmative, collapse = "|")   # option with stringr package
affirmative_str_search

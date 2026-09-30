# Made-up data for this demo, don't reuse it thinking it's real.

pacman::p_load(rio, tidyverse, janitor)

# First sheet: one row per county, one column per week. That is wide.
wide <- rio::import("K:/R Study Group/Trenton/pivot_demo_data.xlsx")

wide

# pivot_longer is PROC TRANSPOSE. The six week columns become two: which week, how many cases
long <- wide %>%
  pivot_longer(cols = wk31:wk36, names_to = "week", values_to = "cases")

head(long, 12)

# Same numbers. 8 rows became 48.
nrow(wide)
nrow(long)

# This is why. ggplot wants one column for x, one for y, one to color by.
ggplot(long, aes(x = week, y = cases, color = county, group = county)) +
  geom_line()

# pivot_wider goes back. Same as TRANSPOSE with an ID statement.
long %>%
  pivot_wider(names_from = week, values_from = cases)

# group_by is CLASS. Summarise on the long table, then widen it for the report.
long %>%
  group_by(region, week) %>%
  summarise(cases = sum(cases)) %>%
  pivot_wider(names_from = week, values_from = cases) %>%
  adorn_totals(c("row", "col"))

# Second sheet: a line list, one row per case
linelist <- rio::import("K:/R Study Group/Trenton/pivot_demo_data.xlsx", which = "linelist")

head(linelist)

# The everyday one: count, then widen. PROC FREQ does this in one step.
linelist %>%
  count(county, sex) %>%
  pivot_wider(names_from = sex, values_from = n)

# A county with no cases of one sex shows NA. values_fill makes it a 0.
linelist %>%
  count(county, sex) %>%
  pivot_wider(names_from = sex, values_from = n, values_fill = 0)

# Third sheet: an Excel export where the county is only written on the first row of each block
export <- rio::import("K:/R Study Group/Trenton/pivot_demo_data.xlsx", which = "export")

export

# fill is RETAIN
export %>%
  fill(county)

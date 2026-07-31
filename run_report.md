# run_report.md — verification of `epi_handbook_ch1_ch2_6.R`

**Date:** 2026-07-31
**Script under test:** `epi_handbook_ch1_ch2_6.R` (63 lines)
**Reference material:** `R_Basics_code.Rmd` (all chunks `eval=FALSE`; not executed — it is the
source the `.R` script was derived from)

## Test environment vs. your users

| | This test machine | Your users |
|---|---|---|
| OS | Ubuntu 24.04.4 LTS, x86_64 | **Windows** |
| R | 4.3.3 (2024-02-29) | (assumed ≥ 4.1) |
| locale / ctype | `C` / `C` | Windows codepage (e.g. CP1252) |
| CRAN reachable | **No** — org egress policy 403 | Yes |
| `github.com` reachable | **No** — org egress policy 403 | Yes |
| `raw.githubusercontent.com` | Yes | Yes |

**I am not on Windows.** Everything below is labelled either **TESTED** (I ran it and am
quoting real console output) or **UNTESTED / INFERRED**. Section 8 collects everything I
could identify but could not execute.

### Substitutions I had to make, and why

Three things in this environment are not the script's fault and would not affect your users:

1. **CRAN is blocked (403).** `pacman`, `pak` and `reactable` could not be installed.
   - `reactable` is an `Imports` of **appliedepidata** and blocked the install entirely.
     It is used **only** by `search_data()` — verified: the only matches for `reactable`
     in the package are `R/search_data.R` lines 18/36/76 and `NAMESPACE:9`. I installed a
     minimal **local stub** named `reactable` so the *real* `get_data()` / `list_data()`
     code could be exercised. **Consequence: `search_data()` is untested.** `get_data()`
     and `list_data()` results below are the genuine package code.
   - `pacman` was replaced with a **local shim** whose `p_load()` is
     `requireNamespace()` + `library()`. Faithful for already-installed packages, which is
     the only case the script exercises (lines 15 and 30).
2. **`github.com` is blocked (403).** This breaks script line 6 and the six
   `github.com/.../raw/...` imports *in my environment only*. I therefore ran the script
   **twice**: verbatim (§1) and with `github.com/.../raw/` → `raw.githubusercontent.com`
   plus the archive staged from a local clone (§ "working-network run").
3. **The archive** for line 6 was built from a read-only clone of
   `appliedepi/appliedepidata` at HEAD `87417354e4bba154bd89aba176d09fc8e3bfd2ef`
   (2026-07-23) — the same content the `main.zip` URL serves.

All work was done in a scratch directory; nothing outside it was modified, and none of the
Applied Epi repositories were changed.

---

## 1. Which lines error, exact message

### Verbatim run (this environment — `github.com` blocked)

Errors at lines 6, 9, 10, 11, 15, 23, 28, 38. Lines 6–12 are a **cascade** from the blocked
download and are an artifact of my network, not of your script:

```
=========== LINE 6-7 ===========
trying URL 'https://github.com/appliedepi/appliedepidata/archive/refs/heads/main.zip'
*** WARNING: downloaded length 0 != reported length 0
*** WARNING: cannot open URL '...main.zip': HTTP status was '403 Forbidden'
*** ERROR: cannot open URL 'https://github.com/appliedepi/appliedepidata/archive/refs/heads/main.zip'

=========== LINE 8-8 ===========
*** WARNING: error 1 in extracting from zip file
STATUS: ok                      <- note: unzip() only WARNS on a missing//corrupt zip

=========== LINE 9-9 ===========
*** WARNING: cannot open file 'appliedepidata-main/DESCRIPTION': No such file or directory
*** ERROR: cannot open the connection

=========== LINE 10-10 ===========
*** ERROR: object 'd' not found

=========== LINE 12-12 ===========
Error : Could not copy `appliedepidata-main` to `/tmp/.../file28855131e80f`
[1] NA                          <- install_local() returns NA, does NOT stop the script

=========== LINE 15-15 ===========
*** ERROR: SHIM pacman::p_load: 'appliedepidata' is not installed ...

=========== LINE 23-23 ===========
*** ERROR: could not find function "list_data"

=========== LINE 28-28 ===========
*** ERROR: could not find function "get_data"
```

### Working-network run (substitutions above) — **the result that matters**

Only **two** lines error, and both are genuine script defects:

```
=========== LINE 23 ===========   list_data()
*** ERROR: Expected 2 pieces in each element of `name`.
! 1 value was too short.
i Use `too_few = "debug"` to diagnose the problem.
i Use `too_few = "align_start"/"align_end"` to silence this message.

=========== LINE 38 ===========   ape::read.tree("Shigella_tree.txt")
*** WARNING: cannot open file 'Shigella_tree.txt': No such file or directory
*** ERROR: cannot open the connection
```

Every other line succeeded, producing:

```
d                  character  len 38
linelist           data.frame 5888x30
cleaning_dict      data.frame 9x3
likert_data        data.frame 38x9
A_demo             data.frame 18x3
A_deaths           data.frame 18x4
B_demo             data.frame 18x3
B_deaths           data.frame 18x4
standard_pop_data  data.frame 36x3
```

### ⚠ A silent failure you should know about (TESTED, environment-specific)

In the verbatim run, the six `github.com/.../raw/` imports **did not error**. `rio::import()`
does not check HTTP status, so it parsed my proxy's JSON denial page as data:

```
=========== LINE 33-33 ===========
--- NEW OBJECT 'cleaning_dict': class=data.frame dim=0x44
STATUS: ok
```

A `0 x 44` data frame, reported as success. If any of your users sits behind a corporate
proxy or filter (plausible on a health-department network), these lines will produce
**empty/garbage objects rather than an error**, and the failure will surface much later.

---

## 2. Does the DESCRIPTION-editing block produce a package where `list_data()` and `get_data()` both work?

**No. `get_data()` works; `list_data()` breaks — and the DESCRIPTION edit is what breaks it.**

I installed the package both ways via `remotes::install_local()` (the script's own path):

```
install_local LazyData:false  LazyData=false  datalist_present=TRUE   list_data() -> ERROR: Expected 2 pieces in each element of `name`.
                              get_data() -> 5888x30
install_local LazyData:true   LazyData=true   datalist_present=FALSE  list_data() -> OK  rows=207
                              get_data() -> 5888x30
```

**Root cause (TESTED).** `remotes::install_local()` runs `R CMD build`, which generates an
index file `data/datalist` with **no file extension**. With `LazyData: true`, install
converts `data/` into `Rdata.rdb/.rdx/.rds` and no `datalist` survives. With
`LazyData: false`, the `.rda` files *and* `datalist` are copied verbatim into the installed
`data/` directory. `list_data()` (`R/list_data.R`) explicitly filters out
`Rdata.rdb/rds/rdx` but **not** `datalist`, then calls

```r
tidyr::separate_wider_delim(available_data, name, ".", names = c("name", "extension"))
```

`datalist` has no dot, yielding 1 piece where 2 are required. Diagnostic:

```
filenames NOT splitting into exactly 2 dot-pieces:
  datalist                                                pieces=1
```

**Fix verified (TESTED).** Deleting that one generated file restores `list_data()` with no
effect on `get_data()`:

```
datalist exists: TRUE -> removing
list_data() after removal -> OK rows=307
get_data() still -> 5888x30
```

Note `list_data()` legitimately returns **307 rows** under `LazyData: false` (data 100 +
extdata 107 + intdata 100, with 100 rows flagged `duplicate = TRUE`) versus **207** under
`LazyData: true`. Both are "working"; the catalogue is just bigger because the `.rda` files
are now visible as real files. That is expected, not a bug.

**Is the DESCRIPTION edit needed at all?** On Linux, **no** — see §8.1. The unmodified
package (`LazyData: true`) installed successfully; the encoding defect produced *warnings*,
not a fatal error:

```
Warning in load(zfile, envir = tmp_env) :
  input string 'Saint Barth<c3><a9>lemy' cannot be translated from 'US-ASCII' to UTF-8, but is valid UTF-8
...
* DONE (appliedepidata)
INSTALL EXIT=0
```

With `LazyData: false` the install emitted **no encoding warnings at all**, because the
lazy-load database is never built. That is exactly the mechanism by which the edit would
help on Windows — but whether it is *required* there is **UNTESTED** (§8.1).

---

## 3. Does `get_data(name = "linelist_cleaned_rds")` return 5888×30 with `date_onset` as POSIXct and `age_cat` as a factor?

**Partly. Dimensions ✅, `age_cat` factor ✅, but `date_onset` is `Date`, NOT POSIXct ❌.**

```
'data.frame':	5888 obs. of  30 variables:
 $ case_id             : chr  "5fe599" "8689b7" "11f8ea" "b8812a" ...
 $ generation          : num  4 4 2 3 3 3 4 4 4 4 ...
 $ date_infection      : Date, format: "2014-05-08" NA ...
 $ date_onset          : Date, format: "2014-05-13" "2014-05-13" ...
 $ date_hospitalisation: Date, format: "2014-05-15" "2014-05-14" ...
 $ date_outcome        : Date, format: NA "2014-05-18" ...
 $ outcome             : chr  NA "Recover" "Recover" NA ...
 $ gender              : chr  "m" "f" "m" "f" ...
 $ age                 : num  2 3 56 18 3 16 16 0 61 27 ...
 $ age_cat             : Factor w/ 8 levels "0-4","5-9","10-14",..: 1 1 7 4 1 4 4 1 7 5 ...
 $ age_cat5            : Factor w/ 18 levels "0-4","5-9","10-14",..: 1 1 12 4 1 4 4 1 13 6 ...
 ...
date_onset: Date   age_cat: factor
```

Side-by-side across the three linelist variants:

```
linelist_cleaned_rds                 dim=5888x30  date_onset=Date            age_cat=factor
linelist_cleaned                     dim=5888x30  date_onset=POSIXct/POSIXt  age_cat=character
case_linelists_linelist_cleaned_rds  dim=5888x30  date_onset=Date            age_cat=factor
```

**Correction to my earlier report.** In `applied_epi_findings.md` I stated that
`linelist_cleaned_rds` carries POSIXct dates and the bare `linelist_cleaned` carries `Date`.
That is inverted — it is the other way round, as shown above. The recommendation itself is
unchanged: `linelist_cleaned_rds` is still the handbook's canonical dataset and the one
carrying the factors.

**Consequence for your script:** the comment on lines 26–27 ("POSIXct dates, age_cat as
factor") is wrong about the dates. The *code* is correct; only the comment misleads. Nothing
in the script breaks because of it — but code that assumes a time component (e.g.
`format(date_onset, "%H:%M")`) would silently misbehave.

---

## 4. Does anything in the install path require compilation?

**appliedepidata itself: NO — it is pure R.** Answered from the package source, not from the
fact that it built here:

```
src/ directory present?        No such file or directory
NeedsCompilation field:        (absent from DESCRIPTION)
LinkingTo field:               (absent from DESCRIPTION)
compiled source files (.c/.cpp/.f/.h/Makevars):   NONE
```

So `remotes::install_local("appliedepidata-main")` needs **no Rtools** for the package itself.

**Its dependencies are a different matter.** `Imports:` is
`cli, clipr, dplyr, reactable, rio, rstudioapi, shiny, tidyr`. Of that tree, these carry
`NeedsCompilation: yes`:

```
Rcpp, base64enc, bit, bit64, cachem, cli, commonmark, curl, data.table, digest,
dplyr, ellipsis, fansi, fastmap, foreign, fs, glue, haven, htmltools, httpuv,
jsonlite, later, magrittr, mime, promises, purrr, rappdirs, readr, readxl, rlang,
sass, sourcetools, stringi, tibble, tidyr, tzdb, utf8, vctrs, vroom, writexl
```

**Practical answer for Windows (INFERRED, not tested):** all of the above are on CRAN, and
CRAN ships **pre-built Windows binaries**, so a normal `install.packages()`/`p_load()` on
Windows downloads binaries and needs no Rtools. The exposure is narrower than the list
suggests, but real in three cases:

- A user with `options(pkgType = "source")`, or who answers "Yes" to *"Do you want to install
  from sources the package which needs compilation?"* — a prompt R shows routinely when a
  source version is newer than the binary. Answering yes without Rtools fails.
- A user on an R version for which a given binary is not published.
- `remotes::install_local()` on the **script's own package** is fine (pure R), but if it has
  to satisfy a *missing* compiled dependency from source, that step needs Rtools.

The script never installs `pacman`, `remotes` or `sessioninfo`, yet uses all three
(lines 1, 12, 15). Users must already have them.

---

## 5. Do all six raw `epirhandbook_eng/master/...` URLs still resolve?

**Yes — all six, HTTP 200.** The six `github.com/.../raw/master/...` URLs are on lines
33, 44, 47, 53, 56 and 62. (Line 36 is a seventh data URL but already uses
`raw.githubusercontent.com`, so I list it separately.)

**Which host I used:** `github.com` is blocked by *my* egress policy, so a direct probe of
the `github.com/.../raw/` form returns 403 here — **that is my proxy, not GitHub, and not
evidence the URL is dead.** I therefore tested the equivalent
`raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/...` paths, which is where
`github.com/.../raw/` 302-redirects in normal use.

| Line | Path (under `.../epirhandbook_eng/master/`) | HTTP | Bytes | Imported as |
|---|---|---|---|---|
| 33 | `data/case_linelists/cleaning_dict.csv` | 200 | 176 | 9×3 |
| 44 | `data/standardization/country_demographics.csv` | 200 | 386 | 18×3 |
| 47 | `data/standardization/deaths_countryA.csv` | 200 | 308 | 18×4 |
| 53 | `data/standardization/country_demographics_2.csv` | 200 | 389 | 18×3 |
| 56 | `data/standardization/deaths_countryB.csv` | 200 | 302 | 18×4 |
| 62 | `data/standardization/world_standard_population_by_sex.csv` | 200 | 859 | 36×3 |
| 36 | `data/likert_data.csv` (already raw.githubusercontent) | 200 | — | 38×9 |

All seven both **resolve and import** (dimensions from the working-network run). I also
probed the full set of 31 raw-data URLs that the old `data_used.qmd` chapter advertises —
**all 31 returned 200**.

**Why they still work:** `epirhandbook_eng` was *renamed* to `appliedepi/epirhandbook` on
2026-07-24, not archived or deleted; GitHub keeps the old name redirecting, and the `master`
branch still carries `data/`. This is a redirect you are relying on — see §8.7.

---

## 6. `ape::read.tree("Shigella_tree.txt")` — where does that file actually come from?

**The file exists, but not where the script looks. Line 38 reads a bare relative path that
nothing in the script ever creates, so it fails with `cannot open the connection`.**
(The same defect is inherited from `R_Basics_code.Rmd` line 76.)

Real locations (TESTED):

- **Handbook repo:** `data/phylo/Shigella_tree.txt` — present on both `main` and `master`.
- **Inside appliedepidata:** `inst/extdata/Shigella_tree.txt`, plus `data/Shigella_tree.rda`.

**Working URL:**

```
https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/phylo/Shigella_tree.txt
```

HTTP 200, 11 047 bytes. `ape::read.tree()` accepts the URL directly — verified:

```
Phylogenetic tree with 299 tips and 236 internal nodes.
Tip labels:
  SRR5006072, SRR4192106, S18BD07865, S18BD00489, S17BD08906, S17BD05939, ...
Node labels:
  17, 29, 100, 67, 100, 100, ...
Rooted; includes branch lengths.
```

299 tips matches the handbook's description of the dataset. The package route also works and
needs no network beyond the package already installed:

```r
appliedepidata::get_data(name = "Shigella_tree")   # -> phylo, 299 tips (TESTED)
```

---

## 7. Smallest set of line edits that makes the script run clean

**Two edits: one inserted line, one changed line.** No restructuring, no helper functions,
nothing else touched.

```diff
--- epi_handbook_ch1_ch2_6.R
+++ epi_handbook_ch1_ch2_6.R
@@ line 12 @@
  remotes::install_local("appliedepidata-main")
+ file.remove(file.path(system.file("data", package = "appliedepidata"), "datalist"))

@@ line 38 @@
- ape::read.tree("Shigella_tree.txt")
+ ape::read.tree("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/phylo/Shigella_tree.txt")
```

- **Edit 1 (insert after line 12)** deletes the `R CMD build`-generated `data/datalist`,
  which is the sole reason `list_data()` errors under `LazyData: false` (§2). It must run
  *after* the install and *before* line 23.
- **Edit 2 (replace line 38)** points `read.tree()` at the file's real location (§6).

**Verification — the patched script, every line:**

```
LINE 1  ok      LINE 12 ok      LINE 30 ok      LINE 47 ok   A_deaths          18x4
LINE 6  ok      LINE 15 ok      LINE 33 ok      LINE 53 ok   B_demo            18x3
LINE 7  ok      LINE 23 ok      LINE 36 ok      LINE 56 ok   B_deaths          18x4
LINE 8  ok      LINE 28 ok      LINE 38 ok      LINE 62 ok   standard_pop_data 36x3
LINE 9  ok      LINE 44 ok
LINE 10 ok
LINE 11 ok
```

No errors, no warnings. `list_data()` now prints:

```
# A tibble: 307 x 4
   directory name                                  extension duplicate
   <chr>     <chr>                                 <chr>     <lgl>
 1 data      AJS_AmTiman                           rda       FALSE
 2 data      AJS_AmTiman_population                rda       FALSE
 ...
```

**Optional, zero functional impact:** the comment on lines 26–27 says the dataset has
"POSIXct dates". It has `Date` (§3). Correcting the comment changes no behaviour.

**Not changed on purpose:** the six `github.com/.../raw/` URLs. They resolve and import
correctly for a normal user (§5), so changing them is not required to run clean. If you want
defence against the silent-garbage failure mode of §1, rewriting them to
`raw.githubusercontent.com` is six more line edits — a robustness choice, not a fix.

---

## 8. Windows-specific failure modes — identified but **UNTESTED**

I ran on Linux with a `C` locale. Everything in this section is reasoned from the package
source and the R documentation; **none of it was executed on Windows.**

### 8.1 The encoding defect and whether the DESCRIPTION edit is actually needed — **UNTESTED, and the premise is unproven**
`data/gis_covid_incidence.rda` stores four country names as valid UTF-8 bytes tagged with
encoding `unknown` (native): `Côte d'Ivoire`, `Réunion`, `Curaçao`, `Saint Barthélemy`.
`DESCRIPTION` has `LazyData: true`.

What I **did** confirm on Linux: the mislabeled encoding is real; `load()` warns; installing
with `LazyData: true` **succeeds anyway** (warnings only, `INSTALL EXIT=0`); and I could not
make `tools:::makeLazyLoadDB()` fail even under `LC_ALL=C`.

What I **cannot** confirm: that the install *dies* on Windows with "embedded nul in string".
Your script's comment (lines 4–5) asserts this crash as the reason for the edit. It is
plausible — Windows uses a non-UTF-8 codepage where re-encoding these strings can hit a
genuine failure — but **I did not reproduce it, and it is the load-bearing assumption behind
lines 6–12.** If it turns out the crash does not occur on your users' Windows setup, the
whole download/unzip/edit/install block can be replaced by a one-line
`pak::pak("appliedepi/appliedepidata")` — and `list_data()`'s `datalist` problem disappears
with it, since that only arises under `LazyData: false`.

**Worth doing:** have one Windows user run the unmodified install and report what happens.
That single data point decides whether lines 6–12 are necessary at all.

### 8.2 Encoding of the data *after* load — UNTESTED
Even where the install succeeds, those four names are tagged as native encoding. On a CP1252
Windows session, `Côte d'Ivoire` may render as mojibake, and string matching
(`filter(Name == "Côte d'Ivoire")`) may silently fail to match. This affects
`gis_covid_incidence` only — not the Ch 1–3 linelist — so it should not bite your group's
current material.

### 8.3 File paths — UNTESTED
- The script writes `aed.zip` and unzips `appliedepidata-main/` into the **current working
  directory**. In RStudio that is wherever the session started; if a user's cwd is
  unwritable (a network home drive, or `C:\Program Files\...`), lines 7–8 fail.
- `R_Basics_code.Rmd` line 237 shows `setwd("C:/Documents/R Files/My analysis")`. If anyone
  pastes a Windows path with **backslashes** into R it is an escape-sequence error, not a
  path. Forward slashes or doubled backslashes only.
- **MAX_PATH:** unzipping into a deeply nested OneDrive/redirected-home path can exceed the
  260-character limit on Windows configurations without long-path support. The archive
  contains long names (e.g.
  `gis_population_sle_population_statistics_sierraleone_2020.xlsx`).

### 8.4 Locale — UNTESTED
I ran with `ctype = C`. A Windows session runs a codepage locale, which is precisely the
condition under which the §8.1/§8.2 re-encoding behaves differently. My "install succeeded"
result therefore **does not transfer**.

### 8.5 Zip handling — UNTESTED
`unzip()` uses R's internal unzip, capped at ~4 GB and historically fussy about entries the
external tool handles. The archive here is ~83 MB, well inside limits. More important:
**`unzip()` only warns on failure** — my verbatim run showed `error 1 in extracting from zip
file` with `STATUS: ok`. Combined with `install_local()` returning `NA` rather than stopping,
a failed download produces a **confusing downstream error at line 15**, not at the real point
of failure.

Also note `download.file(..., mode = "wb")` on line 7 is correct and necessary on Windows —
without `mode="wb"` the zip would be corrupted by line-ending translation. That part is right.

### 8.6 Install permissions — UNTESTED
If the user lacks write access to the site library, R prompts to create a personal library.
Under `remotes::install_local()` in a non-interactive context that prompt can fail outright.
Corporate Windows images (a health department is a likely case) frequently lock the R
install directory and/or run antivirus that quarantines newly written `.dll`/`.rdb` files
mid-install.

### 8.7 Reliance on the rename redirect — TESTED to resolve today, future UNTESTED
All the raw URLs work only because `epirhandbook_eng` → `epirhandbook` still redirects and
`master` still exists. Applied Epi is actively moving data out of the book repo into
**appliedepidata** (`covid_example_data` is already staged for deletion on `main`). I found
no announced schedule to delete `master`, but these URLs are not a durable base for course
material.

### 8.8 Proxy/TLS interception — TESTED here, UNTESTED on your network
Per §1, `rio::import()` does not check HTTP status and will happily parse an error page into
an empty data frame. On a filtered corporate network your users could get `0 x 44` objects
with no error. Cheap guard: after each import, check `nrow()`/`ncol()` looks sane.

---

## Inconclusive / not verified

- **`search_data()`** — not tested at all; `reactable` was a stub (see substitutions).
- **`pacman::p_load()` real behaviour** — tested via a shim. In particular, if line 12's
  install fails, real `p_load(appliedepidata)` would try CRAN, not find the package there,
  and emit a different (more confusing) error than my shim's.
- **`pak::pak()`** — could not be installed (CRAN blocked); the script does not use it, but
  it is what the current handbook recommends.
- **The Windows "embedded nul" crash** — §8.1. This is the single most consequential
  unverified claim in the whole exercise, and it is the justification for lines 4–12.
- **Line 6's URL itself** — blocked here (403 by my proxy). I verified the *content* by
  staging the identical archive from a clone at
  `87417354e4bba154bd89aba176d09fc8e3bfd2ef`; I did not verify GitHub serves that URL.

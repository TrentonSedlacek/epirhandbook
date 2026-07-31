# textbook_faithful.md — Chapters 1–3 for a beginner Windows study group

**Script:** `epi_handbook_ch1_3_faithful.R`
**Book source:** `appliedepi/epirhandbook`, branch `main`, HEAD `1d94ba0a84b062ba72cb1205a1fb99bbc600caee`
**Tested on:** Ubuntu 24.04 / R 4.3.3. **I am not on Windows** — see §8.

---

## Deviation count: 3

At your limit, not over it. All three are in the script marked `# FIX`.

| # | Line | What the book says | Why it can't run as written |
|---|---|---|---|
| 1 | `install.packages(c("pak", "pacman"))` | *(nothing — book has no such line)* | Ch2 opens with `pak::pak(...)`, Ch3 uses `pacman::p_load(...)`. A fresh Windows R has neither. Without this, nothing runs. Run once, then delete. |
| 2 | `pacman::p_load(rio, tidyverse, here, apyramid, janitor)` | `pacman::p_load(rio, tidyverse, here)` | The book installs `apyramid` in a **hidden `echo=F` chunk the reader never sees**, and calls `janitor::round_half_up()` without ever installing `janitor`. |
| 3 | `# linelist <- rio::import("linelist.xlsx", which = "Sheet1")` (commented) | same line, live | No `linelist.xlsx` exists anywhere in the repo. This is **open issue #417**. The book marks the chunk `eval=FALSE`, so it never runs it either — commenting preserves book behaviour. Running it would also overwrite the good `linelist` from Ch2. |

**Deviation 3 is arguably not a deviation at all** — the book does not execute that line. If you count only lines whose *behaviour* differs from the rendered book, the count is **2**.

---

## 1. Code inventory across all three chapters

**Chapter 1 — `editorial_style.qmd`. Effectively no runnable code.**
Identical on `main` and the live/old branch (byte-identical chunks). Three code blocks:

- 2 × `eval=FALSE` — `slice_max()` style illustrations referencing a `linelist` with a `date`
  column (the real linelist has `date_onset`, not `date`). The book never runs them.
- 1 × runnable: `sessioninfo::session_info()`.

So Chapter 1 contributes **one** executable line. No data needed.

**Chapter 2 — `data_used.qmd`.** See §2 — this is where live and main disagree.

**Chapter 3 — `basics.qmd`. 74 chunks, 172 non-comment code lines.**
Most are `eval=FALSE` teaching illustrations. The chapter's own executed setup is a
**hidden `echo=F` chunk** the reader never sees:

```r
# import the cleaned ebola linelist
linelist <- appliedepidata::get_data(name = "linelist_cleaned_rds")
pacman::p_load(apyramid)
```

That hidden chunk is exactly why Ch3 breaks for a reader following the visible text: it
silently supplies both `linelist` **and** `apyramid`. On the old branch the same chunk read
from a local `data/` folder instead.

---

## 2. Chapter 2 setup — both versions verbatim

### Live site (epirhandbook.com) — `new_pages/data_used.qmd` @ `origin/master` (`e121efa`)

```r
# install the latest version of the Epi R Handbook package
pacman::p_install_gh("appliedepi/epirhandbook")
```
```r
# load the package for use
pacman::p_load(epirhandbook)
```
```r
# download the offline handbook to your computer
download_book()
```
```r
# install the latest version of the Epi R Handbook package
pacman::p_install_gh("appliedepi/epirhandbook")
```
```r
# load the package for use
pacman::p_load(epirhandbook)
```
> "Run `get_data("all")` to get *all* the example data, or provide a specific file name and
> extension within the quotes to retrieve only one file."

*(Note: the source says `p_install_gh`; you quoted `p_load_gh`. Both appear in the wild and
both fail identically now.)*

**Every one of these is dead.** `appliedepi/epirhandbook` is no longer a package — it is the
book's own source repo, renamed from `epirhandbook_eng` on 2026-07-24. `download_book()`
exists nowhere. `get_data()` now takes `name =` and returns an object rather than downloading.

### Main branch — `chapters/data_used.qmd` @ `e4130b5` (file), repo HEAD `1d94ba0`

```r
# install the latest version of the appliedepidata package
pak::pak("appliedepi/appliedepidata")
```
```r
# load the cleaned case linelist directly into R
linelist <- appliedepidata::get_data(name = "linelist_cleaned_rds")
```
```r
# write the raw linelist Excel file to your working directory
appliedepidata::save_data(name = "case_linelists_linelist_raw", path = getwd())
```
```r
# browse datasets interactively
appliedepidata::search_data()

# list all dataset names programmatically
appliedepidata::list_data()
```

---

## 3. Does the main-branch Chapter 2 setup work with zero edits?

**Yes — for the part I could test, and this is the finding that makes everything else moot.**

`get_data(name = "linelist_cleaned_rds")` against an **unmodified** `appliedepidata`
(`LazyData: true`, no DESCRIPTION editing, no workarounds):

```
LazyData: true
linelist dims: 5888x30 | age_cat: factor
```

`list_data()` also works on the unmodified install (207 rows). The encoding defect in
`gis_covid_incidence.rda` produces install-time **warnings only** on Linux, not an error:

```
Warning in load(zfile, envir = tmp_env) :
  input string 'Saint Barth<c3><a9>lemy' cannot be translated from 'US-ASCII' to UTF-8, but is valid UTF-8
...
* DONE (appliedepidata)
INSTALL EXIT=0
```

**So: use the new chapter verbatim.** No DESCRIPTION editing, no `LazyData: false` hack.
That hack — which an earlier draft script of yours used — actively *breaks* `list_data()`, by
leaving a `data/datalist` file that the function cannot parse. Avoid it.

⚠️ **What I could not test:** `pak::pak("appliedepi/appliedepidata")` itself. `pak` is not
installable here (CRAN is blocked by this environment's egress policy, HTTP 403), so I
installed the identical source via `remotes::install_local()`. That exercises the same build
and install path, but it is **not literally the book's line**. Two things support it working:
`appliedepidata` is **pure R** — no `src/`, no `LinkingTo`, no `NeedsCompilation` — so no
Rtools is needed for it; and its ~40 compiled dependencies all ship as CRAN Windows binaries.

---

## 4. Chapter 3, line by line

Run in order against the Ch2-provided `linelist`. Three failures:

```
ch6  sqrt(49)                                  ok
ch7  summary(linelist$age)                     ok
ch10 age_pyramid(...)                          ERROR: there is no package called 'apyramid'
ch35 current_week <- ...                       ok
ch38 table(gender, outcome)                    ok
ch43 class(linelist$age)                       ok
ch44 num_vector                                ok
ch45 explanatory_vars                          ok
ch48 my_vector[5]                              ok
ch49 summary(...)[['Median']]                  ok
ch52 my_list                                   ok
ch59 linelist %>% count(age_cat)               ok
ch66 is.na(rdt_result)                         ok
ch68 janitor::round_half_up                    ERROR: there is no package called 'janitor'
ch69 mean(c(...))                              ok
ch71 'a' %in% my_vector                        ok
ch74 str_c(affirmative, collapse)              ok
ch25 rio::import('linelist.xlsx')  [#417]      ERROR: No such file: linelist.xlsx
```

**None of the three failures is Chapter 3's own logic.** Two are missing packages the book
never tells the reader to install; one is issue #417.

### Issue #417 — does it affect you, and is it fixed on main?

- **Title:** "Missing dataset in Chapter 3: R Basics" · **State: OPEN** · opened 2025-01-02 by `banakani`, no labels.
- **Content:** the reporter cannot find `linelist.xlsx` for
  `linelist <- rio::import("linelist.xlsx", which = "Sheet1")`, and asks either to remove the
  snippet or add the file.
- **Fixed on main? No.** The line is unchanged on `main` (chunk 25, still `eval=FALSE`).
- **Does it affect you? Only mildly.** Because the book marks it `eval=FALSE`, the rendered
  book never runs it, so nothing in the published output is broken. But a beginner copying
  code top-to-bottom *will* hit `No such file: linelist.xlsx` — and worse, if it somehow
  succeeded it would clobber the working `linelist`. Hence FIX 3 keeps it commented.

---

## 5. Smallest change for each failure

| Failure | Exact error | Smallest fix |
|---|---|---|
| `age_pyramid()` | `there is no package called 'apyramid'` | add `apyramid` to the existing `p_load()` line — **0 new lines** |
| `janitor::round_half_up()` | `there is no package called 'janitor'` | add `janitor` to the same `p_load()` line — **0 new lines** |
| `rio::import("linelist.xlsx")` | `No such file: linelist.xlsx` | comment the line out (matches the book's own `eval=FALSE`) — **0 new lines** |
| `pak`/`pacman` absent | `there is no package called 'pak'` | one `install.packages(c("pak","pacman"))` — **1 new line** |

Two of these fold into **one modified book line**, which is why the total is 3 and not 5.

---

## 6–7. The script

`epi_handbook_ch1_3_faithful.R`, in book order: Ch1 → Ch2 → Ch3. Every line is verbatim from
`main` except the three marked `# FIX`, each stating what the book said and why it can't run.
Book chunks marked `eval=FALSE` are reproduced as comments, which is how the book itself
treats them.

---

## 8. Windows-specific — **UNTESTED**

I ran on Linux with a `C` locale. Do not treat any of this as verified on Windows.

1. **`pak::pak()` itself — untested.** CRAN blocked here. See §3.
2. **`apyramid` and `janitor` — untested.** Neither is available in this environment's
   package sources, so FIX 2 is reasoned, not executed. Both are ordinary CRAN packages with
   Windows binaries; I expect `p_load()` to fetch them, but I did not see it happen.
3. **The `gis_covid_incidence` encoding defect — untested on Windows.** Four country names
   (`Côte d'Ivoire`, `Réunion`, `Curaçao`, `Saint Barthélemy`) are valid UTF-8 tagged as
   native/US-ASCII. On Linux this only warns and the install completes. On a CP1252 Windows
   session the lazy-load step *could* fail harder. **If a user's install dies here, that is
   the reason** — and the fallback is `pak::pak("appliedepi/appliedepidata")` replaced by a
   `LazyData: false` local install, at the cost of breaking `list_data()`. This dataset is not
   used in Chapters 1–3, so it only threatens installation, not your material.
4. **No Rtools** — fine for `appliedepidata` (pure R). Risk is only if a user answers "Yes"
   to *"Do you want to install from sources the package which needs compilation?"*. **Tell
   them to answer No.** That prompt is the single most likely thing to derail a beginner here.
5. **Working directory / paths** — `pak` and `install.packages` write to the user library; on
   locked-down corporate Windows images R may prompt to create a personal library, and
   antivirus can quarantine freshly written `.dll`/`.rdb` files mid-install.
6. **`View()`** (Ch3 chunk 50, `eval=FALSE`) is RStudio-only; harmless as a comment.

### One thing worth telling the group out loud

The live site and the book's source now disagree, and **the live site is the wrong one**. The
migration is merged to `main` and built to `staging`, but there are no release tags and no
`production` branch, so the public pages still show the dead `download_book()` instructions.
If someone reads Chapter 2 on epirhandbook.com and types what they see, it will fail — not
because they made a mistake.

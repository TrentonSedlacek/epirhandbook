# notes.md

**Script:** `epi_ch1_3.R` — 429 lines, 73 executable, 254 commented.
**Source:** `appliedepi/epirhandbook`, branch `main`, HEAD `1d94ba0a84b062ba72cb1205a1fb99bbc600caee`
(`chapters/editorial_style.qmd`, `chapters/data_used.qmd`, `chapters/basics.qmd`).

The script was **generated mechanically** from those three `.qmd` files — chunk bodies copied
byte-for-byte, nothing retyped, spacing and the book's own inline comments preserved.

---

## Deviation count: 2

Both are single-line changes. Nothing else in the script differs from the book.

| Line | Book says | Script says | FIX comment |
|---|---|---|---|
| 118 | `linelist <- appliedepidata::get_data(name = "linelist_cleaned_rds")` | `linelist <- rio::import("https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds")` | `# FIX: package won't install` |
| 169 | `pacman::p_load(rio, tidyverse, here)` | `pacman::p_load(rio, tidyverse, here, janitor)` | `# FIX: janitor not installed` |

---

## The two things you asked me to confirm

**1. `apyramid` — you were half right, and the half that's wrong is in your favour.**
The book *does* install it, in a hidden `echo=F` chunk at the top of `basics.qmd` that a
reader never sees:

```r
# import the cleaned ebola linelist
linelist <- appliedepidata::get_data(name = "linelist_cleaned_rds")
pacman::p_load(apyramid)
```

So `pacman::p_load(apyramid)` is kept **verbatim** and costs no deviation. That same hidden
chunk is also where the book loads `linelist` — which is why deviation 1 lands there and not
in Chapter 2.

**`janitor` is the real gap.** It is never installed anywhere in the chapter, but
`janitor::round_half_up()` is called in a live chunk. Hence deviation 2.

**2. `linelist <- rio::import("linelist.xlsx", which = "Sheet1")` (issue #417) — costs no
deviation.** That chunk is `eval=FALSE` in the book, so rule 4 already commented it out. The
book never runs it either. It sits in the script as:

```r
# # This command uses the package "rio" and its function "import()" to import a dataset
# linelist <- rio::import("linelist.xlsx", which = "Sheet1")
```

Issue #417 is still open and unfixed on `main`. Nothing to do about it; the file genuinely
does not exist in the repo.

---

## Why Chapter 2 is entirely commented out

**All 15 of Chapter 2's code chunks are `eval=F` in the book.** Every one. So under rule 4 the
whole chapter is inert, and Chapter 2 contributes **zero executable lines** to the script. That
is not me stripping it — that is how the book ships it. Chapter 2 is a catalogue of
`get_data()` calls the reader is shown, not run.

The practical consequence: the dead `pak::pak("appliedepi/appliedepidata")` line is present but
commented, so nobody can run it by accident. Your working data load lives in Chapter 3, at the
exact point where the book actually executes its load.

If you would rather the working `linelist` line sat in Chapter 2 where the group expects to do
setup, say so and I'll move it. It would still be one deviation, just relocated.

## One thing I excluded

10 chunks in `basics.qmd` are `knitr::include_graphics(here::here("images", ...))` — the book
embedding its own screenshots while it renders. They are not analysis code and would error on
a missing image path. They are dropped. No other chunk was omitted.

---

## Run result (rule 6)

Run top to bottom on Linux, R 4.3.3, expression by expression.

**With `apyramid` and `janitor` present: 0 failures.**

```
==== TOTAL FAILURES: 0 ====
linelist: 5888 x 31 | date_onset: Date | age_cat: factor
```

Your `rio::import()` URL works — I ran it, it fetched over the network, and the object it
produces is the one the chapter needs. `age_cat` is a factor, which is what the age-pyramid and
`count()` chunks rely on.

`5888 x 31` rather than 30 because the book's hidden `include=FALSE` chunk adds an `age_group`
column with `cut()`. That chunk is in the script; it runs; it is verbatim.

**Before the stubs, the run showed 6 failures — all from the same two missing packages:**

```
LINE 119  ERROR: 'apyramid' is not installed
LINE 134  ERROR: could not find function "age_pyramid"
LINE 137  ERROR: could not find function "age_pyramid"
LINE 146  ERROR: could not find function "age_pyramid"
LINE 169  ERROR: 'janitor' is not installed
LINE 399  ERROR: there is no package called 'janitor'
```

No script defect — purely this machine's blocked network (below).

---

## Checked afterwards: the script's section order MATCHES the live site

A claim went round that the script's Chapter 3 sections are ordered differently from
epirhandbook.com because `main` reorganised the chapter. **That is not correct — do not tell
the group this.** `## Functions` precedes `## Packages` on both branches:

```
MAIN   chapters/basics.qmd :  290: ## Functions {#functions}   470: ## Packages {#packages}
MASTER new_pages/basics.qmd:  285: ## Functions {#functions}   465: ## Packages {#packages}
```

That matches the live site's own table of contents (3.6 Functions, then 3.7 Packages). So
`sqrt(49)` at script line 125 coming before `pacman::p_load(...)` at line 169 is exactly the
website's order. Nothing drifted. No reorganisation happened.

## Live site vs `main` for Chapter 3: 9 lines differ, one is code

```
+ aliases:  - /new_pages/basics.html          (front-matter, main only)
- transition_to_R.qmd  ->  transition_to_r.qmd  (a link)
- linelist <- rio::import(here::here("data", "case_linelists", "linelist_cleaned.rds"))
+ linelist <- appliedepidata::get_data(name = "linelist_cleaned_rds")
```

Both versions have the same 74 chunks in the same order.

**This improves the fidelity argument for deviation 1.** The live site's own hidden setup chunk
already uses `rio::import()` on `linelist_cleaned.rds`. Measured against the text the group is
actually reading, deviation 1 is not "swap out a package" at all — it is the same function,
from the same package the chapter teaches, on the same file, with a URL instead of a local
path. It is `main` that departs from the live site here, not the script.

## CONFIRMED ON WINDOWS (2026-07-31) — the untested items below are now settled

The script was run end to end on the target machine: **R 4.6.0, Windows 11 x64 (build 26100),
RStudio 2026.05.0+218.** It completed with no errors. All three previously-untested items are
confirmed working with the real packages:

| Was untested | Result on Windows |
|---|---|
| `apyramid::age_pyramid()` | **Works** — real `apyramid` 0.1.3, all three calls drew. Each emits `278 missing rows were removed (86 values from age_cat5 and 278 values from gender)` — expected, the linelist has missing gender/age. |
| `janitor::round_half_up()` | **Works** — real `janitor` 2.2.1 returns `3 4`, matching the book and my stub. |
| `pacman::p_load()` | **Works** — real `pacman` 0.5.1 resolved `rio, tidyverse, here, janitor`. |

Both FIX lines behaved:

* Line 118 (URL load) succeeded. It emits one warning,
  `Missing 'trust' will be set to FALSE by default for RDS in 2.0.0.` This is a **rio
  deprecation notice, not a problem** — Applied Epi document it themselves in `STAKEHOLDERS.md`
  as a known 2.7 change that appears on every page importing data.
* Line 169 (`janitor` added) succeeded.

**Every printed value matches the book**: `sqrt(49)`=7; `summary(linelist$age)` =
`0.00 6.00 13.00 16.07 23.00 84.00` with 86 NA; `table(gender, outcome)` = f 1227/953,
m 1228/950; `count(age_cat)` = 1095, 1095, 941, 743, 1073, 754, 95, 6, 86;
`round(c(2.5,3.5))`=`2 4` vs `round_half_up`=`3 4`;
`affirmative_str_search` = `1|Yes|YES|yes|y|Y|oui|Oui|Si`.

The `count(age_cat)` result also confirms the URL `.rds` preserves the factor levels in book
order, so the file behind deviation 1 is the right one.

### One piece of housekeeping

`session_info()` lists `appliedepidata 0.0.0.9008` flagged `R ── Package was removed from disk`.
That is wreckage from the failed install: the library still has a registration for a package
whose files are gone. Harmless to this script, but worth clearing so it stops appearing and
cannot half-load later:

```r
remove.packages("appliedepidata")
```

If that errors because the directory is already gone, it can be ignored.

## Previously untested (superseded by the Windows run above)

This environment blocks CRAN (`cloud.r-project.org`, HTTP 403 at the egress proxy), so three
things could not be exercised with the real packages:

1. **`apyramid::age_pyramid()` — UNTESTED.** I stubbed it to return `NULL` to prove no *other*
   line fails. The three `age_pyramid()` calls parse and execute, but **no pyramid was actually
   drawn.** If those calls have an argument problem, I would not have caught it.
2. **`janitor::round_half_up()` — UNTESTED with the real package.** My stub
   (`floor(x*p+0.5)/p`) reproduces the book's printed output exactly — `round(c(2.5,3.5))`
   gives `2 4` and `round_half_up(c(2.5,3.5))` gives `3 4` — so the line and its expected
   result are consistent, but that is my implementation, not theirs.
3. **`pacman` itself — UNTESTED.** Not installable here; I used a shim whose `p_load()` is
   `requireNamespace()` + `library()`. Faithful for already-installed packages, which is the
   only case this script hits. Real `p_load()` also *installs* missing packages, which is the
   behaviour your group depends on and which I could not verify.

**Windows-specific, all UNTESTED (I am on Linux):**

- **Everything in your Windows findings.** I did not re-test `pak` or
  `remotes::install_github()`; I took your results as given. Note this is consistent with what
  I found earlier — I could reproduce the encoding defect but not the fatal crash, and flagged
  the crash as unverified. Your Windows run is the confirmation.
- **`sessioninfo::session_info()` (line 14)** prints fine but will show different OS/locale.
- **Locale.** I ran under `C`; your users run a Windows codepage. Nothing in this script
  handles accented text, so I expect no difference — but the `rio::import()` of the `.rds` was
  only exercised under `C`.
- **The `install.packages(c("pacman", "rio", "tidyverse", "here", "apyramid", "janitor"))`
  line from your group message is not in the script** (rule 2 — no additions). The script
  assumes those are already installed. Keep sending it separately.
- **The source-compile prompt.** If R asks *"Do you want to install from sources the package
  which needs compilation?"*, they should answer **No**. With no Rtools, that prompt is the
  most likely thing to break a beginner's install of `apyramid` or `janitor`.

---

## Byte-level verification (2026-07-31)

Every code line in `epi_ch1_3.R` was machine-compared against the chunk bodies of
`chapters/editorial_style.qmd`, `chapters/data_used.qmd` and `chapters/basics.qmd` at
`1d94ba0`.

**Result: 0 lines differ from the book in content.**

The first build was verbatim in content but not in bytes: the generator called `.rstrip()`,
which silently removed **24 trailing-space characters across 18 book lines**, and trimmed
**4 blank lines** at chunk edges. That has been corrected. The script is now byte-for-byte
identical to the book, trailing whitespace included (51 lines now end in a space, as the book
does).

The complete and exhaustive difference between `epi_ch1_3.R` and the book is:

| # | Difference | Count |
|---|---|---|
| 1 | `linelist <- appliedepidata::get_data(name = "linelist_cleaned_rds")` replaced with the `rio::import()` URL | 1 line |
| 2 | `pacman::p_load(rio, tidyverse, here)` gains `, janitor` | 1 line |
| 3 | `# Chapter 1` / `# Chapter 2` / `# Chapter 3` markers | 3 lines added |
| 4 | `eval=F` chunk lines prefixed with `# ` (rule 4) | mechanical |
| 5 | one blank line inserted between chunks | structural |
| 6 | 10 `knitr::include_graphics()` chunks omitted | book-rendering only |

Nothing else. Re-verified running after the rebuild: 0 failures, `linelist` 5888 x 31.

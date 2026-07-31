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

## Untested — flag these

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

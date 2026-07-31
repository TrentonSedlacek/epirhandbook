# Applied Epi / Epi R Handbook — what changed in the July 2026 restructure

*Investigation date: 2026-07-31. Based on read-only clones of the three GitHub
repositories at their current `main`/default HEADs. Nothing in the Applied Epi
repositories was modified.*

Repositories and the exact commits this report is based on:

| Repo | Default branch | HEAD commit at investigation |
|---|---|---|
| `appliedepi/epirhandbook` (the Quarto book) | `main` | `1d94ba0a84b062ba72cb1205a1fb99bbc600caee` — *"Separate the two documents cleanly…"* (2026-07-26) |
| `appliedepi/appliedepidata` (the data package) | `main` | `87417354e4bba154bd89aba176d09fc8e3bfd2ef` — *merge PR #43* (2026-07-23), version `0.0.0.9008` |
| `appliedepi/epirhandbook_eng` (the "old" repo) | — | **Redirects to `appliedepi/epirhandbook`** — see Q7 |

---

## Plain-language summary (no R knowledge needed)

Applied Epi reorganised how the handbook gets its example data. **The old
instructions the live website still shows are now broken, and the new
instructions are finished but not yet officially "published," so right now there
is an awkward in-between gap.**

- **What broke.** The live site (epirhandbook.com) tells readers to install a
  package called `epirhandbook` and run `download_book()` / `get_data("all")`.
  In July the team **renamed** their old book repository to
  `appliedepi/epirhandbook` — so that name now points at the *book's source
  code*, not at an installable package — and the `download_book()` function no
  longer exists anywhere. So the setup code on the live site cannot run.
- **What replaced it.** Example data now lives in a separate package,
  **`appliedepidata`**. You install it and call `get_data(name = "…")` to pull a
  single dataset straight into R. This works today on Mac and Linux.
- **The catch for Windows users.** The new data package currently **fails to
  install on Windows** because one data file (world-map COVID data) has four
  accented country names (Côte d'Ivoire, Réunion, Curaçao, Saint Barthélemy)
  saved with a mislabeled text encoding. This bug is real and is **not yet
  reported** in the project's issue tracker. (I confirmed the mislabeled
  encoding directly; I could not reproduce the *fatal Windows install crash*
  itself on this Linux machine — see the flag under Q5.)
- **Is the new version "released"?** No. The migration is merged into the
  development branch (`main`) and auto-built to a `staging` site, but there is
  **no release, no version tag, and no `production` branch yet**, so the public
  site has not been switched over.

**Bottom line for a study group doing Chapters 1–3:** don't copy either the
live-site setup or wait for a "release." Chapters 1–3 essentially only need one
dataset (the cleaned case linelist). The most robust cross-platform options are
below under Q8. In short: Mac/Linux users can install `appliedepidata` and use
`get_data(name = "linelist_cleaned_rds")`; Windows users should download the
`.rds` file directly (the old download link still works) until the encoding bug
is fixed. Pinning an older book version does **not** fix this, because the
breakage is in the package/repo layer, not in the book's text.

---

## Q1 — Canonical Chapter 2 setup code on `main` right now

**File: `chapters/data_used.qmd`** (the download/data chapter; `new_pages/` was
renamed to `chapters/` in July 2026 — `new_pages/` no longer exists on `main`).
Last changed by commit `e4130b5e2a03aa7517de229e6e288f5196300bf2` — *"Make the
reader-facing data layer match how the handbook loads data"* (2026-07-25).

The exact code blocks a reader is told to run:

**Install the package**
```r
# install the latest version of the appliedepidata package
pak::pak("appliedepi/appliedepidata")
```

**Load a dataset directly** (the headline example)
```r
# load the cleaned case linelist directly into R
linelist <- appliedepidata::get_data(name = "linelist_cleaned_rds")
```

**Save a real file to disk** (for the import chapters)
```r
# write the raw linelist Excel file to your working directory
appliedepidata::save_data(name = "case_linelists_linelist_raw", path = getwd())
```

**Browse what's available**
```r
# browse datasets interactively
appliedepidata::search_data()

# list all dataset names programmatically
appliedepidata::list_data()
```

Key points:
- Install is now **`pak::pak("appliedepi/appliedepidata")`** — *not*
  `pacman::p_load_gh("appliedepi/epirhandbook")`.
- Data load is **`appliedepidata::get_data(name = "…")`** — always with the named
  `name =` argument.
- The page keeps an alias for the old URL: front-matter `aliases:
  - /new_pages/data_used.html`.
- Per-page dataset names are listed in the chapter (e.g. the cleaned linelist is
  `linelist_cleaned_rds`, the raw Excel is `case_linelists_linelist_raw`, the
  cleaning dictionary is `case_linelists_cleaning_dict`).

---

## Q2 — Is the live site behind `main`? Yes — merged to `main`, not promoted to production

**The migration is merged to `main`.** The relevant commits (all July 24–25) are
present on `main` (see Q3). `chapters/data_used.qmd` and 39 executing chapters
now use `appliedepidata`.

**`appliedepidata` exports exactly five functions** — confirmed in
`appliedepidata/NAMESPACE`:
```
export(create_desc)
export(get_data)
export(list_data)
export(save_data)
export(search_data)
```
There is **no `download_book`** and no all-in-one downloader, which is why the
live site's `pacman::p_load_gh("appliedepi/epirhandbook")` + `download_book()`
instructions cannot work anymore.

**The promotion model** (from `README.md`, "The three environments", lines
~109–120):
- `preview` — one build per pull request.
- `staging` — builds on every push to `main`.
- `production` — *"updated only when a release is published, by promoting
  staging… Cutting a release force-pushes the already-built `staging` artifact to
  `production`. Nothing is rebuilt at release time."*

**Evidence that promotion has NOT happened:**
- `git ls-remote --tags origin` on `appliedepi/epirhandbook` returns **no tags**.
  A GitHub release requires a tag, so **there are no releases**.
- `git ls-remote --heads origin` lists `main`, `master`, `staging`,
  `deploy-preview` (plus old `handbook_v*` branches) but **no `production`
  branch**.

So the appliedepidata migration is **on `main` and continuously built to
`staging`, but has not been promoted to `production`** — consistent with the
live site still showing the old `download_book()` instructions.

**`docker-images.yml`** (the chapter → image manifest) confirms the 2.8 build
architecture: `registry: ghcr.io/appliedepi/aedockerpublic`, and 49 chapter rows
mapping to **six group images** at tag `:2.8`
(`epirhandbook-basics`, `-data-management`, `-analysis`, `-data-viz`,
`-reports`, `-miscellaneous`). `index`, `data_used`, `basics`, `importing`, etc.
all use `epirhandbook-basics:2.8`.

---

## Q3 — What each raubreywhite commit (July 24–25) actually changed for a reader

All authored by **Richard Aubrey White**. Reader impact noted per commit.

### `8759afb4ccb5e0475b9a71982655a8ada794eea6` — "Rename new_pages/ to chapters/, with working aliases for every old URL" (2026-07-24 19:24)
- `git mv new_pages chapters` (654 tracked files); fixed a casing bug
  (`transition_to_R.qmd` → `transition_to_r.qmd`).
- Every chapter `.qmd` (450 files = 50 stems × 9 languages) got a generated
  `aliases:` front-matter entry naming its **old `/new_pages/…` URL**, so old
  bookmarks keep redirecting via Quarto's alias mechanism.
- **Reader impact:** URLs change from `…/new_pages/x.html` to `…/chapters/x.html`,
  but old links still resolve. 680 files, +2297/−302.

### `d0fb59131098f24da8f28088b0984e4a17e55074` — "Map every handbook data file and read site onto appliedepidata" (2026-07-24 23:14)
- Added inventory files: `utils/data-map.tsv` (~124 rows mapping each `data/…`
  file to its `appliedepidata` dataset name + disposition) and
  `utils/data-callsites.tsv` (146 call sites). Moved `gis`/`epidemic_models`
  translations into `_excluded/`.
- **Reader impact:** none directly — this is the planning/mapping step. 20 files,
  +271.

### `dbaa04957c6cd5f128dff3014c9dd62811a274b2` — "Load data from appliedepidata in the chapters that execute" (2026-07-25 01:11)
- **39 executing chapters** replace `rio::import(here::here("data", …))` with
  `appliedepidata::get_data(name = …)`. Example (`time_series.qmd`):
  `counts <- rio::import(here::here("data","time_series","campylobacter_germany.xlsx"))`
  → `counts <- appliedepidata::get_data(name = "campylobacter_germany")`.
  Sites that need a real file on disk use `save_data()` + `utils::unzip()`.
- Added `utils/check-data-equivalence.R` proving object identity for every
  rewritten site.
- **Reader impact:** the code that *runs* to build the book now pulls from the
  package. In this commit the `eval=F` snippets and HTML download buttons readers
  copy were deliberately left unchanged (they're migrated separately). 40 files,
  +286/−86. Chapters intentionally left on `data/`: `data_table`, `r_projects`,
  `importing`, `directories`.

### `2b0750fb79df6c80fa2c3ddf3e73f551658abeb7` — "Propagate the appliedepidata migration to the 7 translated languages" (2026-07-25 19:44)
- Applies the same `get_data`/`save_data` changes to es/fr/jp/pt/ru/tr/vn and
  converts the download-button prose to `get_data()` sentences.
- **Reader impact:** non-English readers get the same runnable code. The prose was
  **machine-written** and still needs a native-speaker pass (see
  `TRANSLATION-BACKLOG.md`, "Unit D"). 286 files, +2470/−1926.

### `de8f1597ec4198213cae4761435b236dce1d4654` — "Stage covid_example_data for removal" (2026-07-25 20:00)
- Moves 12 MB / 9 files (`covid_example_data.xlsx` + the `FultonCounty`
  shapefile) from `data/` into `datatoremove/`; the commit message states they
  are "referenced by nothing" and are the only `data/` files with no
  `appliedepidata` counterpart. `datatoremove/README.md` records the reasoning.
- **Reader impact:** none — this data is unused by any rendered chapter. 10 files,
  +33.

---

## Q4 — STAKEHOLDERS.md and TRANSLATION-BACKLOG.md: what readers should expect

### `STAKEHOLDERS.md` (2.7 → 2.8 section)
- **Executive line for readers:** *"Very little, deliberately. Chapters render
  the same content."* The visible change is that code shown on the page moves
  from reading a `data/` folder readers never had, to fetching from
  `appliedepidata` — *"Code shown in the handbook is now code a reader can
  actually run."* Download links are replaced by the package's accessors.
- **Corrections-after-review section** is important for a study group: it
  explicitly records that three call forms were **wrong** and would error if run
  — a positional `get_data("...")`, a `get_data(file = )`, and a
  `get_data("all")` — noting *"All three are the retired package's interface;
  **appliedepidata** takes `name =`."* (This directly matches Q6.)
- `gis` and `epidemic_models` chapters **remain cut** (they can't render in
  hermetic CI). Their URLs stop resolving until they return.

### `TRANSLATION-BACKLOG.md`
- Holds only *open* prose work. The seven translated `data_used.<lang>.qmd` pages
  are marked **COMPLETE, do not redo** (signed off by review 2026-07-25).
- Still-open items are stale *prose* (not code): `standardization` ("two ways" /
  `dsr`), `survey_analysis` ("four different options" / `sitrep`),
  `ggplot_basics` ("assigned twice"). *"This is not a build blocker. All 49
  chapters render. The code is correct. Only the explanation is out of date."*
- The migration prose pushed into the 7 translations is machine-written and flagged
  for native-speaker review.

**Net for readers:** content and computed results are essentially unchanged; the
only reader-visible change is that on-page code now uses `appliedepidata`, and
some translated *explanatory prose* still describes old code.

---

## Q5 — appliedepidata encoding bug: CONFIRMED, and NOT tracked in the open issues

**Confirmed by looping `load()` over all 100 `data/*.rda` files** (R 4.3.3 on
Linux). Only **one** file throws an encoding error:

```
gis_covid_incidence.rda -> input string 'Saint Barth<c3><a9>lemy' cannot be
translated from 'US-ASCII' to UTF-8, but is valid UTF-8
```

Inspecting the object (`data.frame`, 238×3), column **`Name`** has 4 non-ASCII
values, each holding valid UTF-8 bytes but tagged with encoding `"unknown"`
(i.e. native/US-ASCII, **not** declared UTF-8):

| Value | Bytes | `Encoding()` |
|---|---|---|
| `Côte d'Ivoire` | `43 c3 b4 74 65 20 64 e2 80 99 …` | unknown |
| `Réunion` | `52 c3 a9 75 6e 69 6f 6e` | unknown |
| `Curaçao` | `43 75 72 61 c3 a7 61 6f` | unknown |
| `Saint Barthélemy` | `53 61 69 6e 74 20 42 61 72 74 68 c3 a9 6c 65 6d 79` | unknown |

- **`DESCRIPTION` has `LazyData: true`** (line 36) — confirmed.
- **Introduced by** commit `dbb613c95e6f8d363a65a5774d5900f2fd5e61a0` — *"[epirh]
  Adding gis_ datasets"* (author `Lfquezada`, 2026-07-22). (`git log` on
  `data/gis_covid_incidence.rda` shows this is its only commit.) The `DESCRIPTION`
  file's `LazyData: true` predates this and has been present for years.
- Three other files (`feveriosis_recent_es/fr/pt.rda`) emit only the *benign*
  warning "strings not representable in native encoding will be translated to
  UTF-8" — those are correctly tagged and are **not** the bug.

**Is it tracked in the 14 open issues?** No. The full open-issue list on
`appliedepi/appliedepidata` (14, matching your count) is:

```
#42 Linelists with no data [0 bytes]
#33 extended data formats with arrow
#25 Fulton data license needs clarity
#24 course data conundrum
#22 epirhanbdook linelist_cleaned versions        [bug, documentation]
#21 stegen data documentation
#18 licensing                                      [bug, documentation]
#17 Update links to download the offline copy of the EpiRhandbook
#13 Change gender to sex in mpox data
#8  data dictionary functions
#6  fix unit tests                                 [bug]
#5  extend create_desc function to hole of description file
#4  add tests for search_data                      [help wanted]
#1  Custom {roxygen} tags
```
None mention encoding, UTF-8, US-ASCII, embedded nul, Windows, LazyData,
lazy-load, `gis_covid_incidence`, or accented characters (titles and bodies
scanned). **This bug is currently unreported.**

> ⚠️ **FLAG — partially verified.** I confirmed the two *necessary conditions*
> for your reported failure: the mislabeled encoding (UTF-8 bytes tagged
> native/US-ASCII) **and** `LazyData: true`. I also reproduced the `load()`
> warning. I could **not** reproduce the *fatal Windows install crash*
> ("embedded nul in string", install dies) on this environment: building the
> lazy-load database with `tools:::makeLazyLoadDB()` **succeeded even under
> `LC_ALL=C`** (a non-UTF-8 locale) on Linux/R 4.3.3. The fatal outcome is
> Windows/codepage-specific and consistent with the data, but is **unverified
> here**. Treat "install dies on Windows" as highly plausible but not
> machine-confirmed by me.

---

## Q6 — get_data() / list_data() exact working signatures

From `appliedepidata/R/get_data.R`, `R/list_data.R`, `R/lookup_data.R` and
`NAMESPACE`:

**Signature (no `file` argument exists):**
```r
get_data(name = NULL, language = NULL, group_identifier = NULL,
         usage = NULL, unique_identifier = NULL, assign = FALSE)
```
`get_data(name = …)` filters an internal lookup table
(`inst/extdata/tableoftables.xlsx`, 101 dataset names) by exact `name` match.

**Your three cases — confirmed / corrected:**

| Call | Result | Why |
|---|---|---|
| `get_data("all")` | ❌ **FAILS** | positional → `name = "all"`; no dataset named "all" → *"No datasets found matching search-criteria."* |
| `get_data(file = "linelist_cleaned.rds")` | ❌ **FAILS** | there is no `file` parameter → R error *"unused argument (file = …)"* |
| `get_data("linelist_cleaned")` | ✅ works | positional `name = "linelist_cleaned"` is a valid name |
| `get_data(name = "linelist_cleaned_rds")` | ✅ works | this is the **handbook's canonical call** (Chapter 2) |

**Correction to your finding:** it's not that *only* `get_data("linelist_cleaned")`
works — `get_data(name = "linelist_cleaned_rds")` also works, and it is the one
the handbook actually tells you to use. **But the two return different objects:**

- `get_data(name = "linelist_cleaned_rds")` → 5,888 × 30, dates as **POSIXct**,
  `age_cat`/`age_cat5` as **factors** (byte-identical to
  `case_linelists_linelist_cleaned_rds`). ← matches the handbook.
- `get_data("linelist_cleaned")` → also 5,888 × 30 with the same column *names*,
  but dates are plain **Date** and `age_cat`/`age_cat5` are **character**. It is a
  subtly different object (the Ebola-Sierra-Leone base dataset), and some
  handbook code that expects factors/datetimes may behave differently.

**Recommendation:** for following Chapters 1–3 use
`get_data(name = "linelist_cleaned_rds")`, not `get_data("linelist_cleaned")`.

**`list_data()` signature:** `list_data(package_name = "appliedepidata")` →
returns a data frame of `directory`, `name`, `extension`, `duplicate`.
`search_data()` launches an interactive Shiny browser.

---

## Q7 — Do the old one-by-one raw-download URLs still resolve? Yes (today), via a rename redirect

The old book gives per-file links like:
```
https://github.com/appliedepi/epirhandbook_eng/raw/master/data/case_linelists/linelist_cleaned.rds
```

- **`epirhandbook_eng` is NOT archived and NOT deleted — it was renamed.** The old
  repo `appliedepi/epirhandbook_eng` was renamed to **`appliedepi/epirhandbook`**
  on 2026-07-24 (commit `34d52b2e647fcdae825ba5b33573de7565820f4c`, *"Update repo
  references after the rename to appliedepi/epirhandbook"*). GitHub 301-redirects
  the old name to the new repo. Proven two ways:
  - Cloning `appliedepi/epirhandbook_eng` returns the *new* repo (same HEAD
    `1d94ba0…` as `appliedepi/epirhandbook`).
  - The GitHub API for `…/repos/appliedepi/epirhandbook_eng` returns
    `"full_name": "appliedepi/epirhandbook"`, `"archived": false`,
    `"disabled": false`, `"default_branch": "main"`.
- **The `master` branch still exists** on the renamed repo and still contains
  `data/case_linelists/linelist_cleaned.rds` (290,215 bytes). A direct fetch of
  `https://raw.githubusercontent.com/appliedepi/epirhandbook_eng/master/data/case_linelists/linelist_cleaned.rds`
  returned **HTTP 200**. So the old links **still work today**. (The `data/`
  folder also still exists on `main`.)
- **The same files now live in `appliedepidata`** (e.g. `linelist_cleaned`,
  `linelist_cleaned_rds`, `case_linelists_linelist_*`, standardization CSVs,
  etc. — see `NEWS.md` for the added-dataset list).

> ⚠️ **FLAG — resolves now, but fragile.** These URLs depend on (a) GitHub keeping
> the `epirhandbook_eng → epirhandbook` rename redirect alive, and (b) the
> `master` branch surviving. The clear direction of travel is that data is being
> moved out of the book repo into `appliedepidata` (and `covid_example_data` was
> already staged into `datatoremove/` on `main`). I found **no explicit schedule
> to delete `master`**, but I would not rely on these raw URLs long-term. I could
> not fetch `github.com/.../raw/...` directly from this environment (the agent
> proxy blocks `github.com`, returning 403); the HTTP-200 confirmation is from
> `raw.githubusercontent.com`, which is the CDN those links redirect to.

---

## Q8 — Churn forecast (46 open issues, 14 open PRs on appliedepi/epirhandbook)

Open counts confirmed via the GitHub search API: **46 open issues, 14 open PRs.**
(I enumerated all 14 PRs and 44 of the 46 issues; the 2 unretrieved issues are in
the older `#128–#189` mid-range and none of the recent or data-download issues
are among them — see flag below.)

**Open issues touching Chapters 1–3 / basics / data-download:**

| # | Title | Relevance |
|---|---|---|
| **#417** | *Missing dataset in Chapter 3: R Basics* | **Direct** — Chapter 3 (basics) |
| **#198** | *Data download chapter - {epirhandbook} package to change names* `[for next revision]` | **Direct** — this issue *is* the Chapter-2 data-download migration |
| **#200** | *Update mechanism for download of offline handbook* | **Direct** — Chapter 2 offline-download mechanism |
| **#412** | *Update how we get people to receive code or data or servcies* | Data/code delivery mechanism |
| **#423** | *alternative workflows to fix the build and versioning kerfuffle* `[enhancement, for next revision]` | Build/versioning instability (relevant to pinning) |
| #151 | *chapter 19 data set linelist_cleaned.rds — suggestions…* | Uses the shared cleaned linelist (Ch 19, not 1–3) |
| #119 | *epirhandbook_eng updates nov2022* | Old-repo housekeeping |
| #113 | *Suggestion of Introduction to R book in Portuguese* | Tangential (intro-to-R) |

**Open PRs of interest** (14 total): `#429 Fix broken links in index.qmd`,
`#430 Fix broken links in Spanish version of index` (index/landing page);
`#428 fix standardization import examples` (standardization, not Ch 1–3);
`#431/#432` Spanish fixes; and stale v2.5 translation merges `#190–#196`
(these target the old `master` branch, not `main`). **No open PR rewrites the
basics or data-download chapter content.**

### Recommendation: neither "pin an old release" nor "follow the live site" — take the direct-download / package route for Ch 1–3

- **There is no released 2.8 to "move onto."** The migration is unreleased (on
  `main`/`staging` only; no tags, no releases, no `production` branch — see Q2).
- **The live-site (old) setup is genuinely broken now** by the July restructure:
  `p_load_gh("appliedepi/epirhandbook")` now points at the *renamed book repo*
  (not an installable package), and `download_book()` no longer exists. That's
  the breakage you observed — and it's independent of which book version you read.
- **Pinning an older *book* version does not help**, because the failure is in
  the external package/repo layer (the rename + the removed `epirhandbook`
  package), not in the book's prose. An older book still tells you to install a
  package that no longer exists at that name.
- **The new setup works on Mac/Linux today** but **`appliedepidata` currently
  fails to install on Windows** (the untracked `gis_covid_incidence` encoding
  bug, Q5).

**Practical guidance for the study group (Chapters 1–3 only really need the
cleaned case linelist):**
1. **Mac/Linux:** `pak::pak("appliedepi/appliedepidata")`, then
   `linelist <- appliedepidata::get_data(name = "linelist_cleaned_rds")`.
2. **Windows (until the encoding bug is fixed):** download the file directly —
   the old link still resolves:
   `https://github.com/appliedepi/epirhandbook_eng/raw/master/data/case_linelists/linelist_cleaned.rds`
   — then `linelist <- rio::import("linelist_cleaned.rds")`. (A Windows user
   could alternatively install with lazy-data disabled, but direct download is
   simpler and avoids the bug entirely.)
3. **Don't** paste the live site's `download_book()` / `get_data("all")` /
   `p_load_gh(...)` lines — they will not run.
4. Watch issues **#198, #200, #412, #423** and the eventual first tagged release
   as the signal that the setup has stabilised and the live site has been
   switched over.

> ⚠️ **FLAG — issue census completeness.** I confirmed the exact totals (46
> issues, 14 PRs) via the search API and listed all 14 PRs and 44 issues. Two
> older mid-range issues (roughly the `#128–#189` band, none from the recent
> 2026 activity) could not be pulled because the fetch tool truncates long JSON
> and the API host was intermittently rate-limited. Based on the surrounding
> numbers, the gap contains older "for next revision" items, not
> basics/data-download content, so it does not change the recommendation.

---

## What I could NOT verify (consolidated)

1. **The fatal Windows install crash** ("embedded nul in string") — I confirmed
   the root-cause encoding defect and `LazyData: true`, and reproduced the
   `load()` warning, but `makeLazyLoadDB()` succeeded even under `LC_ALL=C` on
   Linux/R 4.3.3. The Windows-fatal outcome is plausible and consistent but not
   reproduced here.
2. **The live epirhandbook.com pages** — the agent network proxy could not reach
   `epirhandbook.com` (HTTP 000) or `github.com` HTML/raw (403). My Q2 "not
   promoted" conclusion rests on the absence of tags/releases and of a
   `production` branch, plus the README's documented promotion model — not on a
   direct read of the live page. The old setup code quoted is from the repo's
   `master` branch (`new_pages/data_used.qmd`), which mirrors the old published
   content.
3. **2 of 46 epirhandbook issues** (older mid-range) — see the Q8 flag.

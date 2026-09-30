/* Made-up data for this demo, don't reuse it thinking it's real. */

/* First sheet: one row per county, one column per week. That is wide. */
proc import datafile="K:/R Study Group/Trenton/pivot_demo_data.xlsx" out=wide dbms=xlsx replace;
    sheet="weekly_wide";
run;

proc print data=wide;
run;

/* PROC TRANSPOSE is pivot_longer. BY needs the data sorted first. */
proc sort data=wide;
    by county region;
run;

proc transpose data=wide out=long(rename=(col1=cases)) name=week;
    by county region;
    var wk31-wk36;
run;

proc print data=long (obs=12);
run;

/* Same numbers. 8 rows became 48. */

/* One series per county, straight from the long table */
proc sgplot data=long;
    series x=week y=cases / group=county;
run;

/* An ID statement turns it back into wide. Same as pivot_wider. */
proc transpose data=long out=wide_again(drop=_name_);
    by county region;
    id week;
    var cases;
run;

proc print data=wide_again;
run;

/* CLASS is group_by. Region totals by week, then widen for the report. */
proc means data=long sum noprint nway;
    class region week;
    var cases;
    output out=region_week(drop=_type_ _freq_) sum=cases;
run;

proc transpose data=region_week out=region_wide(drop=_name_);
    by region;
    id week;
    var cases;
run;

proc print data=region_wide;
run;

/* Second sheet: a line list, one row per case */
proc import datafile="K:/R Study Group/Trenton/pivot_demo_data.xlsx" out=linelist dbms=xlsx replace;
    sheet="linelist";
run;

/* The everyday one. PROC FREQ gives the crosstab in one step. In R it is count then pivot_wider. */
proc freq data=linelist;
    tables county*sex / norow nocol nopercent;
run;

/* Third sheet: an Excel export where the county is only written on the first row of each block */
proc import datafile="K:/R Study Group/Trenton/pivot_demo_data.xlsx" out=export dbms=xlsx replace;
    sheet="export";
run;

proc print data=export;
run;

/* RETAIN is fill */
data export_filled;
    length county_filled $ 20;
    retain county_filled;
    set export;
    if not missing(county) then county_filled = county;
    drop county;
    rename county_filled = county;
run;

proc print data=export_filled;
run;

#!/usr/bin/env raku

use lib '../lib';

use Dan;
use Dan::Polars;

my \df = DataFrame.new;
df.read_csv("../dan/src/iris.csv");

#df.column("sepal.length").head;

my $se = df.column("sepal.length");
#say $se.get-data;

$se = df.column("variety");
my @da = $se.get-data;
#say @da[0];
#say @da[57];

#$se.flood;
#say $se.data;

#df.select([col("sepal.length"), col("variety")]).head;
#df.groupby(["variety"]).agg([col("petal.length").sum]).head;

my $expr;
$expr  = col("petal.length");
$expr .= sum;
#df.groupby(["variety"]).agg([$expr]).head;

#df.groupby(["variety"]).agg([col("petal.length").sum,col("sepal.length").sum]).head;

my @exprs;
@exprs.push: col("petal.length").sum;
#@exprs.push: col("sepal.length").mean;
#@exprs.push: col("sepal.length").min;
#@exprs.push: col("sepal.length").max;
#@exprs.push: col("sepal.length").first;
#@exprs.push: col("sepal.length").last;
#@exprs.push: col("sepal.length").unique;
#@exprs.push: col("sepal.length").count;
#@exprs.push: col("sepal.length").forward_fill;
#@exprs.push: col("sepal.length").backward_fill;
@exprs.push: col("sepal.length").reverse;
@exprs.push: col("sepal.length").std.alias("std");
#@exprs.push: col("sepal.length").var;
#df.groupby(["variety"]).agg(@exprs).head;

#df.select([col("*").exclude(["sepal.width"])]).head;
#df.select([col("*").sum]).head;

df.select([
    col("sepal.length"),
    col("petal.length"),
    (col("petal.length") + (col("sepal.length"))).alias("add"),
    (col("petal.length") - (col("sepal.length"))).alias("sub"),
    (col("petal.length") * (col("sepal.length"))).alias("mul"),
    (col("petal.length") / (col("sepal.length"))).alias("div"),
    (col("petal.length") % (col("sepal.length"))).alias("mod"),
    (col("petal.length") div (col("sepal.length"))).alias("floordiv"),
]).head;

df.select([
    col("sepal.length"),
    col("petal.length"),
    (col("petal.length") + 7).alias("add7"),
    (7 - col("petal.length")).alias("sub7"),
    (col("petal.length") * 2.2).alias("mul"),
    (2.2 / (col("sepal.length"))).alias("div"),
    (col("sepal.length") % 2).alias("mod"),
    (col("sepal.length") div 0.1).alias("floordiv"),
]).head;

df.with_column($se.rename("newcol")).head;

df.with_columns([col("variety").alias("newnew")]).head;
die;

#`[notes
df.with_column takes a Series and adds it to the df
lf.with_column takes an Expr (eg. col("variety").xx)
... so .lf.with_column is just a nicety
lf.with_columns takes an exprvec (eg. [col("variety").xx, col("sepal.length").yy]
use alias to control in place vs. new col
#]




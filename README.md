 *WORK IN PROGRESS*

# raku Dan::Polars

This is a new module to bind raku [Dan](https://github.com/p6steve/raku-Dan) to Polars via Raku NativeCall / Rust FFI.

The following broad capabilities are envisaged:
- Polars objects (Series, DataFrames) as shadows
- Polars object methods (ie. auto-generate & export, access via .fallback)
- Polars lazy APIs via raku lazy semantics
- handle map & apply (with raku callbacks)
- raku Dan features (accessors, dtypes)
- broad datatype support & mapping
- concurrency

The ultimate aim is to emulate the examples in the [Polars User Guide](https://pola-rs.github.io/polars-book/user-guide/dsl/expressions.html)

## All is strictly pre-release and only if you know what you are doing!!!
 
## Installation
 
Use [p6steve/raku-Dockerfiles/raku-dan-polars/stage-2](https://github.com/p6steve/raku-Dockerfiles/blob/main/raku-dan-polars/stage-2/Dockerfile), Docker Hub images are named something like [p6steve/raku-dan:polars-2022.02-arm64](hub.docker.com) - choose arm64 / amd64 for your machine.
 
deploy Dan::Polars like this ...
```
docker run -it p6steve/raku-dan:polars-2022.02-arm64 #(or -amd64)
zef install Dan;
git clone https://github.com/p6steve/raku-Dan-Polars.git
cd raku-Dan-Polars
cd dan
cargo build
cd ../bin
./synopsis-dan-polars4.raku #(or 1,2,3)
```

## Steve's random notes

Notes from Polars Discord

potter420 — 05/01/2022
https://raku-advent.blog/2019/12/13/day-4-a-little-rr/
Raku Advent Calendar
tmtvl
Day 13 – A Little R&R
A Little R&R Introduction Raku is a really nice language. Versatile, expressive, fast, dwimmy. The only problem I sometimes have with it is that it can be a little slow. Fortunately that can ea…

[20:09]
according to this blog, one can make a FFI binding between Raku and Rust
[20:11]
But, @ritchie46  prolly too busy keeping rust and python lib of polars updated. So additional external effort may be needed

ritchie46 — Yesterday at 14:56
Yeap.. 😅
[14:59]
can an FFI capable languge be bound to polars that way reasonably effectively and is there any example/documentation/cheat sheet/advice I can use to avoid reinventing wheels

Yes, definitely look at the python implementation as the reference implementation. The interop goes very well. There are also bindings to nodejs which also may be helpful. The work of @universalmind303 proves that the port is definitely possible and a lot less work than starting from scratch (Trust me, I've got a lot of time in this ;))

Some other notes:
https://news.ycombinator.com/item?id=27051573#27053712
https://www.youtube.com/watch?v=OtIU7HsHCE8&t=2731s
https://arrow.apache.org


20:37	discord-raku-bot	<Anton Antonov> @japhb I got a CBOR file -- how do I read it in Raku? Using `slurp` with ":bin" ?
20:49	discord-raku-bot	<Anton Antonov> @japhp Yeah, I got it working. And, yes, the CBOR utilization gives me the fastest ingestion of ≈700MB CSV file in Raku.

------

## TODOs

1. [ ] Dan API
   - [x] Dan::Series base methods
   - [x] Dan::DataFrame base methods
   - [ ] Dan Accessors
   - [ ] Dan Slice / Concat
   
2. [ ] Polars Shadow
   - [x] Polars::Series base methods
   - [x] Polars::DataFrame base methods
   - [x] .push/.pull
   
3. [ ] Exprs (synopsis..2.raku)
     - [x] unary exprs
--
- lazy only
- pure only
- auto prepare / collect
- opaque only
-- no chunk controls
-- no chunk unpack (i32 ...)
-- no datetime (in v1)
--
-- v2
- expr arity > 1
- clone (then retest h2o-par)
- reset @data after load rc (also to Pandas)
- map & apply
- operators
- datetime
- better value return
- serde
- strip / fold Index
Snagging
- splice & concat - s1
- sort & filter - s3
- cross join


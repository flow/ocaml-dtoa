v0.3.3 2023-02-25
--------------------------

- Fixed `assert` on very long outputs (thanks @nevor!)
- Support MSVC (thanks @nojb!)
- Fixed tests under ocaml 5


v0.3.2 2019-06-16
--------------------------

Upgrade jbuilder to dune


v0.3.1 2017-12-06
--------------------------

Install `js_of_ocaml` runtime stub via opam, and link it up automatically in `META`


v0.3.0 2017-09-26
--------------------------

Switch to `jbuilder`


v0.2.0 2017-09-26
--------------------------

- Relicensed under MIT (see https://code.facebook.com/posts/300798627056246)
- Ported `Bignum` from double-conversion to replace printf fallback when grisu3 fails
- Added `js_of_ocaml` stubs so that code using this library can compile to JS


v0.1.0 2017-04-03
--------------------------

First release.

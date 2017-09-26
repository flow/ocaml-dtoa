#!/usr/bin/env ocaml
#use "topfind"
#require "topkg"
#require "ocb-stubblr.topkg"
open Topkg

let build = Pkg.build ~cmd:Ocb_stubblr_topkg.cmd ()
let opams =
  let lint_deps_excluding = Some ["ocb-stubblr"; "ounit"; "oUnit"] in
  [Pkg.opam_file ~lint_deps_excluding "dtoa.opam"]

let distrib = Pkg.distrib
  ~uri:"https://github.com/flowtype/ocaml-dtoa/archive/$(VERSION_NUM).tar.gz"
  ()

let () =
  Pkg.describe "dtoa"
  ~build ~opams ~distrib
  ~licenses:[ Pkg.std_file "LICENSE" ]
  @@ fun c ->
  Ok [ Pkg.mllib "src/dtoa.mllib";
       Pkg.clib "src/libdtoa.clib";
       Pkg.test "test/test"; ]

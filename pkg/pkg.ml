#!/usr/bin/env ocaml
#use "topfind"
#require "topkg"
open Topkg

let () =
  Pkg.describe "dtoa"
  ~licenses:[ Pkg.std_file "LICENSE"; Pkg.std_file "PATENTS" ]
  @@ fun c ->
  Ok [ Pkg.mllib "src/dtoa.mllib";
       Pkg.test "test/test"; ]

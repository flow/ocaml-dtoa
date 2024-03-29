(**
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *)

open OUnit2
open Dtoa

let eq ctxt = assert_equal ~ctxt ~printer:(fun x -> x)

let test_sanity ctxt =
  let eq = eq ctxt in
  eq "1" (ecma_string_of_float 1.);
  eq "0" (ecma_string_of_float 0.);
  eq "-1" (ecma_string_of_float (-1.))

let test_big_and_small ctxt =
  let eq = eq ctxt in

  eq "0.30000000000000004" (ecma_string_of_float (0.1 +. 0.2));
  eq "2592000000" (ecma_string_of_float 2.592e+09);
  eq "2592000000" (ecma_string_of_float 2592000000.);
  eq "0.9999999999999999" (ecma_string_of_float 0.99999999999999994);
  eq "1" (ecma_string_of_float 0.99999999999999995);
  eq "100" (ecma_string_of_float 100.);
  eq "1000" (ecma_string_of_float 1000.);

  eq "0.000001" (ecma_string_of_float 0.000001);
  eq "0.999999" (ecma_string_of_float 0.999999);
  eq "1e-7" (ecma_string_of_float 0.0000001);
  eq "0.9999999" (ecma_string_of_float 0.9999999);
  eq "0.000001" (ecma_string_of_float 1.0e-6);
  eq "1e-7" (ecma_string_of_float 0.1e-6);
  eq "1e-7" (ecma_string_of_float 1.0e-7);
  eq "111111111111111110000" (ecma_string_of_float 111111111111111111111.0);
  eq "100000000000000000000" (ecma_string_of_float 100000000000000000000.0);
  eq "1.1111111111111111e+21" (ecma_string_of_float 1111111111111111111111.0);
  eq "1e+21" (ecma_string_of_float 1000000000000000000000.0);
  eq "4294967272" (ecma_string_of_float 4294967272.0);
  eq "4.185580496821357e+298" (ecma_string_of_float 4.1855804968213567e298);
  eq "0" (ecma_string_of_float 56e-13214125)

let test_edge_cases ctxt =
  let eq = eq ctxt in

  eq "5e-324" (ecma_string_of_float 5e-324);
  eq "1.7976931348623157e+308" (ecma_string_of_float 1.7976931348623157e308);
  eq "NaN" (ecma_string_of_float nan);
  eq "Infinity" (ecma_string_of_float infinity);
  eq "-Infinity" (ecma_string_of_float neg_infinity);

  eq "-0.0000013475801431957922"
    (ecma_string_of_float (-0.0000013475801431957922));

  (* grisu3 fails, uses bignum *)
  eq "0.000035689" (ecma_string_of_float 0.000035689)

let test_round_trip ctxt =
  let x = ecma_string_of_float epsilon_float |> float_of_string in
  assert_equal ~ctxt epsilon_float x

let tests =
  "ecma_string_of_float"
  >::: [
         "sanity" >:: test_sanity;
         "big_and_small" >:: test_big_and_small;
         "edge_cases" >:: test_edge_cases;
         "round_trip" >:: test_round_trip;
       ]

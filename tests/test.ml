(**
 * Copyright (c) 2017-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 *)

open OUnit2

let tests = "dtoa" >::: [
  Ecma_test.tests;
  Shortest_test.tests;
  G_fmt_test.tests;
]

let () = run_test_tt_main tests

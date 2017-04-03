/**
 * Copyright (c) 2017-present, Facebook, Inc.
 * Copyright (c) 2010, the V8 project authors.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#ifndef OCAML_DTOA_CACHED_POWERS_H_
#define OCAML_DTOA_CACHED_POWERS_H_

#include "diy_fp.h"

void cached_power_for_binary_exponent_range(
    int min_exponent,
    int max_exponent,
    diy_fp* power,
    int* decimal_exponent);

#endif  // OCAML_DTOA_CACHED_POWERS_H_

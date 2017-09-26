/**
 * Copyright (c) 2017-present, Facebook, Inc.
 * Copyright (c) 2010, the V8 project authors.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#ifndef OCAML_DTOA_UTILS_H_
#define OCAML_DTOA_UTILS_H_

#include <stdlib.h>

#include <assert.h>
#ifndef ASSERT
#define ASSERT(condition)         \
    assert(condition);
#endif

// The following macro works on both 32 and 64-bit platforms.
// Usage: instead of writing 0x1234567890123456
//      write UINT64_2PART_C(0x12345678,90123456);
#define UINT64_2PART_C(a, b) (((uint64_t)(a) << 32) + 0x##b##u)

// The expression ARRAY_SIZE(a) is a compile-time constant of type
// size_t which represents the number of elements of the given
// array. You should only use ARRAY_SIZE on statically allocated
// arrays.
#ifndef ARRAY_SIZE
#define ARRAY_SIZE(a)                                   \
  ((sizeof(a) / sizeof(*(a))) /                         \
  (size_t)(!(sizeof(a) % sizeof(*(a)))))
#endif

#endif  // OCAML_DTOA_UTILS_H_

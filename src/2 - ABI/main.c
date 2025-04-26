#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <assert.h>

#include "../test-utils.h"
#include "ABI.h"

int main() {
	/* Acá pueden realizar sus propias pruebas */
  uint32_t res;
  product_2_f(&res, 3, 0.3333333333);
  assert(res == 1);
	return 0;
}

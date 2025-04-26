#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <assert.h>

#include "../test-utils.h"
#include "Estructuras.h"

int main() {
	/* Acá pueden realizar sus propias pruebas */
  uint32_t arr[] = {1,2,3};
  packed_nodo_t nodo1;
  packed_nodo_t nodo2;
  nodo1.next = &nodo2;
  nodo1.arreglo = arr;
  nodo1.categoria = 1;
  nodo1.longitud = 3;
  nodo2.arreglo = arr;
  nodo2.categoria = 2;
  nodo2.next = NULL;
  nodo2.longitud = 3;
  packed_lista_t lista;
  lista.head = &nodo1;
  assert(cantidad_total_de_elementos_packed(&lista) == 6);
	return 0;
}

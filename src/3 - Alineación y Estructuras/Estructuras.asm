

;########### ESTOS SON LOS OFFSETS Y TAMAÑO DE LOS STRUCTS
; Completar las definiciones (serán revisadas por ABI enforcer):
NODO_OFFSET_NEXT EQU 8
NODO_OFFSET_CATEGORIA EQU 8
NODO_OFFSET_ARREGLO EQU 8
NODO_OFFSET_LONGITUD EQU 8
NODO_SIZE EQU 8
PACKED_NODO_OFFSET_NEXT EQU 8
PACKED_NODO_OFFSET_CATEGORIA EQU 8
PACKED_NODO_OFFSET_ARREGLO EQU 8
PACKED_NODO_OFFSET_LONGITUD EQU 8
PACKED_NODO_SIZE EQU 8
LISTA_OFFSET_HEAD EQU 8
LISTA_SIZE EQU 8
PACKED_LISTA_OFFSET_HEAD EQU 8
PACKED_LISTA_SIZE EQU 8

;########### SECCION DE DATOS
section .data

;########### SECCION DE TEXTO (PROGRAMA)
section .text

;########### LISTA DE FUNCIONES EXPORTADAS
global cantidad_total_de_elementos
global cantidad_total_de_elementos_packed

;########### DEFINICION DE FUNCIONES
;extern uint32_t cantidad_total_de_elementos(lista_t* lista);
;registros: lista[?]
cantidad_total_de_elementos:
  ; epilogo
  push rbp
  mov rbp, rsp
  ; res := 0
  mov RAX, 0
  ; current := lista->head
  mov RDI, [RDI]
  ; current == NULL ? prologo : while
  cmp RDI, 0
  je cantidad_total_de_elementos_prologo
  jmp cantidad_total_de_elementos_rec

cantidad_total_de_elementos_rec:
    ; l := current->longitud
    mov RSI, [RDI+24]
    ; res := res + l
    add RAX, RSI
    ; current := current->next
    mov RDI, [RDI]
    ; current != NULL ? while : prologo
    cmp RDI, 0
    jne cantidad_total_de_elementos_rec
    jmp cantidad_total_de_elementos_prologo

cantidad_total_de_elementos_prologo:
    pop RBP
	  ret

;extern uint32_t cantidad_total_de_elementos_packed(packed_lista_t* lista);
;registros: lista[?]
cantidad_total_de_elementos_packed:
  push rbp
  mov rbp, rsp

  mov RDI, [RDI]
cantidad_total_de_elementos_packed_end:
    pop RBP
	  ret


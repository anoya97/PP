(*Autor: Armando Martínez Noya
  Log in: a.mnoya
  Grupo de practicas 2.4*)


let rec fact = function
	0 -> 1 |
	n -> n * fact (n - 1);;

try
	print_endline (
		string_of_int(
			fact (
				int_of_string Sys.argv.(1)
			)
		)
	)
with
	  Failure "int_of_string" -> print_endline "Introduza un número"
	| Stack_overflow -> print_endline "Introduza un entero positivo"
	| Invalid_argument "index out of bounds" -> print_endline "Número de argumentos inválidos"

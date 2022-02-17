(*Autor: Armando Martínez Noya
  Log in: a.mnoya
  Grupo de practicas 2.4*)


let rec qsort1 ord = function
	  [] -> []
	| h::t ->
		let after, before = List.partition (ord h) t
		in qsort1 ord before @ h :: qsort1 ord after;;

(*

- ¿En qúé caso no será bueno el rendimiento de esta implementación?
	No será bueno el rendimiento en el caso en que la mayortia de los elemeentos
	no cumplan la condicion "ord" ya que la primera lista del Append se tiene que 
	recorrer entera.

*)

let rec qsort2 ord =
	let append' l1 l2 = List.rev_append (List.rev l1) l2
	in
		function
			  [] -> []
			| h::t ->
				let after, before = List.partition (ord h) t
				in append' (qsort2 ord before) (h :: qsort2 ord after);;

(*

- ¿Tiene qsort2 alguna ventaja sobre qsort1?
	La ventaja es que qsort1 es recursiva terminal, lo que le permite procesar listas más largas.

- ¿Permite qsort2 ordenar listas que no podrían ordenarse con qsort1?
	Si, por ejemplo:
*)

let l1 = List.init 300_000 (function x -> Random.int 1000);;

(*
	

- ¿Tiene qsort2 alguna desventaja sobre qsort1?
	En este caso es más lento, ya que las funciones recursivas terminales se comportan como
	bucles de tamaño finito. Esto quiere decir que frete a una lista demasiado larga se quedaria
	pillada.

	Tamaño   qsort1     qsort2     Diferenza
	100_000  0.34734s   2.042857s  83% peor 
*)	

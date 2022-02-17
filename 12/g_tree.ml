(*Autor: Armando Martínez Noya
  Log in: a.mnoya
  Grupo de practicas 2.4*)


type 'a g_tree =
	Gt of 'a * 'a g_tree list;;

(* devuelve el número de nodos de un g_tree *)
let rec size = function 
    Gt (_,[]) -> 1
  | Gt (r,h::t) -> size h + size (Gt (r,t));;

(* devuelve la "altura", como número de niveles, de un g_tree *)
let rec height =
	let rec lista_max n = function
		  [] -> n
		| h::t ->
			let hh = height h in
			if hh > n
			then
				lista_max hh t
			else
				lista_max n t
	in function
	  Gt (_, []) -> 1
	| Gt (_, l) ->
		1 + lista_max 0 l;;

(* devuelve las hojas de un g_tree, "de izquierda a derecha" *)
let rec leaves =
	let rec f follas = function
		  [] -> follas
		| h::t -> f (follas @ leaves h) t
	in function
		  Gt (v, []) -> [v]
		| Gt (v, l) -> f [] l;;

(* devuelve la imagen especular de un g_tree *)
let rec mirror = function
	  Gt (v, []) -> Gt (v, [])
	| Gt (v, l) -> Gt (v , List.rev (List.map (mirror) l) );;

(* devuelve la lista de nodos de un g_tree en "preorden" *)
let rec preorder =
	let rec bucle l = function
		  [] -> l
		| h::t -> bucle ( l @ (preorder h) ) t
	in function
	  Gt (v, []) -> [v]
	| Gt (v, l) -> v::bucle [] l;;

(* devuelve la lista de nodos de un g_tree en "postorden" *)
let rec postorder =
	let rec bucle l = function
		  [] -> l
		| h::t -> bucle ( l @ (postorder h) ) t
	in function
	  Gt (v, []) -> [v]
	| Gt (v, l) -> (bucle [] l) @ [v];;

(*

#load "g_tree.cmo";;
open G_tree;;
let t = Gt (2, [Gt (7, [Gt (2, []); Gt (10, []); Gt (6, [Gt (5, []); Gt (11, [])])]); Gt (5, [Gt (9, [Gt (4, [])])])]);;
size t;;
height t;;
leaves t;;
mirror t;;
preorder t;;
postorder t;;

*)

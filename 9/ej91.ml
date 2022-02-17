(*Autor: Armando Martínez Noya
  Log in: a.mnoya
  Grupo de practicas 2.4*)


(*
let rec to0from n =
	if n < 0 then []
	else n :: to0from (n-1);;
*)

let rec to0from n =
	let rec f i l =
		if i > 0 then
			f (i-1) (i::l)
		else
			0::l
	in f n [];;

(*
let rec fromto m n =
	if m > n then []
	else m :: fromto (m+1) n;;
*)

let fromto m n =
	let rec f i l =
		if i < n then
			f (i+1) (i::l)
		else
			i::l
	in List.rev (f m []);;

(*
let rec from1to n =
	if n < 1 then []
	else from1to (n-1) @ [n];;
*)

let rec from1to n =
	let rec f i l =
		if i > 1 then
			f (i-1) (i::l)
		else
			1::l
	in List.rev (f n []);;

(*
let map =
	List.map;;
*)

let map f l =
	let rec bucle salida = function
		  [] -> salida
		| h::t -> bucle ((f h)::salida) t
	in List.rev (bucle [] l);;
	
(*
let power x y =
	let rec innerpower x y =
		if y = 0 then 1
		else x * (innerpower x (y-1))
	in
	if y >= 0 then innerpower x y
	else invalid_arg "power";;
*)

let power x y =
	let rec innerpower b e =
		if e = 0
		then
			b
		else
			innerpower (b * x) (e-1)
	in
	if y >= 0
	then
		innerpower x (y-1)
	else
		invalid_arg "power";;

(*
let incseg l =
	List.fold_right (fun x t -> x::List.map ((+) x) t) l [];;
*)

let incseg l =
	let map f l =
		let rec bucle salida = function
			  [] -> salida
			| h::t -> bucle ((f h)::salida) t
		in List.rev (bucle [] l)
	in
	let fun_interna =
		fun x t -> List.rev_append [x] (map ((+) x) t)
	in
	let rec fold_left semente = function
		[] -> [] |
		h::[] -> fun_interna h (List.rev semente) |
		h::t -> fold_left (fun_interna h (List.rev semente)) t
	in fold_left [] (List.rev l);;

(*
let rec remove x = function
	  [] -> []
	| h::t -> if x = h then t
		else h :: remove x t;;
*)
let remove x l = 
	let rec aux borrar resto = function
		  [] -> resto
		| h::t -> if borrar && x = h
			then
				aux false resto t
			else
				aux borrar (h::resto) t
	in List.rev (aux true [] l);;

(*
let divide = (* ver ejercicio 7.2 *)
*)

let divide l =
	let rec f_aux resto im = function
		  [] -> resto
		| h::[] ->
			if im then
				h::resto
			else
				resto
		| impar::par::t ->
			if im then
				f_aux (impar::resto) im t
			else
				f_aux (par::resto) im t
	in ( List.rev (f_aux [] true l), List.rev (f_aux [] false l) );;

(*
let rec compress2 = function
	| h1::h2::t -> if h1 = h2 then compress (h2::t)
		else h1 :: compress (h2::t)
	| l -> l;;
*)

let compress lista_total =
	let rec f_aux previo = function
		h1::h2::t ->
			if h1 = h2
			then
				f_aux previo (h2::t)
			else
				f_aux (h2::previo) (h2::t)
		| l -> previo
	in List.rev (f_aux [List.hd lista_total] lista_total);;

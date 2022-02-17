(*Autor: Armando Martínez Noya
  Log in: a.mnoya
  Grupo de practicas 2.4*)


let rec divide l =
	match l with
		  h1::h2::t ->
			let t1, t2 = divide t
			in (h1::t1, h2::t2)
		| _ -> l, [];;

(*
let rec merge = function
	  [], l | l, [] -> l
	| h1::t1, h2::t2 ->
		if h1 <= h2
		then
			h1 :: merge (t1, h2::t2)
		else
			h2 :: merge (h1::t1, t2);;
			
(’a -> ’a -> bool) -> ’a list * ’a list -> ’a list
*)

let rec merge cmp = function
	  [], l | l, [] -> l
	| h1::t1, h2::t2 ->
		if cmp h1 h2
		then
			h1 :: merge (cmp) (t1, h2::t2)
		else
			h2 :: merge (cmp) (h1::t1, t2);;

(*
let rec msort1 l =
	match l with
		  [] | _::[] -> l
		| _ ->
			let l1, l2 = divide l
			in merge (msort1 l1, msort1 l2);;

(’a -> ’a -> bool) -> ’a list -> ’a list
*)

let rec msort1 cmp l =
	match l with
		  [] | _::[] -> l
		| _ ->
			let l1, l2 = divide l
			in merge (cmp) (msort1 (cmp) l1, msort1 (cmp) l2);;

(*

- ¿Puede provocar algún problema la no terminalidad de divide o merge?
	La no terminalidad impide que msort1 sea recursiva terminal.
	
*)
let l2  = List.init 200_000 (function x -> Random.int 1000);;

(***********)

let divide' l =
	let rec div a b = function
		  h1::h2::t -> div (h1::a) (h2::b) t
		| _ -> (List.rev a, List.rev b)
	in div [] [] l;;

let merge' cmp l =
	let rec mer resto = function
		  h1::t1, h2::t2 ->
			if cmp h1 h2
			then
				mer (h1::resto) (t1, h2::t2)
			else
				mer (h2::resto) (h1::t1, t2)
		| [], h2::t2 -> mer (h2::resto) ([], t2)
		| h1::t1, [] -> mer (h1::resto) (t1, [])
		| [], [] -> resto
	in List.rev (mer [] l);;

let rec msort2 cmp l =
	match l with
		  [] | _::[] -> l
		| _ ->
			let l1, l2 = divide' l
			in merge' (cmp) (msort2 (cmp) l1, msort2 (cmp) l2);;

(* ****************
+------------+-----------+------------+----------+
| Tamaño     | msort1    | msort2     | qsort2   |
+------------+-----------+------------+----------+
| 10         |  0.001    | 0.001      | 0.000934 |
| 100        |  0.001556 | 0.01635    | 0.001566 |
| 1000       |  0.004442 | 0.0033     | 0.004308 |
| 10 000     |  0.016531 | 0.021415   | 0.01584  |
| 100 000    |  0.222252 | 0.1735411  | 0.193021 |
| 150 000    |  0.310498 | 0.319676   | 0.339866 |
+------------+-----------+------------+----------+
*)

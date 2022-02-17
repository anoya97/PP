(*Autor: Armando Martínez Noya
  Log in: a.mnoya
  Grupo de practicas 2.4*)


let casillas salida = match salida with
	(x, y) -> [ (x+2, y+1); (x+2, y-1); (x-2, y+1); (x-2, y-1);
				(x+1, y+2); (x-1, y+2); (x+1, y-2); (x-1, y-2) ];;

let tour m n salida llegada =
	let rec comprobar recorrido dende =
		if dende = llegada
		then
			Some (dende::recorrido)
		else
			let x,y = dende
			in
			if x > m || y > n || x < 1 || y < 1
			then
				None
			else
				if
					List.find_opt (function x -> x = dende) recorrido = None
				then
					let b =
						List.map (function x -> comprobar (dende::recorrido) x) (casillas dende)
					in
					match
						List.find_opt (function x -> x <> None) b
					with
						  None -> None
						| Some x -> x
				else
					None
	in
		match
			comprobar [] salida
		with
			  None -> raise Not_found
			| Some x -> List.rev x;;

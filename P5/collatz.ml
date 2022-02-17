(*Autor: Armando Martínez Noya
  Log in: a.mnoya
  Grupo de practicas 2.4*)

let f n = if n mod 2 = 0 then n / 2 else 3 * n + 1;;


let rec orbit n =
if n=1 then print_endline "1" 
else (print_string(string_of_int n ^", "); orbit (f n));;


let rec length n = 
if n = 1 then 0 
else 1 + length (f n);;


let rec top n =
if n = 1 then 1 
else max n (top (f n));;


let rec length'n'top n =
if n = 1 then (0, 1)
else let (contar, maximo) = length'n'top (f n) in (contar + 1, max n (maximo));;



let rec longest_in m n =
if m=n then m 
else let resto_delaorbita = longest_in (m+1) n in 
if (length m) >= (length resto_delaorbita) then m
else resto_delaorbita;;


let rec highest_in m n =
if m=n
then m
else let resto_delaorbita = highest_in (m+1) n in
if (top m) >= (top resto_delaorbita) then m
else resto_delaorbita;;
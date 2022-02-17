(*Autor: Armando Martínez Noya
  Log in: a.mnoya
  Grupo de practicas 2.4*)

let is_prime n =
  let rec check_from i =
    i >= n ||
    (n mod i <> 0 && check_from (i+1))
  in check_from 2;;


let rec next_prime n= if (is_prime (n+1)) then (n+1)
else next_prime (n+1);;


let rec last_prime_to n= if(is_prime n) then n
else last_prime_to (n-1);;


let is_prime2 n =
  let rec not_divisible_from d =
    d * d > n || (n mod d <> 0 && not_divisible_from (d+1)) in
  n > 1 && not_divisible_from 2;;
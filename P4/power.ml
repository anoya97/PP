(*Autor: Armando Martínez Noya
  Log in: a.mnoya
  Grupo de practicas 2.4*)


let rec power n m = if (m > 0)
     then n * power n (m-1)
     else 1;;




let rec power' n m = if (m mod 2 == 0)
     then power (n*n) (m/2)
     else n * power (n*n) (m/2);;




let rec powerf n m = if (m mod 2 == 0)
     then powerf (n*.n) (m/2)
     else n *. powerf (n*.n) (m/2);;



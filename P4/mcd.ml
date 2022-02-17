(*Autor: Armando Martínez Noya
  Log in: a.mnoya
  Grupo de practicas 2.4*)


  let rec mcd (n,m) = if (n>=0 && m >= 0 && (n mod m)==0)
     then m
     else mcd (m,(n mod m));;

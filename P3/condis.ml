(*Autor: Armando Martínez Noya
  Log in: a.mnoya
  Grupo de practicas 2.4*)

false && (2 / 0 > 0);;
(*Dará como salida bool=false, ya que la segunda parte de la expresión no se ejecutará.*)

true && (2 / 0 > 0);;
(*Dará como salida un error de división por cero al evaluar la segunda expresión, ya que la primera es siempre true.*)

true || (2 / 0 > 0);;
(*Dará como salida bool=true, ya que la segunda parte de la expresión no se ejecutará.*)

false || (2 / 0 > 0);;
(*Dará como salida un error de división por cero al evaluar la segunda expresión, ya que la primera es siempre true.*)

let con b1 b2 = b1 && b2;;
(*Dará como salida la definición de "con" de la manera: val con : bool -> bool -> bool = <fun>*)

let dis b1 b2 = b1 || b2;;
(*Dará como salida la definición de "dis" de la manera: val dis : bool -> bool -> bool = <fun>*)

con (1 < 0) (2 / 0 > 0);;
(*Dará un error de división de zero ya que antes de hacer el && de la función "con" evalua ambos argumentos, dando el segundo dicho error.*)

(1 < 0) && (2 / 0 > 0);;
(*Dará como salida el bool=false, ya que la primera expresión es falsa y no se evalua la segunda.*)

dis (1 > 0) (2 / 0 > 0);;
(*Dará un error de división de zero ya que antes de hacer el || de la función "dis" evalua ambos argumentos, dando el segundo dicho error.*)

(1 > 0) || (2 / 0 > 0);;
(*Dará como salida el bool=true, ya que la primera expresión es cierta y no se evalua la segunda.*)
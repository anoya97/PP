(*Autor: Armando Martínez Noya
  Log in: a.mnoya
  Grupo de practicas 2.4*)


(*En esta practica encontrareís comentadas todas las expresiónes que generaban un error de
compiación, ademas de estas, estarán comentadas las funciones que usan la libreria de 
Stdlib.Char.uppercase ya que se encuentra "Deprecated" por lo que genera warnings.
*)  

();;
(*Dará como salida un unit ya que no tiene ningun valor significativo*)

2 + 5 * 3;;
(*Dará como salida el int=17*)

1.0;;
(*Dará como salida float=1*)

(*   1.0 *2;;   *)
(*Daŕa un error de tipos, solución : int_of_float 1.0 * 2. Dando como salida: int=2*)

(*   2 - 2.0;;   *)
(*Dará un error de tipos, solución: 2 - int_of_float 2.0. Dando como salida int=0*)

(*   3.0 + 2.0;;   *)
(*Dará un error de tipos, solución: 3.0 +. 2.0;;. Dando como salida float=5*)
 
5 / 3;;
(*Dará como salida int=1*)

5 mod 3;;
(*Dará como salida el resto de la división int=2*)

3.0 *. 2.0 ** 3.0;;
(*Dará como salida el resultado de multiplicar 3x8. float=24*)

3.0 = float_of_int 3;;
(*Dará como salida la evaluación de dicha expresión representando con un bool si es true or false*)

(*   sqrt 4;;   *)
(*Dará un error de tipo ya que la funcion SQRT espera un valor de tipo float. Solución: sqrt 4.0, Dando como salida float=2*)

int_of_float 2.1 + int_of_float (-2.9);;
(*Dará como salida int=0*)

truncate 2.1 + truncate (-2.9);;
(*Dará como salida int=0*)

floor 2.1 +. floor (-2.9);;
(*Dará como salida float=-1*)

(*   ceil 2.1 +. ceil -2.9;;  *) 
(*Dará como salida error de tipo*)

2.0 ** 3.0 ** 2.0;;
(*Dará como salida el resultado de elevar 2 a la 9. float=512*)

'B';;
(*Dará como salida char= 'B'*)

int_of_char 'A';;
(*Dará como salida el número ASCII de el char 'A' int=65*)

char_of_int 66;;
(*Dará como salida el char que esta represetado por el número 66 en ASCII char='B'*)

Char.code 'B';; 
(*Dará como salida el codigo ASCII del caracter 'B' int=66*)

Char.chr 67;;
(*Dará como salida el char que esta represetado por el número 67 en ASCII char='C'*)

'\067';;
(*Dará como salida el char que esta represetado por el número 67 en ASCII char='C'*)

Char.chr (Char.code 'a' - Char.code 'A' + Char.code 'M');;
(*Dará como salida el char representado por el número 109. char='m'*)

(*Char.uppercase 'm';;*)
(*Dará como salida el char en mayúsculas. char='M'*)

(*Char.lowercase 'O';;*)
(*Dará como salida el char en minusculas. char='o'*)

"this is a string";;
(*Dará como salida string="this is a string"*)

String.length "longitud";;
(*Dará como salida int=8. Que es la cantidad de caracteres en el string "longitud"*)

(*   "1999" + "1";;   *)
(*Dará como salida un error de tipo ya que le estamos pasando un string y espera un int. Solución: int_of_string "1999" + int_of_string "1";;
dando como salida int=2000;*)

"1999" ^ "1";;
(*Dará como salida la concatenación de ambas cadenas, string=19991*)

int_of_string "1999" + 1;;
(*Dará como salida el resultado de la suma de dichos números. int=2000;*)

"\064\065";; 
(*Dará como salida los caracteres representados por esos nñumeros en ASCII. string="@A"*)

string_of_int 010;;
(*Dará como salida el valor del número introducido converttido a string. string="10"*)

not true;;
(*Dará como salida el valor de bool false. bool = false*)

true && false;;
(*Dará como salida el resultado de hacer un AND lógico entre ambas expresiones. bool = false*)

true || false;;
(*Dará como salida el resultado de hacer un OR lógico entre ambas expresiones. bool = true*)

(1 < 2) = false;;
(*Dará como salida el resultado de evaluar la expresión de la izq y comparar con la de la derecha. bool = false*)

"1" < "2";;
(*Dará como salida el resultado en bool de comparar ambos strings. bool = true*)

2<12;;
(*Dará como salida el resultado en bool de comparar ambos enteros. bool = true*)

"2" < "12";;
(*Dará como salida el resultado en bool de comparar ambos strings. bool = false*)

"uno" < "dos";; 
(*Dará como salida el resultado en bool de comparar ambos strings. bool = false*)

if 3 = 4 then 0 else 4;;
(*Dará como salida 0 si se cumple que 3=4 y 4 en cualquier otro caso. int=4*)

if 3 = 4 then "0" else "4";;
(*Dará como salida "0" i se cumple que 3=4 y "4" en cualquier otro caso. string="4"**)

(*   if 3 = 4 then 0 else "4";;   *)
(*Dará un error de tipo ya que en el else espera un int como en la primera parte del if. Solución: if 3 = 4 then 0 else int_of_string "4"*)

(if 3 < 5 then 8 else 10) + 4;;
(*Dará el resultado de evaluar el if y sumarle a ese valor 4. int = 12*)

2.0 *. asin 1.0;;
(*Dará como resultado una aproximación al número pi. float = 3.14159265358979*)

sin (2.0 *. asin 1.0 /. 2.);;
(*Dará como resultado matemático de resolver esa expresión. float = 1*)

function x-> 2 * x;;
(*Daŕa como salida el dominio y rango de la función. int -> int = <fun>*)

(function x-> 2 * x) (2 + 1);;
(*Dará como salida el resultado de multplicar la suma de la derecha por 2. int = 6*)

let x=1;;
(*Dará como salida la variable x con el valor que le asignamos. val x : int = 1*)

let y=2;;
(*Dará como salida la variable y con el valor que le asignamos. val y : int = 2*)

x - y;;
(*Dará como salida el resultado de restarle la variable Y a X. int = -1*)

let x = y in x - y;;
(*Dará como salida el resultado de restar x-y despues de haberle asignado a x el valor de y. int = 0*)

x - y;;
(*Dará como salida el resultado de restarle la variable Y a X. int = -1(Los valores de las variables no se vieron afectados por el codigo anterior dado que era una funcion diferente)*)

(*   z;;   *)
(*Dará un error ya que la variable z no está definida. Unbound value z. Solución let z = 0*)

let z = x + y;;
(*Dará como salida la variable z con el valor asignado de la suma de x + y. val z : int = 3*)

z;;
(*Dará como salida el valor actual de dicha variable. int = 3*)

let x = 5;;
(*Dará como salida el valor de x modificado a 5. val x : int = 5*)

z;;
(*Dará como salida el valor actual de dicha variable. int = 3*, este no se ve afectado por el cambio de valor de las variables x e y amenos que volvamos a declarar z*)

let y = 5 in x + y;;
(*Dará como salida el resultado de sumar x + y siendo ambas variables en esta función 5. int = 10*)

x + y;;
(*Dara como salida el resultado de sumar ambas variables con sus valores. int = 7*)

let x = x + y in let y = x * y in x + y + z;;
(*Dará como salida el resultado de operar progresivamente la composición de funciones dada. int = 28*)

x + y + z;;
(*Dará como salida el resultado de sumar el valor de dichas variables. int = 14*)

int_of_float;;
(*Dará como salida el domnio y rango de la función que se encarga en transformar un float a entero. float -> int = <fun>*)

float_of_int;;
(*Dará como salida el domnio y rango de la función que se encarga en transformar un entero a float. int -> float = <fun>*)

int_of_char;;
(*Dará como salida el domnio y rango de la función que se encarga en transformar un char a entero. char -> int = <fun>*)

char_of_int;;
(*Dará como salida el domnio y rango de la función que se encarga en transformar un int a char. int -> char = <fun>*)

abs;;
(*Dará como salida el domnio y rango de la función que se encarga de calcular el valor absoluto de un entero. int -> int = <fun>*)

sqrt;;
(*Dará como salida el domnio y rango de la función que se encarga de calcular la raíz cuadrada de un float. float -> float = <fun>*)

truncate;;
(*Dará como salida el domnio y rango de la función que se encarga de redondear un float a int. float -> int = <fun>*)

ceil;;
(*Dará como salida el domnio y rango de la función que se encarga de redondear un float al float superior. float -> float = <fun>*)

floor;;
(*Dará como salida el domnio y rango de la función que se encarga de redondear un float al float inferior. float -> float = <fun>*)

Char.code;;
(*Dará como salida el domnio y rango de la función que se encarga de dar el codigo ASCII de un char. char -> int = <fun>*)

Char.chr;;
(*Dará como salida el domnio y rango de la función que se encarga de dar el char respecto a un codigo ASCII. int -> char = <fun>*)

(*Char.uppercase;;*)
(*Dará como salida el domnio y rango de la función que se encarga de cambiar un char a mayúsculas. char -> char = <fun>*)

(*Char.lowercase;;*)
(*Dará como salida el domnio y rango de la función que se encarga de cambiar un char a minúsculas. char -> char = <fun>*)

int_of_string;;
(*Dará como salida el domnio y rango de la función que se encarga de cambiar un string a un entero. string -> int = <fun>*)

string_of_int;;
(*Dará como salida el domnio y rango de la función que se encarga de cambiar un entero a un string. int -> string = <fun>*)

String.length;;
(*Dará como salida el domnio y rango de la función que se encarga de calcular la longitud de una string. string -> int = <fun>*)

let f = function x -> 2 * x;;
(*Dará como salida el domnio y rango de la función que se encarga de calcular el doble de un valor dado. int -> int = <fun>*)

f (2+1);;
(*Dará como salida el resultado de calcular el doble a 2+1. int = 6*)

f 2 + 1;;
(*Dará como salida el resultado de calcular el doble a 2 y posteriormente sumarle 1. int = 5*)

let n = 1;;
(*Dará como salida la variable n con el valor que le asignamos. val n : int = 1*)

let g x = x + n;;
(*Dará como salida la variable g con el valor que le asignamos, en este caso es la expresion x = x + n. val g : int -> int = <fun>*)

g 3;;
(*Dará como salida el resultado de sumar 3 + 1. int = 4*)

let n = 5;;
(**)

g 3;;
(*Dará como salida el resultado de sumar 3 + 1 (este resultado no varia por la linea anterior porque se mantienen los valores
de cuando se definió dicga función. int = 4*)

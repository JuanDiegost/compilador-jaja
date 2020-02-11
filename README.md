# compilador-jaja

Un sencillo compilador de codigo generado a medida
ejecute 
```bash 
./build
``` 

para recompilar el programa

para evaluar codigo ejecute 
```bash 
./main.exec CODEFILE.jaja  
```

sidendo CODEFILE el nombre del archivo que desea evaluar

## Palabras Reservadas

~~~
FOR:  		                      for | FOR			
DO: 		                          do | DO
WHILE: 		                    while | WHILE	
FUNCTION: 	              function | FUNCTION	
IF: 		                          if | IF
ELSE:		                        else | ELSE
BREAK: 		                     break | BREAK
IN: 		                           in | IN
RETURN: 	                    return | ->
PRINT		                          printline|PRINTLINE
~~~

## Simbolos

| Simbolo | Nombre | Uso                                                                         |
|---------|--------|-----------------------------------------------------------------------------|
| =       | Igual  | Asignación de variables.                                                    |
| >>      | Rango  | Se utiliza en un  for  para indicar de el rango en el que se quiere iterar. |
 | =+     |igual Más| Sumar el valor de la derecha al de la izquierda del símbolo.|
|=- |igual menos |Restar el valor de la derecha al de la izquierda del símbolo.|
|++ |Más más |Aumentar 1 en la variable de la izquierda.|
|-- |Menos menos |Disminuir 1 en la variable de la izquierda|
|- |Menos |Operación de resta.|
|+ |Más |Operación de suma.|
|* |Producto |Operación de producto.|
|% |Modulo |Operación de Modulo.|
|/ |División |Operación de división.|
|/^ |Elevado |Operación de elevar un valor en otro.|
|== |Comparación |Compara si parámetros son iguales.|
| != | Diferente | Compara si parámetros son diferentes.|
| > | Mayor que | Compara si el parámetro de la izquierda es mayor que el de la derecha.|
| < | Menor que | Compara si el parámetro de la izquierda es menor que el de la derecha|
| >= | Mayor igual que |Compara si el parámetro de la izquierda es mayor o igual que el de la derecha. |
|<= |Menor igual que |Compara si el parámetro de la izquierda es menor o igual que el de la derecha|
|\| |O |Compara que al menos un parámetro, el de izquierda o derecha del símbolo sea verdaderos(true).|
|&& |Y |Compara que ambos parámetros de izquierda y derecha sean verdaderos(true).|
|-> |Retorno |Símbolo que se utiliza para retornar un tipo de dato en una función, (también se puede usar la palabra reservada return)|
|, |Separador |Símbolo para separar diferentes parámetros.|


## Delimitadores

La puntuación entre paréntesis se utiliza en varias partes de la gramática. Un paréntesis
abierto siempre debe estar emparejado con un paréntesis cerrado.
Paréntesis Tipo

* {  } Llaves.
* [  ] Corchetes.
* (  ) Paréntesis.


## Tipos de datos.

A continuación se listan los diferentes tipos de datos soportados por “Jaja”.

### Boolean.

El tipo bool es un tipo de datos que puede ser true o false. Se usa en comparaciones y
operaciones como &, |.
```java
​var​ ​bool​ x = ​true
​const​ ​bool​ y = ​false
```
### Tipos de datos Numéricos.

#### Int

Los números enteros negativos y positivos, desde -99999999999999999999 hasta
999999999999999999999999999999.
```java
​var​ ​int​ x = ​ 1
​const​ ​int​ y = ​ 2
```
#### Long

Los números enteros negativos y positivos, desde
-9999999999999999999999999999999999999999 hasta
999999999999999999999999999999999999999999999999999999999999.
```java
​var​ ​lng​ x = ​ 1
​const​ ​LNG​ y = ​ 2
```
#### Float

Los números reales negativos y positivos, desde 0, hasta
999999999999999999999999999999,999999999999999999999999999999.

```java
var​ ​flt​ x = ​ 1
const​ ​FLT​ y = ​ 2
```
### Datos Textuales.

Los tipos ​char​ y ​str​ contienen datos textuales.
Los tipos de datos char solo acepta un carácter y los str tienen una longitud de máximo
2,999.

```java
​var​ ​char​ x = 'a'
​const​ ​str​ y = "texto ejemplo"
```
## Funciones

Una función consiste en un bloque , junto con un nombre y un conjunto de parámetros.
Aparte del nombre, los parámetros son opcionales. Las funciones se declaran con la
palabra clave ​function​ o ​FUNCTION​. Las funciones pueden declarar un conjunto de
variables de entrada como parámetros, a través de los cuales cuando se invoca se deben
pasar argumentos a la función, y el tipo de salida del valor que la función devolverá al
finalizar, estas pueden ser de tipo simple y extendido
Funciones simples diseñadas para aquellas funciones sin un retorno o retorno vacío,
funciones extendidas incluyen un retorno de tipo de dato asociado a su resultado

```java
function​ ​guardar_persona​ (​int​:edad,​str​:nombre,​char​:genero){

}
```

```java
function​ ​guardar_persona​ (​int​:edad,​str​:nombre,​char​:genero) ​-​> ​str​ {

}
```

## Ciclos.

A continuación se evidencia el uso de los bucles o cicles en el lenguaje.

### For

Un for es una expresión sintáctica para hacer un bucle sobre los elementos proporcionados.
Por ejemplo.
```java
var​ ​int​ ​sum​ = ​ 0
for ​n​ in ​ 1 ​ >> ​ 11 ​ {
    sum​ =+ ​ 1
}
```

### while

Un bucle ​while​ comienza evaluando la expresión condicional del bucle booleano. Si la
expresión condicional del bucle se evalúa como ​true​, el bloque del cuerpo del bucle se
ejecuta, y luego el control vuelve a evaluar la expresión condicional del bucle. Si la
expresión condicional del bucle se evalúa como ​false​, la expresión while se completa.
Por ejemplo.
```java
var​ int ​i​ = ​ 0
while(​i​ < ​10)​ {
    i​ =+ ​ 1
}
```
### Do While

Un bucle ​do​ ​while​ comienza ejecutando el bloque del cuerpo del bucle se y luego evaluando
la expresión condicional del bucle booleano. Si la expresión condicional del bucle se evalúa
como ​true​, el bloque del cuerpo del bucle se ejecuta, y luego el control vuelve a evaluar la
expresión condicional del bucle. Si la expresión condicional del bucle se evalúa como ​false​,
la expresión while se completa.
Por ejemplo.
```java
var​ int ​i​ = ​ 0
do {
  i​ =+ ​ 1
} while ( ​i​ < ​ 10 ​)
```
## Expresiones if else

Una expresión ​if es una estructura condicional en el control del programa. La forma de una
expresión if es una expresión de condición, seguida de un bloque consecuente. Las
expresiones de condición deben tener ser booleana. Si una expresión de condición se
evalúa como verdadera, se ejecuta el bloque consecutivo y cualquier otro posterior. Si una


expresión de condición se evalúa como falsa, el bloque dentro del if se salta y si se tiene un
else se ejecuta el bloque de código dentro de este, luego se continua con el programa si se
evalúa la condición.
Por ejemplo.
```java
if​ ( ​i​ == ​ 1 ​){
    i​ = ​ 10
} ​else​ ​if​( ​i​ == ​ 2 ​){
    i​ = ​ 20
} ​else​ ​if​( ​i​ == ​ 3 ​){
    i​ = ​ 30
} ​else​ ​if​( ​i​ == ​ 4 ​){
    i​ = ​ 40
} ​else​ {
    i​ = ​ 0
}
```

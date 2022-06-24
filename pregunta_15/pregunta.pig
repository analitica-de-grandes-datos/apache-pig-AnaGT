/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname,
       color
   FROM 
       u 
   WHERE color = 'blue' AND firstname LIKE 'Z%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

          >>> Escriba su respuesta a partir de este punto <<<
*/
-- carga de datos desde la carpeta local
lines = LOAD 'data.csv' USING PigStorage(',')
    AS (
            f1:int,
            f2:chararray,
            f3:chararray,
            f4:chararray,
            f5:chararray,
            f6:int
    );


A = FOREACH lines GENERATE CONCAT(f2,' ',f5) AS columna;
B = FILTER A BY STARTSWITH (columna,'Z');
STORE B INTO 'output';

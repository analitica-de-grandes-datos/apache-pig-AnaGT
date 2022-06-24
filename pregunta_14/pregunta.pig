/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       color 
   FROM 
       u 
   WHERE 
       color NOT LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/

-- carga de datos desde la carpeta local
lines = LOAD 'data.csv' USING PigStorage (',') AS (f1:INT, f2:CHARARRAY, f3:CHARARRAY, f4:DATETIME, f5:CHARARRAY);
extraer = FOREACH lines GENERATE f5 as lines;
b = FILTER extraer BY NOT STARTSWITH (lines,'b');
STORE b INTO 'output';

/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Obtenga los apellidos que empiecen por las letras entre la 'd' y la 'k'. La 
salida esperada es la siguiente:

  (Hamilton)
  (Holcomb)
  (Garrett)
  (Fry)
  (Kinney)
  (Klein)
  (Diaz)
  (Guy)
  (Estes)
  (Jarvis)
  (Knight)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
-- carga de datos desde la carpeta local
lines = LOAD 'data.csv' USING PigStorage (',') AS (f1:INT, f2:CHARARRAY, f3:CHARARRAY);
extraer = FOREACH lines GENERATE f3 as lines;

h = FILTER extraer BY STARTSWITH (lines ,'D') OR STARTSWITH (lines ,'H') OR STARTSWITH (lines ,'G') OR STARTSWITH (lines ,'F') OR STARTSWITH (lines ,'J') OR STARTSWITH (lines ,'E') OR STARTSWITH (lines ,'K');

STORE h INTO 'output';

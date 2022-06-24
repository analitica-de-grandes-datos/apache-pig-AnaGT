/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Genere una relación con el apellido y su longitud. Ordene por longitud y 
por apellido. Obtenga la siguiente salida.

  Hamilton,8
  Garrett,7
  Holcomb,7
  Coffey,6
  Conway,6

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
-- carga de datos desde la carpeta local
lines = LOAD 'data.csv' USING PigStorage (',') AS (f1:INT, f2:CHARARRAY, f3:CHARARRAY);

extraer = FOREACH lines GENERATE f3;

X = FOREACH extraer GENERATE f3, SIZE(f3) AS l;

-- genera una variable que ordena
ordenar = ORDER X BY l desc, f3 asc;

-- selecciona las primeras 5 palabras
s = LIMIT ordenar 5;

-- escribe el archivo de salida en el sistema local
STORE s INTO 'output' USING PigStorage(',');

# About :information_source:

El presente proyecto consiste en desarrollar un sistema de información de egresados, por medio del cual se pueda visualizar y analizar información realtiva a dichos estudiantes
- Proyectos investigativos realizados
- Profesores colaboradores
- Estadísticas de empleabilidad 
- Uso de los servicios ofertados por parte de la universidad. 

# Estructura del repositorio :mag:

## Entrega1 
Se encuentran los archivos correspondientes a la primera entrega.

## db_setup_clean
Últimas versiones de los modelos relacional y dimensional, con las inserciones y etl correspondientes.
> Se corrigiron detalles con respecto a la primera entrega.

## data 
Aqui se encuentran archivos .json con los datos extraidos de la base de datos relacional por medio de la herramienta 'Relational Migrator'.

Estos archivos se usan para poblar la base de datos NoSQL de Mongo.

## sharding 
En esta carpeta se encuentran los archivos para realizar el sharding de la base de datos, junto con la explicación de cómo se ejecutó y realizó todo.

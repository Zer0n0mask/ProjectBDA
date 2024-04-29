# Ejecución
## Paso 1:

En una terminal moverse a la carpeta *'sharding'* y ejecutar:

```
docker-compose up -d
```

## Paso 2:

Correr los siguientes comandos:

```
- docker-compose exec configsvr01 sh -c "mongosh < /scripts/init-configserver.js"

- docker-compose exec shard01-a sh -c "mongosh < /scripts/init-shard01.js"

- docker-compose exec shard02-a sh -c "mongosh < /scripts/init-shard02.js"

- docker-compose exec shard03-a sh -c "mongosh < /scripts/init-shard03.js"
```

## Paso 3:

Esperar unos segundos y ejecutar:

```
docker-compose exec router01 sh -c "mongosh < /scripts/init-router.js"
```

# Verificación de replicas

Para verificar la creación de las réplicas de los configserver y shards, ingresar a alguno de los contenedores con el comando:

```
docker-compose exec <container_name> mongosh
```

Estando dentro, ejecutar:

```
rs.status()
```

> Nota: el nombre de los contenedores se puede revisar en el archivo docker-compose



# Habilitar y configurar el sharding

Para todas la consultas o actualizaciones a la base de datos, primero es necesario conectarse al router; el cual redirigirá la query a un shard específico.

```
docker-compose exec router01 mongosh
```

## Habilitar el sharding en la base de datos

```
use <database>
sh.enableSharding("<database>")
```

## Definir el shard key en la colección

```
sh.shardCollection("<database>.<collection>", { <shard key field> : "hashed" , ... } )
```

# Comandos útiles

## Monitorear la distribución de datos

```
db.<collection>.getShardDistribution()
```

## Monitorear el estado de los shards

```
sh.status()
```
---
Description: Construcción de un sistema BI para Egresados de la Universidad Nacional
Date: 
---
Entregar: 
- Modelo Relacional transaccional  
- Modelo dimensional (Bodega de datos). Mínimo tres tablas de hechos  
- Implementación de BD transaccional y Cargue de Datos  
- ETL desde BD relacional a la Bodega de Datos  
- Indicadores construidos con funciones de agregación. Dashboard. Usar como fuente la Bodega de datos

## 1 What info do we need from those people?
Info de egresados
- Datos personales
	- Cédula / ID. 
	- Tipo de documento
	- Nombre 
	- Apellido
	- Genero. Enum. 
	- Etnia. Enum. 
	- Datos financieros
		- PBM. NULL
		- Estrato
	- Datos de contacto
		- Dirección física
		- Correo personal
		- Correo institucional
		- Número de telefono 1
		- Número de telefono 1
	- Edad
	- Cumpleaños
- Datos Acádemicos
	- List of Programa 
		- Universidad
		- Duración
		- Nombre
		- Sede
		- País
		- PA
		- Enum: Pregrado / Maestría / Doctorado
		- Facultad
		- Departamento
	- Trabajo de grado:
		- Tipo: Trabajo de grado / BAPI 
		- Nombre 
		- Área
		- Descripción
	- Publicaciones
	- Trabajos investigativos
		- Tipo: Ponencia / artículo
		- Profesor. NULL
		- Asociación Grupal. NULL
			- Nombre
			- Tipo: Semillero / Grupo / etc
		-  Publicación
			- Fecha
			- Revista
			- Área
- Ocupación
	- Job. NULL
		- Salario. NULL
		- Fecha inicio 
		- Fecha fin. NULL
		- Área de desempeño.
		- Cargo 
			- Nivel jerárquico 
		- Ubicación. NULL
		- Empresa. NULL
			- Nombre 
			- Área de la empresa. 
	- Tipo de ocupación
		- Independiente
			- Empresario
				- Trabajo
			- Contratista
			- Persona
		- Asalariado
		- Desempleado
- Apoyos 
	- Externo/Interno. Boolean
	- Retribuído/No. Boolean
	- Característica
		- Tipo. Enum. SocioEconómico / Beca promedio / auxDocente
		- Finalidad
- Servicios bienestar para egresados
	- Charlas
		- Name
		- Description
		- Location
		- Date
	- Cursos
		- Nombre
		- Descripción
		- Área
		- Costo
		- Fecha de inscripción
	- Ofertas de empleo
		- Usuario
			- Tipo. Enum "Empresa", "Egresado", "Admin"
			- NombreUsuario
			- List of Links
				- Name
				- Link
			- Status. Enum. "Looking for job", "Looking for graduates", "Open to offers". NULL
			- Experience
				- List of Jobs -> Table already created before
			- Education 
				- List of Programa -> Tables already created before
			- Courses and certifications
				- Type. Enum. "course", "certification"
				- Name
				- InstitutionName
				- ID credential 
				- Issued date
			- Knowledge and aptitudes
				- Name
				- Level. 10% to 100% 


Historico ocupación
Servicios bienestar -para-> Egresados 
	Incluyendo empresas en el campo, ofertas, etc.
Sistema de información -> información no estructurada
Mínimo 3 tablas de hecho. 
https://egresados.bogota.unal.edu.co/index.php/prog-egresados/sie

Presentación: 8min

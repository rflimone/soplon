# Soplón - Notificaciones de Entretención
 Universidad Nacional Andrés Bello - Chile
 Proyecto de Título 2018

# Descripción del servicio:
El sitio se dedica a entregar notificaciones de entretenimiento basada en búsquedas por usuarios, dichas notificaciones pueden ser por celular o email. 

# Descripción del flujo del servicio / diagrama de secuencia (Vista Lógica):

1.- Subscripción de Usuario
Un usuario se subscribe al sitio indicando su nombre completo, email y/o celular. 
/* Se esta evaluando realizar subscripciones a través de RRSS tales como FB o Twitter, se debe evaluar si estos sitios entregan email y/o celular */

2.- Búsquedas (Subscripciones)
Existen 2 tipos de búsquedas (internamente se denominan tipos de subscripciones):

Ruta 1: Por Dominio (Sitio web desde donde el usuario quiere recibir notificaciones)
	Al usuario le interesa recibir información de X sitio. 

Al seleccionar "Búsqueda por Dominios" se despliega el menú de categorías (Mangas, Animé, Películas, Conciertos, Deportes, Libros, Cine)
Al seleccionar una de estas categorías se despliegan las imagenes y los nombres de los sitios web asociados a dicha categoría (Ejemplo: Manga: www.mangastream.com, https://jaiminisbox.com/, https://mangahis.com/)
	/*En esta sección existirá un buscador interno webs, ya que podría aumentar la cantidad */
Al seleccionar el sitio web se despliegan las imagenes y los nombres de los contenidos de ese sitio. 
	/*En esta sección existirá un buscador interno tags, ya que podría aumentar la cantidad */
Al seleccionar un contenido debe solicitar tipo de recepción (email o celular) 
Al seleccionar tipo de recepción debe verificar su selección.
Finaliza Ruta 1 con mensaje "Próximamente se enviará el link de "contenido" a tu "tipo de recepción escogido", gracias por confiar en nosotros!"
	
Ruta 2: Por TAG de contenido (Identificador único utilizado en las búsquedas, identifica el contenido que el usuario quiere recibir)
	Al usuario no le interesa recibir de X sitio, sólo recibir el primer link que tenga la información que el desea. 

Al seleccionar "Búsqueda por Contenido" se despliega el menú de categorías (Mangas, Animé, Películas, Conciertos, Deportes, Libros, Cine)
Al seleccionar una de estas categorías se despliegan las imagenes y los nombres de los contenidos de todos los sitios. 
	/*En esta sección existirá un buscador interno tags, ya que podría aumentar la cantidad */
Al seleccionar un contenido debe solicitar tipo de recepción (email o celular) 
Al seleccionar tipo de recepción debe verificar su selección.
Finaliza Ruta 2 con mensaje "Próximamente se enviará el link de "contenido" a tu "tipo de recepción escogido", gracias por confiar en nosotros!"

/* Revisar cómo manejar el registro de envíos para que sean mensuales */

# Identificación de funciones del sitio:
Login 
Mantenedor de Login (para cambiar datos, contraseña o desubscribirse)
Listado de subscripciones del usuario
Selección de buscador/subscripción
Ranking de sitios web
selección de sitio web
Ranking de tag de contenidos
selección de tag de contenido
selección de tipo de recepción




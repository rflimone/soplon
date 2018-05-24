# Soplón - Notificaciones de Entretención
 Universidad Nacional Andrés Bello - Chile
 Proyecto de Título 2018

# Descripción del servicio:
El sitio se dedica a entregar notificaciones de entretenimiento basada en búsquedas por usuarios, dichas notificaciones pueden ser por celular o email. 

### Descripción del proyecto  
Soplon-web es la aplicación web del sistema de notificaciones, posee toda la interacción con el usuario final (ver categorias, últimas actualizaciones, registro, login,etc), como tambien consta con una pequeña api rest construida para consumir y entregar ciertos recursos como servicio.  

### Instalación  
Se debe contar con un entorno local o de producción LAMP.  
PHP > 5.6  
MySql > 5.6  
Curl activado(puede venir activado por defecto, si no habilitar en php.ini extension=php_curl.dll)  
  
Dentro de la carpeta htdocs del servidor xampp o lammp (antes montado.)
git clone https://github.com/rflimone/soplon.git
listo.  
  
### API
Se incorporo una pequeña libreria de API Rest, para su utiliación se debe agregar un set de tablas a la base de datos de la aplicación(se adjuntara).
  
Endpoint de prueba.  
http://url-proyecto/api/pages/pages/category/mangas/key/YoIqkS9aNT3iyJaoSco0YaeHzJ0Bzd8mzIoMXEug

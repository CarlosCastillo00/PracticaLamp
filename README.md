# PracticaLamp
En esta práctica, realizaremos una estructura LAMP, en la cual contaremos con una máquina Apache, y otra máquina Mysql. Cada una tendra una IP estática en red privada, pero la máquina Apache también tendrá salida a internet.

Estructura del Proyecto:

*Vagrantfile: Definimos aquí la configuración de las máquinas virtuales, incluyendo la red y el aprovisionamiento. El Vagrantfile define dos máquinas virtuales: una para el servidor web (Apache) y otra para la base de datos (MySQL). Cada máquina tiene asignada una IP privada, y se configura una red compartida entre ambas con el nombre "CarlosRed".

*provision_apache.sh: Script de aprovisionamiento para instalar Apache, PHP y el código de la aplicación. En este script configuramos la máquina Apache. Esto realiza las siguientes acciones:

1-Actualiza el sistema.

2-Instala Apache, PHP y otras dependencias necesarias.

3-Clona el código de la aplicación web desde un repositorio Git en la carpeta /var/www/practicalamp.

4-Configura los permisos para que Apache pueda acceder al código de la aplicación.

5-Modifica el archivo de configuración de Apache para que apunte al directorio /var/www/practicalamp.

6-Crea el archivo de configuración de la aplicación (config.php) con los datos de conexión a la base de datos MySQL.

*provision_mysql.sh: Script de aprovisionamiento para instalar MySQL, crear la base de datos y el usuario. En este script configuramos la máquina MySQL. Esto realiza las siguientes acciones:

1-Actualiza el sistema.

2-Instala MySQL.

3-Crea la base de datos lamp_db y el usuario Carlos con acceso desde la IP de la máquina Apache.

4-Importa los datos iniciales de la base de datos.

5-Configura MySQL para que escuche en la IP asignada.

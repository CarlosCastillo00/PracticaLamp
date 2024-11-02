# PracticaLamp
En esta práctica, realizaremos una estructura LAMP, en la cual contaremos con una máquina Apache, y otra máquina Mysql. Cada una tendra una IP estática en red privada, pero la máquina Apache también tendrá salida a internet. El objetivo de esta práctica es configurar y desplegar un entorno LAMP (Linux, Apache, MySQL, PHP) distribuido en dos máquinas virtuales mediante Vagrant. Este tipo de infraestructura permite separar el servidor web y el servidor de bases de datos, simulando un entorno de producción real.

## Estructura del Proyecto:

### *Vagrantfile: 
Definimos aquí la configuración de las máquinas virtuales, incluyendo la red y el aprovisionamiento. El Vagrantfile define dos máquinas virtuales: una para el servidor web (Apache) y otra para la base de datos (MySQL). Cada máquina tiene asignada una IP privada, y se configura una red compartida entre ambas con el nombre "CarlosRed".

#### Cabe recalcar que el nombre de máquina no he podido poner CarlosCastApache, ni CarlosCastMysql debido a que al realizar un vagrant up, se quedaba pillado, así que traté de ponerle Apache y Mysql y sí funcionó. Por lo que el hostname de ambas si es el que se especifica en la práctica (CarlosCastApache y CarlosCastMysql).

## Esta es una imagen del Vagrant file:
![image](https://github.com/user-attachments/assets/e8060532-3960-413d-b06d-3f613c8bdd59)


### *provision_apache.sh: 
Script de aprovisionamiento para instalar Apache, PHP y el código de la aplicación. En este script configuramos la máquina Apache. Esto realiza las siguientes acciones:

1-Actualiza el sistema.

![image](https://github.com/user-attachments/assets/e88a111b-ed99-45dc-8483-3486d5865503)

2-Instala Apache, Git, PHP y todo lo necesario.

![image](https://github.com/user-attachments/assets/74f050a7-6e9b-4813-b2d1-a7025fb722df)

3-Clona el código de la aplicación web desde un repositorio Git en la carpeta /var/www/practicalamp. Esta carpeta se creará al realizar esta instrucción.

![image](https://github.com/user-attachments/assets/5d8079f1-e79a-4450-8ba6-027d78a626ae)

4-Configura los permisos para que Apache (www-data) pueda acceder al código de la aplicación.

![image](https://github.com/user-attachments/assets/02770582-ff58-4d32-ab25-5626ee12f9fd)

5-Se modifica el archivo de configuración de Apache para que utilice el nuevo DocumentRoot.

![image](https://github.com/user-attachments/assets/f6a38bde-23e3-4485-a0ad-555c92fccf35)

6-Habilita el nuevo sitio (lamp.conf) y deshabilita el sitio por defecto.

![image](https://github.com/user-attachments/assets/7c14aa5e-0f32-42ae-9d7c-58eaad0c02ce)

7-Crea el archivo de configuración de la aplicación (config.php) con los datos de conexión a la base de datos MySQL.

![image](https://github.com/user-attachments/assets/3fe76c4b-3ae5-422f-9044-841ec15c235c)



8-Se recarga Apache, para establecer los cambios realizados.

![image](https://github.com/user-attachments/assets/1e9f7bb9-7223-431e-8dd4-0128a7780a32)

## Esta es una imagen del Provision Apache:
![image](https://github.com/user-attachments/assets/aae91646-710c-4096-85d5-c8987f2ab378)


## *provision_mysql.sh:
Script de aprovisionamiento para instalar MySQL, crear la base de datos y el usuario. En este script configuramos la máquina MySQL. Esto realiza las siguientes acciones:

1-Actualiza el sistema.

![image](https://github.com/user-attachments/assets/50a7b50f-db7a-49c6-861f-02e339c4022e)

2-Instala MySQL y lo iniciamos.

![image](https://github.com/user-attachments/assets/93151423-12d2-4c7d-9959-248ad4579970)



3-Descarga el script Git de la base de datos.

![image](https://github.com/user-attachments/assets/8aecc44f-37fd-4f0f-9dd2-ad1787379f4a)


4-Después, con la ejecución de script SQL mysql -u root < iaw-practica-lamp/db/database.sql, creamos la base de datos lamp_db y las tablas necesarias para la aplicación.

![image](https://github.com/user-attachments/assets/645e5580-e41f-4234-8f6e-ef37fa9df6da)


5-Después, crea un usuario llamado carlos con permisos para conectarse desde la IP de la máquina apache (192.168.56.10) y otorga todos los privilegios sobre la base de datos lamp_db a este usuario.

![image](https://github.com/user-attachments/assets/895ef907-6c6e-4118-b7b2-3e8853eef135)


6-Permite conexiones remotas, ya que cambia la configuración de MySQL para escuchar conexiones desde la IP de la máquina mysql (192.168.56.11), permitiendo que apache se conecte a la base de datos.

![image](https://github.com/user-attachments/assets/617353b8-b1f6-4fe8-8f86-76b616008098)


7-Reinicia mysql para aplicar los cambios.

![image](https://github.com/user-attachments/assets/642658f2-3f72-42af-b630-9b54b3227663)


## Esta es una imagen del provision Mysql:
![image](https://github.com/user-attachments/assets/1642b104-e1a5-4928-9c4b-dcf8997af3f8)

## Aquí podemos observar el estado de los servicios corriendo en las dos máquinas:

### Apache

![image](https://github.com/user-attachments/assets/7be11967-2848-4b0f-a9f9-889f1a19ef87)


### Mysql

![image](https://github.com/user-attachments/assets/2180f2a1-462a-4053-8dd2-a36d3d5865de)

### Aquí podemos observar como la página LAMP está en funcionamiento:

![image](https://github.com/user-attachments/assets/2d274f33-8da1-4fff-a005-01e35b3aa84e)

## Conclusión

Con esta práctica hemos conseguido desplegar un entorno LAMP distribuido en dos máquinas virtuales, demostrando la configuración y conexión entre un servidor web y un servidor de bases de datos en un entorno simulado. A través del uso de Vagrant y scripts de aprovisionamiento, hemos simplificado la instalación y configuración del sistema, facilitando la automatización y replicación de esta infraestructura en distintos entornos, con el resultado final de una correcta conexión a la web LAMP, pudiendo introducir datos y almacenarlos en la base de datos.

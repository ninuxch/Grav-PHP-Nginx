# Grav-PHP-Nginx

## Self-configuring grav container
Based on ahumaro/grav-php-nginx. This container provides a grav installation including the admin plugin. It is designed for ease of use, scalability and ease of update.

### Major Changes in this fork

+ Admin plugin installed (credentials: admin / admin1234)
+ No SSH daemon for a smaller footprint.
+ The volume /usr/share/nginx/html/user contains the configuration and user data.
+ If the volume is emptied the skeleton configuration is provisioned.
+ Based on pushion latest.

## A modern approach for a lightweight yet efficient CMS

### At a glance

This aproach for a lightweight Content Management System stack includes four main parts:

+ **Grav** as the lightweight _flat-file_ Content Management System.
+ **Nginx** as a fast and eficient webserver.
+ **PHP-FPM** as the FastCGI engine.
+ **Pushion** as the minimal linux container for this stack.

The idea behind this solution is to have a very light and small footprint CMS that can run efficiently in a flexible environment.

### How to use it

Its very important to note this container expose 3 volumes and 2 ports.
You should properly map the ports when you run the container.

1. Run the container:

   **docker run -d -i -v /your/data/dir:/usr/share/nginx/html/user -p 80:80 ninuxch/grav-php-nginx gravpage**
    
   The previous command run the container. If the container it not already in your system, it downloads the image from the Docker Hub.
   
   An external directory is mapped to the grav user configuration. In the example above, we are mapping port 80 in the host to the port 80 in the container, and the container is named gravpage.

2. Test Grav site

   Just point your browser to **`http://your_server/`** to see the frontend. Point your browser to **`http://your_server/admin`** to login to the backend (skeleton credentials: admin / admin1234).

3. Change the admin user and password.

You can inspect your new running container to find out the location of the 2 volumes the container is exposing:

+ Volume **/usr/share/nginx/html/user/**

  Here you can find the Grav user folder where you can add and manage your content.

+ Volume **/etc/nginx/**

  (Optional) Here you can tweak Nginx configuration and sites 
  
### Updating

An upgrade procedure to remove step 4 is work in progress.

1. **docker stop gravpage**

2. **docker rm gravpage**

3. **docker run -d -i -v /your/data/dir:/usr/share/nginx/html/user -p 80:80 ninuxch/grav-php-nginx:latest gravpage**

4. In case you need to update plugins or adjust your configuration just exec a shell in the container:

   **docker run -ti gravpage /bin/bash**

   Execute the command to update plugins:

   /usr/share/ngingx/html# bin/gpm update -f

### Components

**Grav** is a very fast and simple solution for a CMS. It use flat files to store content. Installation is very simple and is much more easy and light than other CMS's like Drupal or Joomla.
Also is worth to mention that is a very well documented piece of software. 

**Nginx** is a webserver very light and efficient that is strong focused in a small memory footprint and high concurrency and performance.
Also it can be configured as a reverse proxy to handle and solve many scenarios and, in conjunction with **PHP-FPM**, is the way to go to handle and enhance this CMS solution.

**Pushion** base Docker container is a minimal Ubuntu base image modified and minified to be a lightweight Docker compatible container. 
The container is enhanced with key features like the ability to handle SSH access to the container and the ability to add additional daemons that run at the startup time of the container.
 
### Container philosophy

In theory, the use of Docker and containers encourage the one process per container approach but, from the point of view of software as a service, this new container is focused in the one service per container philosophy.

### Dockerfile

The definition for this new **Grav-PHP-Nginx** container perfirm several tasks at build time:

+ Define the base image as **phusion/baseimage:latest**, an excelent minified Ubuntu LTS Docker container.
+ Install and update the core components for this new container like Nginx, PHP-FPM, etc.
+ Get Grav up-to-date files from its GIT repository.
+ Run Grav install scripts.
+ Make a backup of the skeleton in /usr/share/nginx/html/user to /usr/src/grav-skeleton
+ Setup Nginx and Grav configuration site.
+ Setup PHP-FPM, Nginx and SSH services.
+ Expose Volumes and ports.

This Docker container is ready and preconfigured. Just download and use it.

### Enjoy this container!
## Lukas Meyer

lukas@ninux.ch

www.ninux.ch

## Credits to: Ahumaro Mendoza

www.ahumaro.com

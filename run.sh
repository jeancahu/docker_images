
# pone el puerto 80 del docker en el 20040 del host
# -d corre en background
# --name container name, is not the same image name
docker run --name prueba_de_docker -i -d -p 20040:80 -t prueba

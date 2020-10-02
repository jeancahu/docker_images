docker build -t gtfs_editor .
docker run --name gtfs_editor -i -p 20040:80 -t gtfs_editor:latest /bin/bash

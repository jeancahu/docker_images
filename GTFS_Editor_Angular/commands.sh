docker build -t gtfs_editor .
docker run --name gtfs_editor -i -p 20040:80 -t gtfs_editor:latest /bin/bash
wget https://github.com/windsound3482/timetable/archive/master.zip
unzip master.zip

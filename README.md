# Docker example

I use this repository as a template for future applications on docker

	Dockerfile──>(build)──>DockerImage──>(run)──>DockerContainer
                               └─> [Github]DockerHub──>(pull)──>StagingServer
                	                      └─>(pull)──>ProductionServer


Execute something in container<br>
docker exec -it < container_id > < command ><br>
docker container prune # remove stopped containers<br>
docker run --name < container_name > ... blah blah

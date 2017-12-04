#!/bin/bash
# Bash Menu Script Example

Menu='Please enter your choice: '
options=("List all containers" "List running containers (only)" "Inspect a specific container" "Dump specific container logs" "List all images" "Create a new image" "Create a new container" "Change a container's state" "Change a specific image's attributes" "Delete a specific container" "Delete all containers (including running)" "Delete a specific image" "Delete all images" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "List all containers")
		curl -s -X GET -H 'Accept: application/json' http://localhost:8080/containers | python -mjson.tool
            ;;
        "List running containers (only)")
            	curl -s -X GET -H 'Accept: application/json' http://localhost:8080/containers?state=running | python -mjson.tool
            ;;
        "Inspect a specific container")
	echo -e "Please enter a container to inspect: "
        read container
        	curl -s -X GET -H 'Accept: application/json' http://localhost:8080/containers/$container | python -mjson.tool
            ;;
        "Dump specific container logs")
	echo -e "Please enter a container to inspect: "
        read container
		curl -s -X GET -H 'Accept: application/json' http://localhost:8080/containers/$container/logs | python -mjson.tool
            ;;
        "List all images")
            	curl -s -X GET -H 'Accept: application/json' http://localhost:8080/images | python -mjson.tool
            ;;
        "Create a new image")
		curl -H 'Accept: application/json' -F file=@Dockerfile http://localhost:8080/images
            ;;
        "Create a new container")
		curl -X POST -H 'Content-Type: application/json' http://localhost:8080/containers -d '{"image": "aaa"}'
            ;;
        "Change a container's state")
        echo -e "Please enter an container tag to change attributes"
        read container
                curl -s -X PATCH -H 'Content-Type: application/json' http://localhost:8080/images/$container -d '{"tag": "test:1.0"}'
            ;;
        "Change a specific image's attributes")
	echo -e "Please enter an image tag to change attributes"
	read image
		curl -s -X PATCH -H 'Content-Type: application/json' http://localhost:8080/images/$image -d '{"tag": "test:1.0"}'
            ;;
        "Delete a specific container")
	echo -e "Please enter a container to delete: "
	read container
		curl -s -X DELETE -H 'Accept: application/json' http://localhost:8080/deleteContainer/$container
	    ;;
        "Delete all containers (including running)")
		curl -s -X DELETE -H 'Accept: application/json' http://localhost:8080/deleteContainers
            ;;
        "Delete a specific image")
	echo -e "Please enter an image to delete: "
        read $image
		curl -s -X DELETE -H 'Accept: application/json' http://localhost:8080/deleteImage/$image 
            ;;
        "Delete all images")
    		curl -s -X DELETE -H 'Accept: application/json'/ http://localhost:8080/deleteImages | python -mjson.tool
            ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done

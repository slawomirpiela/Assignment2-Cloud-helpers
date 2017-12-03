To test the application

use ./s.sh
It's a bash script for testing purposes, it's self-eplanatory
Each option is connected to a CURL command

Available API endpoints
GET /containers List all containers
GET /containers?state=running List running containers (only)
GET /containers/&lt;id&gt; Inspect a specific container
GET /containers/&lt;id&gt;/logs Dump specific container logs
GET /services List all service
GET /nodes List all nodes in the swarm
POST /containers Create a new container
PATCH /containers/&lt;id&gt; Change a container&#39;s state
containers/&lt;id&gt; DELETE / Delete a specific container
DELETE /containers Delete all containers (including running)
GET /images List all images
POST /images Create a new image
PATCH /images/&lt;id&gt; Change a specific image&#39;s attributes
DELETE /images/&lt;id&gt; Delete a specific image
DELETE /images Delete all images

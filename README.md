## Usage

docker run -rm -v /run/docker.sock:/run/docker.sock mwagg/etcd-container-presence --container my_container

-rm   - Remove this container when it stops. No reason for it to stick around
-v    - Map the Docker socket into the container so it can query the Docker API

Assumes that etcd can be found at http://172.17.42.1:4001

For each port binding configured for the container the following keys will be written:

/containers/container_name/ports/{port}/host - the host ip
/containers/container_name/ports/{port}/port - the host port

Only writes entries for containers which are running.

The TTL is set to 60 seconds and is refreshed every 30 seconds. When the container stop the entries are deleted.

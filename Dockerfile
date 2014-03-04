FROM ubuntu

RUN apt-get update
RUN apt-get install -y python-pip python-dev
RUN pip install docker-py python-etcd
ADD register /bin/register

ENTRYPOINT ["/bin/register"]

FROM ubuntu:12.04

ENV CONTAINER=docker
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        python-pip \
        python-software-properties \
        software-properties-common \
        sudo \
    && rm -rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && apt-get clean

RUN pip install ansible q

RUN mkdir -p /etc/ansible
    && echo '[local]\nlocalhost ansible_connection=local ansible_python_interpreter=/usr/bin/python3' > /etc/ansible/hosts

CMD ["/sbin/init"]

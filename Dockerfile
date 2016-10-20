FROM ubuntu:12.04
RUN apt-get update \
    && apt-get install -y --no-install-recommends python-software-properties \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean
RUN apt-add-repository ppa:ansible/ansible \
    && apt-get update \
    && apt-get upgrade -y --no-install-recommends \
    && apt-get install -y ansible \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Install Ansible inventory file.
RUN echo '[local]\nlocalhost ansible_connection=local' > /etc/ansible/hosts

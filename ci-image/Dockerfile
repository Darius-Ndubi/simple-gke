FROM google/cloud-sdk:300.0.0-slim

RUN apt-get update && \
    apt-get install git wget unzip kubectl gettext -y && \
    export VER="0.12.28" && \
    wget https://releases.hashicorp.com/terraform/${VER}/terraform_${VER}_linux_amd64.zip && \
    unzip terraform_${VER}_linux_amd64.zip && \
    mv terraform /usr/local/bin/

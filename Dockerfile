FROM vinik/ubuntu

RUN apt-get install -y --force-yes wget
RUN mkdir terraform
RUN wget https://releases.hashicorp.com/terraform/0.6.14/terraform_0.6.14_freebsd_amd64.zip
RUN unzip terraform_0.6.14_freebsd_amd64.zip terraform/

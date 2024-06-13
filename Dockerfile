FROM ubuntu:22.04
RUN apt-get update -y \
&& apt-get upgrade -y \
&& apt-get install -y wget unzip

WORKDIR /overprotocol
COPY execution.sh execution.sh
COPY consensus.sh consensus.sh
COPY deploy_node.sh deploy_node.sh
RUN chmod +x execution.sh consensus.sh deploy_node.sh

# RUN NODE
RUN wget https://over-protocol-dist.s3.ap-northeast-2.amazonaws.com/v1.0.2/kairos/kairos_linux.zip \
&& wget https://over-protocol-dist.s3.ap-northeast-2.amazonaws.com/v0.5.18/develop/chronos_linux_amd64.zip 
RUN unzip chronos_linux_amd64.zip -d consensus \
&& unzip kairos_linux.zip -d execution
RUN mkdir -p ./execution/data \
&& mkdir -p ./consensus/data


CMD ./deploy_node.sh
FROM ubuntu:22.04
RUN apt-get update -y \
&& apt-get upgrade -y \
&& apt-get install -y wget unzip

WORKDIR /overprotocol
RUN wget https://over-protocol-dist.s3.ap-northeast-2.amazonaws.com/v1.0.2/kairos/kairos_linux.zip \
&& wget https://over-protocol-dist.s3.ap-northeast-2.amazonaws.com/v0.5.18/develop/chronos_linux_amd64.zip \
&& wget https://github.com/overprotocol/staking-deposit-cli/releases/download/v2.5.0/staking_deposit-cli-12f5f57-linux-amd64.tar.gz
RUN unzip chronos_linux_amd64.zip -d consensus \
&& unzip kairos_linux.zip -d execution
RUN mkdir -p ./execution/data \
&& mkdir -p ./consensus/data

RUN mkdir validator \
&& tar -xvzf staking_deposit-cli-12f5f57-linux-amd64.tar.gz \
&& cp ./dist/staking_deposit-cli-12f5f57-linux-amd64/deposit ./validator/
COPY validator_keys ./validator/validator_keys
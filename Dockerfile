FROM nginx:latest 
LABEL "author"="msatyasai1460@gmail.com" "Deplaoyed on"="May-8"
RUN apt update && apt install -y unzip \
    apt install -y net-tools && apt install -y jq \
    && rm -rf terraform* \
    && rm -rf packer*
COPY index.html /usr/share/nginx/html/
COPY contact.html /usr/share/nginx/html/
COPY scorekeeper.js /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/
ADD https://releases.hashicorp.com/terraform/1.8.3/terraform_1.8.3_linux_amd64.zip .
ADD https://releases.hashicorp.com/packer/1.6.2/packer_1.6.2_linux_amd64.zip .
RUN unzip terraform_1.8.3_linux_amd64.zip \ && unzip packer_1.6.2_linux_amd64.zip \
    && mv terraform /usr/local/bin && mv packer /usr/local/bin \
    && rm -rf *.zip && terraform version && packer version

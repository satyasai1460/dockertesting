FROM nginx:latest 
LABEL "author"="msatyasai1460@gmail.com" "Deplaoyed on"="May-8"
RUN apt update
RUN apt install -y unzip
RUN apt install -y net-tools
RUN apt install y jq 
COPY index.html /usr/share/nginx/html/
COPY contact.html /usr/share/nginx/html/
COPY scorekeeper.js /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/
ADD https://releases.hashicorp.com/terraform/1.8.3/terraform_1.8.3_linux_amd64.zip .
ADD https://releases.hashicorp.com/packer/1.10.3/packer_1.10.3_linux_amd64.zip .
RUN unzip terraform_1.8.3_linux_amd64.zip
RUN unzip packer_1.10.3_linux_amd64.zip
RUN terraform /usr/local/bin
RUN packer /usr/local/bin
RUN rm -rf *.zip
RUN terraform version
RUN packer version

FROM nginx:latest 
LABEL "author"="satyasai1460@gmail.com" "Deplaoyed on"="May-8"
RUN apt update && apt install -y unzip \
    && apt install -y net-tools && apt install -y jq && apt install -y iputils-ping\
    && rm -rf terraform* \
    && rm -rf packer* \
    && useradd testuser1
ARG TFORM='1.6.2'
ARG PACK='1.5.2'
COPY index.html /usr/share/nginx/html/
COPY contact.html /usr/share/nginx/html/
COPY scorekeeper.js /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/
ADD https://releases.hashicorp.com/terraform/${TFORM}/terraform_${TFORM}_linux_amd64.zip .
ADD https://releases.hashicorp.com/packer/${PACK}/packer_${PACK}_linux_amd64.zip .
RUN unzip terraform_${TFORM}_linux_amd64.zip && unzip packer_${PACK}_linux_amd64.zip \
    && mv terraform /usr/local/bin && mv packer /usr/local/bin \
    && rm -rf *.zip && terraform version && packer version
EXPOSE 80
CMD ["ping", "-c 3", "www.google.com"]
# ENTRYPOINT ["ping", "-c 3", "www.google.com"]
USER  testuser1
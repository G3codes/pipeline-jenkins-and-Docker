#specify a base image
FROM centos:7 
#we the :7 to indicate we want centos 7 otherwise it would have pulled the latest image of centos
LABEL description="containerize apache webapp"
LABEL maintainer="G3codes"

RUN yum -y update 
# run yum update 
RUN yum install -y httpd
# execute httpd

#copy html file from our local to inside the container
COPY index.html /var/www/html/

#open port 80
EXPOSE 80

#run httpd service when container start. This is the equivalent of systemcl start apache. 
ENTRYPOINT [ "/usr/sbin/httpd" ]
#can override CMD in the background -D forces the container to remain active after we exit the container. 
CMD [ "-D", "FOREGROUND" ]

#Entrypoint and CMD enable the specified commands to run automically when the container starts. 
#Entrypoint commands can't be overrided while CMD can be override outside the container. 





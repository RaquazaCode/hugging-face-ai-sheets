FROM docker.elastic.co/elasticsearch/elasticsearch-oss:7.10.2

# Install Python
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install -y python39 python39-pip wget

# Copy setup files
COPY ./requirements.txt requirements.txt
COPY ./start.sh start.sh
RUN chown elasticsearch:elasticsearch requirements.txt
RUN chown elasticsearch:elasticsearch start.sh

# Change the user to the default user for the elasticsearch image
USER elasticsearch

# API KEY and password
RUN --mount=type=secret,id=API_KEY,mode=0444,required=false
ARG API_KEY=$(cat /run/secrets/API_KEY)

RUN --mount=type=secret,id=PASSWORD,mode=0444,required=false
ARG PASSWORD=$(cat /run/secrets/PASSWORD)

RUN echo $PASSWORD

# Install Python deps
RUN pip3 install -U -r requirements.txt

RUN wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh

# Make scripts executable
RUN chmod +x wait-for-it.sh
RUN chmod +x start.sh

# Expose the application's port
EXPOSE 6900

# Set the command to run the shell script
CMD ["./start.sh"]
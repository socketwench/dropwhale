FROM debian:wheezy
MAINTAINER your_email@example.com

RUN apt-get update && \
    apt-get -yq install mysql-server

RUN sed -i -e "s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

COPY run.sh /tmp/mysql_run.sh
RUN chmod +x /tmp/mysql_run.sh

VOLUME  ["/etc/mysql", "/var/lib/mysql"]

EXPOSE 3306

ENTRYPOINT ["/tmp/mysql_run.sh"]

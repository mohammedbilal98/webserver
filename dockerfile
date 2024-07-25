From ubuntu:20.04

LABEL "Author"="Bilal"

LABEL "Project"="Wise Cow Web Server" 

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install cowsay fortune -y

WORKDIR /

ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"

COPY wisecow.sh /wisecow.sh

RUN chmod +x /wisecow.sh

EXPOSE 4499

ENTRYPOINT ["bash", "wisecow.sh"]


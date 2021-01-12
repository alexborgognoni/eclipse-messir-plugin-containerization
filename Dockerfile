FROM ubuntu:latest
USER root
ARG DEBIAN_FRONTEND=noninteractive

RUN     apt update
RUN     apt install texlive -y 
RUN     apt install xindy -y 
RUN     apt install inkscape -y 
RUN     apt install ghostscript -y 
RUN     apt install wget -y && apt install gdebi -y && \
        wget 'http://ftp.de.debian.org/debian/pool/main/g/gcc-4.8/gcc-4.8-base_4.8.4-1_amd64.deb' -O /tmp/gcc.deb && \
        wget 'http://ftp.br.debian.org/debian/pool/main/g/gcc-defaults/libgcj-common_6.3-4_all.deb' -O /tmp/libgcj-common.deb && \
        wget 'http://archive.ubuntu.com/ubuntu/pool/universe/g/gcc-4.8/libgcj14_4.8.5-4ubuntu2_amd64.deb' -O /tmp/libgcj14.deb && \
        wget 'http://archive.ubuntu.com/ubuntu/pool/universe/p/pdftk/pdftk_2.01-1_amd64.deb' -O /tmp/pdftk.deb && \
        gdebi /tmp/gcc.deb -n && \
        gdebi /tmp/libgcj-common.deb -n && \
        gdebi /tmp/libgcj14.deb -n && \
        gdebi /tmp/pdftk.deb -n && \
        rm -rf /tmp/* 
RUN apt-get install okular -y 

RUN apt install sudo && \
        apt-get update && \
        apt-get install -y openjdk-14-jdk libxext-dev libxrender-dev libxtst-dev && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/* && \
        rm -rf /tmp/* && \
        apt-get update && apt-get install -y libgtk2.0-0 libcanberra-gtk-module

RUN wget http://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/2020-12/M1/eclipse-java-2020-12-M1-linux-gtk-x86_64.tar.gz -O /tmp/eclipse.tar.gz && \
        echo 'Installing eclipse' && \
        tar -xf /tmp/eclipse.tar.gz -C /opt && \
        rm /tmp/eclipse.tar.gz

RUN chmod +x /opt/eclipse/eclipse && \
        mkdir -p /home/developer && \
        echo "developer:x:1000:1000:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
        echo "developer:x:1000:" >> /etc/group && \
        echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
        chmod 0440 /etc/sudoers.d/developer && \
        chown developer:developer -R /home/developer && \
        chown root:root /usr/bin/sudo && chmod 4755 /usr/bin/sudo

USER developer
ENV HOME /home/developer
WORKDIR /home/developer
CMD /opt/eclipse/eclipse
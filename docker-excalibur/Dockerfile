FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive

ADD ./pdftk /pdftk

RUN apt update && apt install texlive -y && \ 
        apt install openjdk-11-jdk -y && \
        apt install xindy -y && \
        apt install inkscape -y && \
        apt install ghostscript -y && \
        apt install gdebi -y && gdebi /pdftk/gcc-4.8-base_4.8.4-1_amd64.deb -n && \
		gdebi /pdftk/libgcj-common_6.3-4_all.deb -n && \
		gdebi /pdftk/libgcj14_4.8.5-4ubuntu2_amd64.deb -n && \
		gdebi /pdftk/pdftk_2.01-1_amd64.deb -n &&  \
		sed -i 's|"\[\[.*\]"|"[\\[(](\\S+)/\\S+[\\])]"|' /usr/share/gdebi/gdebi && \
		sed -i 's|"\[\[.*\]"|"[\\[(](\\S+)/\\S+[\\])]"|' /usr/share/gdebi/GDebi/GDebiCli.py


CMD echo "latex version:" && latex --version && \
        echo "java version: " && java --version && \
        echo "xindy version: " && xindy --version && \
        echo "inkscape version: " && inkscape --version && \
        echo "ps2pdf test: " && ps2pdf && \
        echo "pdftk version: " && pdftk --version \


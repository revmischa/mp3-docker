FROM centos:latest

RUN ["yum", "-y", "install","libid3tag-devel", "createrepo", "ncurses-devel"]

# create package repo and install
WORKDIR /root
ADD pkg mp3pkg/
RUN ["createrepo", "/root/mp3pkg"]
RUN ["chmod", "-R", "o-w+r", "/root/mp3pkg"]
ADD mp3pkg.repo /etc/yum.repos.d/
RUN ["yum", "install", "-y", "libmad", "madplay", "lame"]

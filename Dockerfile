FROM archlinux/base
RUN pacman -Sy --noconfirm reflector &&\ 
    reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist &&\
    pacman -Syu --noconfirm sudo base-devel
RUN useradd -m -s /bin/bash sma && echo "sma ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && visudo -cqs -f /etc/sudoers
USER sma
WORKDIR /home/sma
# RUN curl https://aur.archlinux.org/cgit/aur.git/snapshot/sbfspot-mysql-git.tar.gz | tar xz &&\ 
#     cd sbfspot-mysql-git &&\ 
#     makepkg -sri --noconfirm &&\ 
#     rm -fr /home/sma/sbfspot-mysql-git
COPY . .
RUN makepkg -sri --noconfirm
USER root
RUN sed -i '$ d' /etc/sudoers &&\
    visudo -cqs -f /etc/sudoers &&\ 
    pacman -Rsuncd --noconfirm sudo $(pacman -Qtdq)
USER sma
VOLUME /etc/SBFspot.cfg
ENV ARGS=""
ENTRYPOINT /opt/sbfspot.3/SBFspot -cfg/etc/SBFspot.cfg $ARGS
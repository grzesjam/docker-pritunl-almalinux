FROM almalinux:8
# based on https://docs.pritunl.com/docs/installation#other-providers-oracle-linuxalmalinuxrocky-linuxrhel
# https://github.com/pritunl/pritunl
# https://wiki.almalinux.org/Comparison.html
ENV PRITUNL_VERSION="1.32.4181.41"

# Alternative import from download if keyserver offline
RUN rpm --import https://raw.githubusercontent.com/pritunl/pgp/master/pritunl_repo_pub.asc

COPY pritunl.repo /etc/yum.repos.d/pritunl.repo


# AlmaLinux/Rocky Linux/RHEL
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm && \
    yum -y update

# WireGuard server support and other needed bits
RUN yum -y --allowerasing install wireguard-tools pritunl-openvpn procps iproute policycoreutils

RUN yum -y install pritunl-${PRITUNL_VERSION} 
COPY pritunl.conf /etc/pritunl.conf

EXPOSE 80
EXPOSE 443
EXPOSE 1194
EXPOSE 1194/udp


ENTRYPOINT ["/usr/bin/pritunl"]

docker run --volume /home/dilley/lsrd-src/espa-dockerfiles/SPECS:/SPECS:ro --volume /home/dilley/lsrd-src/espa-dockerfiles/RPMS:/root/rpmbuild/RPMS:rw espa.centos.external rpmbuild -bb /SPECS/RPM-espa-product-formatter.spec

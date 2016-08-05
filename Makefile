
TAG_PREFIX = espa
TAG_VERSION = 0.2.0

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# General targets
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

all: clean

clean: clean.containers clean.images

clean.containers:
	@-./scripts/remove-all-stopped-containers.sh

clean.images:
	@-./scripts/remove-dangling-images.sh

.PHONY: all clean clean.containers clean.images build.base build.external build.rpmbuilder build.science centos.base centos.external centos.rpmbuilder centos.science base external rpmbuilder science

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Common
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

build.base:
	@docker build -t $(TAG_PREFIX).$(SYSTEM).base \
         -f $(SYSTEM)/base/Dockerfile .
	@docker tag $(TAG_PREFIX).$(SYSTEM).base \
        $(TAG_PREFIX).$(SYSTEM).base:$(TAG_VERSION)

build.external:
	@docker build -t $(TAG_PREFIX).$(SYSTEM).external \
         -f $(SYSTEM)/external/Dockerfile .
	@docker tag $(TAG_PREFIX).$(SYSTEM).external \
        $(TAG_PREFIX).$(SYSTEM).external:$(TAG_VERSION)

build.rpmbuilder:
	@docker build -t rpmbuilder -f centos/rpmbuilder/Dockerfile .
	@docker tag rpmbuilder rpmbuilder:$(TAG_VERSION)

build.science:
	@docker build -t $(TAG_PREFIX).$(SYSTEM).science \
         -f $(SYSTEM)/science/Dockerfile .
	@docker tag $(TAG_PREFIX).$(SYSTEM).science \
        $(TAG_PREFIX).$(SYSTEM).science:$(TAG_VERSION)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CentOS
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

centos.base:
	@SYSTEM=centos make build.base

centos.external: centos.base
	@SYSTEM=centos make build.external

centos.rpmbuilder: centos.external
	@SYSTEM=centos make build.external

centos.science: centos.external
	@SYSTEM=centos make build.science

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Shortcuts
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

base: centos.base
external: centos.external
rpmbuilder: centos.rpmbuilder
science: centos.science

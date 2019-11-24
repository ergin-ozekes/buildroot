###############################################################################
#
# ardupilot
#
###############################################################################

ARDUPILOT_VERSION			= master
ARDUPILOT_SITE				= git://github.com/ergin-ozekes/ardupilot.git

define ARDUPILOT_BUILD_CMDS
	Tools/environment_install/install-prereqs-ubuntu.sh -y; . ~/.profile;
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define ARDUPILOT_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
	INSTALLFLAGS=-m755 DESTDIR="$(TARGET_DIR)" install
endef

$(eval $(generic_package))
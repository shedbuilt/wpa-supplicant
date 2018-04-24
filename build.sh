#!/bin/bash
patch -p1 -i "${SHED_PATCHDIR}/wpa_supplicant-2.6-upstream_fixes-1.patch" &&
cd wpa_supplicant &&
cp "${SHED_CONTRIBDIR}/default.config" .config &&
make -j $SHED_NUMJOBS BINDIR=/sbin LIBDIR=/lib &&
install -v -dm755 "${SHED_FAKEROOT}/sbin" &&
install -v -m755 wpa_{cli,passphrase,supplicant} "${SHED_FAKEROOT}/sbin" &&
install -v -dm755 "${SHED_FAKEROOT}/usr/share/man/man5" &&
install -v -m644 doc/docbook/wpa_supplicant.conf.5 "${SHED_FAKEROOT}/usr/share/man/man5" &&
install -v -dm755 "${SHED_FAKEROOT}/usr/share/man/man8" &&
install -v -m644 doc/docbook/wpa_{cli,passphrase,supplicant}.8 "${SHED_FAKEROOT}/usr/share/man/man8" &&
install -v -dm755 "${SHED_FAKEROOT}/lib/systemd/system" &&
install -v -m644 systemd/*.service "${SHED_FAKEROOT}/lib/systemd/system" &&
install -v -dm755 "${SHED_FAKEROOT}/usr/share/dbus-1/system-services" &&
install -v -m644 dbus/fi.{epitest.hostap.WPASupplicant,w1.wpa_supplicant1}.service \
                 "${SHED_FAKEROOT}/usr/share/dbus-1/system-services" &&
install -v -dm755 "${SHED_FAKEROOT}/etc/dbus-1/system.d" &&
install -v -m644 dbus/dbus-wpa_supplicant.conf \
                 "${SHED_FAKEROOT}/etc/dbus-1/system.d/wpa_supplicant.conf"

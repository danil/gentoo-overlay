#! /bin/bash
# This file is part of Danil Kutkevich <danil@kutkevich.org> home.
echo $(cat /proc/acpi/battery/BAT0/state \
        |sed -n '/^charging/ s/^.*:[ ]*\(\)/\1/p
                 /^remaining/ s/^.*:[ ]*\(\)/\1/p')

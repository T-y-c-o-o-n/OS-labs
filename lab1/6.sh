#!/bin/bash

> full.log
awk '{ if ($3 == "(WW)") { $3 = "Warning:"; print $0 } }' /home/tycoon/.local/share/xorg/Xorg.0.log >> full.log
awk '{ if ($3 == "(II)") { $3 = "Information:"; print $0 } }' /home/tycoon/.local/share/xorg/Xorg.0.log >> full.log



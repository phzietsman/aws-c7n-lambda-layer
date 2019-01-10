#!/usr/bin/env bash

mkdir -p /tmp/custodian

cp custodian/lib/python2.7/site-packages/. /tmp/custodian/
cp custodian/bin/custodian /tmp/custodian/.
sed -i '1s/^.*$/# No shbang/' /tmp/custodian/custodian
zip -r content.zip /tmp/custodian/

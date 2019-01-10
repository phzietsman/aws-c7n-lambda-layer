#!/usr/bin/env bash

mkdir -p /tmp/custodian-layer

cp -r /tmp/custodian/lib/python2.7/site-packages/. /tmp/custodian-layer/
cp /tmp/custodian/bin/custodian /tmp/custodian-layer/.
sed -i '1s/^.*$/# No shbang/' /tmp/custodian-layer/custodian
zip -r content.zip /tmp/custodian-layer/

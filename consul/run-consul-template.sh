#!/bin/bash

# 生成 targets
#consul-template \
#  -consul-addr=localhost:8500 \
#  -template="templates/targets.ctmpl:prom-config/targets/user-service.json" \
#  -once

#consul-template \
#  -consul-addr=consul:8500 \
#  -template="templates/targets.ctmpl:prom-config/targets/user-service.json:curl -X POST http://prometheus:9090/-/reload" \
#  -template="templates/rules.ctmpl:prom-config/rules/user-service.yml:curl -X POST http://prometheus:9090/-/reload"

# 生成 rules
consul-template \
  -consul-addr=hcs.gpg123.vip:8500 \
  -template="templates/rules.ctmpl:/home/prometheus/rules/user-service.yml:curl -X POST https://prometheus.gpg123.vip:9090/-/reload" \
#  -once #一次性
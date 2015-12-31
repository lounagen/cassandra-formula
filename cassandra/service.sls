# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "cassandra/map.jinja" import cassandra with context %}

include:
  - cassandra.config

cassandra-name:
  service.running:
    - name: {{ cassandra.service.name }}
    - enable: True
    - watch:
      - file: cassandra-config
      - file: cassandra-config-rackdc

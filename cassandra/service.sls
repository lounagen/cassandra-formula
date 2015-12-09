# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "cassandra/map.jinja" import cassandra with context %}

cassandra-name:
  service.running:
    - name: {{ cassandra.service.name }}
    - enable: True

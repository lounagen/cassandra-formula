# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "cassandra/map.jinja" import cassandra with context %}

cassandra-config:
  file.managed:
    - name: {{ cassandra.config }}
    - source: salt://cassandra/files/cassandra.conf.tmpl
    - mode: 644
    - user: root
    - group: root

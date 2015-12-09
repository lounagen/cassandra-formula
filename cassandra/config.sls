# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "cassandra/map.jinja" import cassandra with context %}

cassandra-config:
  file.managed:
    - name: {{ cassandra.config }}
    - source: salt://cassandra/files/conf/cassandra_3.0.yaml
    - template: jinja
    - mode: 644
    - user: root
    - group: root

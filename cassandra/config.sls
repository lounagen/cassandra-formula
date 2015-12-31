# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "cassandra/map.jinja" import cassandra with context %}

cassandra-config:
  file.managed:
    - name: {{ cassandra.config.cassandra_yaml }}
    - source: salt://cassandra/files/conf/cassandra_3.0.yaml
    - template: jinja
    - mode: 644
    - user: root
    - group: root

cassandra-config-rackdc:
  file.managed:
    - name: {{ cassandra.config.rackdc }}
    - source: salt://cassandra/files/conf/cassandra-rackdc.properties
    - template: jinja
    - mode: 644
    - user: root
    - group: root


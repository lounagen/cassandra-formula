# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "cassandra/map.jinja" import cassandra with context %}

cassandra-pkg:
  pkg.installed:
    - name: {{ cassandra.pkg }}

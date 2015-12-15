# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "cassandra/map.jinja" import cassandra with context %}

cassandra-repo:
  pkgrepo.managed:
    - humanname: {{ cassandra.repo.humanname }}
    - name: {{ cassandra.repo.name }}
    - file: {{ cassandra.repo.file }}
    - keyid: {{ cassandra.repo.keyid }}
    - keyserver: {{ cassandra.repo.keyserver }}
    - gpgcheck: 1
    - require_in:
      - pkg: cassandra-pkg

cassandra-pkg:
  pkg.installed:
    - name: {{ cassandra.pkg }}
    - refresh: true

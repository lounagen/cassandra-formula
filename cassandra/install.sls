# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "cassandra/map.jinja" import cassandra with context %}

python-software-properties:
  pkg.installed

python-apt:
  pkg.installed

java-pkg:
  pkg.installed:
    - name: {{ cassandra.java.pkg }}
    - refresh: true

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

{% elif grains['os'] == 'Raspbian' %}
/tmp/{{ cassandra.deb.name }}.deb:
   file.managed:
      - source: {{ cassandra.deb.source }}
      - source_hash: {{ cassandra.deb.source_hash }}

cassandra-dpkg-install:
    cmd.run:
      - names:
        - dpkg -i /tmp/{{ cassandra.deb.name }}.deb
        - apt-get install -y
      - unless: dpkg -s {{ cassandra.pkg }}
      - require:
        - file: /tmp/{{ cassandra.deb.name }}.deb
{% endif %}

cassandra-pkg:
  pkg.installed:
    - name: {{ cassandra.pkg }}
    - refresh: true
    - require:
      - pkg: java-pkg


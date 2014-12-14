Kibana 4 Cookbook
===========

[![Build Status](https://travis-ci.org/rchukh/chamber-kibana.svg)](https://travis-ci.org/rchukh/chamber-kibana)

The [Application Cookbook](http://blog.vialstudios.com/the-environment-cookbook-pattern/) for installing/configuring Kibana 4.

> The cookbook tries to reuse the [ElasticSearch cookbook](https://github.com/elasticsearch/cookbook-elasticsearch/) approach to attributes/services/etc.

Requirements
============

## Platforms

The following platforms are supported and tested under test kitchen:

- CentOS 6.5
- Ubuntu 14.04
- Debian 7.7

Other Debian and RHEL family distributions are assumed to work.

## Cookbooks

| Cookbook  | Status | Description | 
| ------------- | ------------- | ------------- | 
| ```chef-sugar``` | **required** | Used for some miscellaneous checks | 
| ```ark``` | **required** | Download and unpack of archive | 
| ```java``` | **required** | For installing Java - runtime dependency as of Kibana 4 | 
| ```line``` | **required** | For workaround of [hardcoded XMX in JAVA_OPTS](https://github.com/rchukh/chamber-kibana/issues/3) | 
| ```elasticsearch``` | recommended | ES may be located on other server, thus it is not a required dependency. | 
| ```logstash``` | suggested | Kibana 4 can work with any compatible ES index, thus logstash is not a required dependency. | 

Attributes
============

See [attributes](attributes/default.rb).


Recipes
============

| Recipe  | Description | 
| ------------- | ------------- | 
| ```chamber-kibana::default``` | Installs Kibana 4. | 
| ```chamber-kibana::dependencies``` | Installs only Kibana 4 dependencies. |

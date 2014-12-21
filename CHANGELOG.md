<a name="0.2.1"></a>
### 0.2.1 (2014-12-21)


#### Bug Fixes

* cookbooks kibana.yml is not used ([4f5567f1](https://github.com/rchukh/chamber-kibana/commit/4f5567f140eb25c12ec42afe7324650a10815ea9), closes [#28](https://github.com/rchukh/chamber-kibana/issues/28))


#### Features

* update to kibana 4.0.0-beta3 ([ed68fcfb](https://github.com/rchukh/chamber-kibana/commit/ed68fcfbac3a9f93ca707a42f5757c98e02cb040))


#### Breaking Changes

* kibana elasticsearch index property changed from
'kibana-int' to '.kibana' to match default kibana configuration
 ([ed68fcfb](https://github.com/rchukh/chamber-kibana/commit/ed68fcfbac3a9f93ca707a42f5757c98e02cb040))


<a name="0.2.0"></a>
## 0.2.0 (2014-12-14)


#### Bug Fixes

* test-kitchen fails for debian/ubuntu without_deps suite ([8e3ef418](https://github.com/rchukh/chamber-kibana/commit/8e3ef4181ad2c37d95d1983c6cfd314f0a8b8d47))
* kibana service restart does not wait between stop and start ([1c0db81b](https://github.com/rchukh/chamber-kibana/commit/1c0db81b693b2012dbf42349b332b6dd5d54076f))
* should fail on missing java during converge stage, not compile ([6a178a7c](https://github.com/rchukh/chamber-kibana/commit/6a178a7c42d6bda8d4caf1adb91c63ca50046af2))
* metadata.json is not used after stove 3.2.3 update ([6371983b](https://github.com/rchukh/chamber-kibana/commit/6371983b5f094f16a2f4dcd38805885185d18496), closes [#14](https://github.com/rchukh/chamber-kibana/issues/14), [#16](https://github.com/rchukh/chamber-kibana/issues/16))


#### Features

* debian support ([f8378d96](https://github.com/rchukh/chamber-kibana/commit/f8378d96990828a80e9024817bdccbf34def585b))
* ubuntu support ([f3c0a5ce](https://github.com/rchukh/chamber-kibana/commit/f3c0a5cea709975532bb40f90cb96ee415228f5f))


<a name="0.1.2"></a>
### 0.1.2 (2014-10-18)


#### Features

* compute download url in recipe, not in attributes ([65809184](https://github.com/rchukh/chamber-kibana/commit/65809184547e56faf5c36605f36851a9c46b5090), closes [#11](https://github.com/rchukh/chamber-kibana/issues/11))


<a name="0.1.1"></a>
### 0.1.1 (2014-10-12)


#### Bug Fixes

* attributes for dependency installation are not checked correctly ([aa78fe5f](https://github.com/rchukh/chamber-kibana/commit/aa78fe5fc6a4188d55b756bef4c91c94757032e7), closes [#9](https://github.com/rchukh/chamber-kibana/issues/9))


<a name="0.1.0"></a>
## 0.1.0 (2014-10-12)


#### Features

* exlude Java and ElasticSearch installation ([bf01e588](https://github.com/rchukh/chamber-kibana/commit/bf01e5889b9ae450607ba17c9fa8ec112e54ff17), closes [#6](https://github.com/rchukh/chamber-kibana/issues/6))
* ability to configure JAVA_OPTS for Kibana ([7f1064ca](https://github.com/rchukh/chamber-kibana/commit/7f1064ca0fa2dd94b3bf459012db69b443fdff1f), closes [#3](https://github.com/rchukh/chamber-kibana/issues/3))
* prepare initial working cookbook ([a91b26d2](https://github.com/rchukh/chamber-kibana/commit/a91b26d2d6c08115196a38b65b117723c59da946), closes [#2](https://github.com/rchukh/chamber-kibana/issues/2))


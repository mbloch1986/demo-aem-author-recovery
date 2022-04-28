[![Build Status](https://github.com/shinesolutions/puppet-aem-curator/workflows/CI/badge.svg)](https://github.com/shinesolutions/puppet-aem-curator/actions?query=workflow%3ACI)
[![Published Version](https://img.shields.io/puppetforge/v/shinesolutions/aem_curator.svg)](http://forge.puppet.com/shinesolutions/aem_curator)
[![Downloads Count](https://img.shields.io/puppetforge/dt/shinesolutions/aem_curator.svg)](http://forge.puppet.com/shinesolutions/aem_curator)
[![Known Vulnerabilities](https://snyk.io/test/github/shinesolutions/puppet-aem-curator/badge.svg)](https://snyk.io/test/github/shinesolutions/puppet-aem-curator)

Demo AEM Author Recovery
------------------

This repository is for demoing the AEM Author Recovery capability configuring an Author Primary & Author Cold-Standby instance.


Usage:
Configure Author Primary:
```
puppet apply \
  --modulepath modules \
  manifests/demo_config_author_primary.pp
```
Configure Author Standby:
```
puppet apply \
  --modulepath modules \
  manifests/demo_config_author_standby.pp
```

Reconfiguring/Promoting Auhtor Standby as Author Primary:
```
puppet apply \
  --modulepath modules \
  manifests/demo_config_author_standby_promotion.pp
```

Apache Sling Logger configuration:
```
logs/tarmk-coldstandby.log
org.apache.jackrabbit.oak.segment
```

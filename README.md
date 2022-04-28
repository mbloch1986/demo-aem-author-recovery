Demo AEM Author Recovery
------------------

Demo repository to demonstrate the AEM Author recovery


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


class aem_curator::demo_config_author_standby (
  $author_port  = 4501,
  $aem_home_dir = '/opt/workspace/aem-workspace/workspaces/aem65/author/standby',
  $aem_id       = 'author',
  $aem_version  = '6.5',
  $primary_host = '172.17.0.3'
) {
  $osgi_configs = {
    'org.apache.jackrabbit.oak.segment.SegmentNodeStoreService' => {
      'org.apache.sling.installer.configuration.persist' => false,
      'name'                                             => 'Oak-Tar',
      'service.ranking'                                  => 100,
      'standby'                                          => true,
      'customBlobStore'                                  => true
    },
    'org.apache.jackrabbit.oak.segment.standby.store.StandbyStoreService' => {
      'org.apache.sling.installer.configuration.persist' => false,
      'mode'                                             => 'standby',
      'primary.host'                                     => $primary_host,
      'port'                                             => 8023,
      'secure'                                           => true,
      'interval'                                         => 5
    },
    'org.apache.jackrabbit.oak.plugins.blob.datastore.FileDataStore' => {
      'org.apache.sling.installer.configuration.persist' => false,
      'path'                                             => './crx-quickstart/repository/datastore',
      'minRecordLength'                                  => 16384
    }
  }

file { "${aem_home_dir}/crx-quickstart/launchpad/felix/bundle4/data/sling.id.file":
  ensure => absent,
}

file { "${aem_home_dir}/crx-quickstart/repository":
  ensure => absent,
  force  => true,
}

aem_resources::author_standby_set_config { 'Set author-primary config':
    aem_home_dir     => $aem_home_dir,
    aem_id           => $aem_id,
    aem_port         => $author_port,
    aem_user         => "aem-${aem_id}",
    aem_user_group   => "aem-${aem_id}",
    aem_version      => $aem_version,
    primary_host     => $primary_host,
    osgi_configs     => $osgi_configs
  }
}

include aem_curator::demo_config_author_standby

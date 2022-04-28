
class aem_curator::demo_config_author_primary (
  $author_port  = 4502,
  $aem_home_dir = '/opt/workspace/aem-workspace/workspaces/aem65/author/primary',
  $aem_id       = 'author',
  $aem_version  = '6.5'
) {
  $osgi_configs = {
    'org.apache.jackrabbit.oak.segment.SegmentNodeStoreService' => {
      'org.apache.sling.installer.configuration.persist' => false,
      'name'                                             => 'Oak-Tar',
      'service.ranking'                                  => 100,
      'standby'                                          => false,
      'customBlobStore'                                  => true
    },
    'org.apache.jackrabbit.oak.segment.standby.store.StandbyStoreService' => {
      'org.apache.sling.installer.configuration.persist' => false,
      'mode'                                             => 'primary',
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
aem_resources::author_primary_set_config { 'Set author-primary config':
    aem_home_dir     => $aem_home_dir,
    aem_id           => $aem_id,
    aem_port         => $author_port,
    aem_user         => "aem-${aem_id}",
    aem_user_group   => "aem-${aem_id}",
    aem_version      => $aem_version,
    osgi_configs     => $osgi_configs
  }
}

include aem_curator::demo_config_author_primary

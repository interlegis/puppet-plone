# filestorage.pp

define plone::filestorage ( 
                            $instance_name,
                            $install_dir,
                    ) {

  plone::buildoutpart { "filestorage_$name":
    part_name    => "filestorage",
    cfghash      => { recipe => 'collective.recipe.filestorage',
                      location => 'var/filestorage/Data_%(fs_part_name)s.fs',
                      parts  => "$name",
                      blob-storage => 'var/blobstorage-%(fs_part_name)s',
                      zodb-mountpoint => '/%(fs_part_name)s',
                      add-mountpoint => 'true',
                      #backup => 'backup',
                    },
    buildout_dir => "${install_dir}/${$instance_name}",
    order        => '00',
  }


}
# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:05 -0500 2008
#
# == Synopsis
# Database Table: pluto_main.RepositorySource
#
# * primary keys: PK_RepositorySource
# * foreign keys: FK_OperatingSystem,FK_Distro,FK_RepositoryType
# * external keys: 
#
# == References
# * PlutoMain::LmceRepositoryType
# * PlutoMain::LmceDistro
# * PlutoMain::LmceOperatingSystem
#
# == Referenced By
# * PlutoMain::LmceRepositorySourceUrl
# * PlutoMain::LmcePackageSource
#
# == Database Table Columns
#   * PK_RepositorySource    [Type:int(11), Default:NULL, Key:PRI, Null:NO, Extra:auto_increment]
#   * FK_OperatingSystem     [Type:int(11), Default:NULL, Null:YES]
#   * FK_Distro              [Type:int(11), Default:NULL, Null:YES]
#   * FK_RepositoryType      [Type:int(11), Default:1, Null:NO]
#   * Description            [Type:varchar(30), Default:NULL, Null:NO]
#   * Define                 [Type:varchar(30), Default:NULL, Null:YES]
#   * Instructions           [Type:mediumtext, Default:NULL, Null:YES]
#   * psc_id                 [Type:int(11), Default:NULL, Key:UNI, Null:YES]
#   * psc_batch              [Type:int(11), Default:NULL, Null:YES]
#   * psc_user               [Type:int(11), Default:NULL, Null:YES]
#   * psc_frozen             [Type:tinyint(1), Default:0, Null:YES]
#   * psc_mod                [Type:timestamp, Default:CURRENT_TIMESTAMP, Null:YES]
#   * psc_restrict           [Type:int(11), Default:NULL, Null:YES]
#
# == Associations
# * belongs_to lmce_distro
# * belongs_to lmce_operating_system
# * belongs_to lmce_repository_type
# * has_many lmce_package_sources
# * has_many lmce_repository_source_urls
#

class PlutoMain::LmceRepositorySource < PlutoMainDatabase
  set_table_name "RepositorySource"
  set_primary_key "PK_RepositorySource"

  # foreign key references
  # FK_RepositorySource references PlutoMain::LmceRepositoryType (FK_RepositoryType)
  belongs_to  :lmce_repository_type,
      :class_name => "PlutoMain::LmceRepositoryType",
      :foreign_key => "FK_RepositoryType"

  # FK_RepositorySource references PlutoMain::LmceDistro (FK_Distro)
  belongs_to  :lmce_distro,
      :class_name => "PlutoMain::LmceDistro",
      :foreign_key => "FK_Distro"

  # FK_RepositorySource references PlutoMain::LmceOperatingSystem (FK_OperatingSystem)
  belongs_to  :lmce_operating_system,
      :class_name => "PlutoMain::LmceOperatingSystem",
      :foreign_key => "FK_OperatingSystem"

  # 1:n  (FK_RepositorySource)
  has_many  :lmce_repository_source_urls,
      :class_name => "PlutoMain::LmceRepositorySourceUrl",
      :foreign_key => "FK_RepositorySource"

  # 1:n  (FK_RepositorySource)
  has_many  :lmce_package_sources,
      :class_name => "PlutoMain::LmcePackageSource",
      :foreign_key => "FK_RepositorySource"

  # handle psc_mod timestamping

# Set the psc_mod timestamp to the current time when creating a record.
  def before_create
    self.psc_mod ||= Time.now
  end

# Set the psc_mod timestamp to the current time when updating a record.
  def before_update
    self.psc_mod = Time.now
  end

  # add your model extensions after this line

end


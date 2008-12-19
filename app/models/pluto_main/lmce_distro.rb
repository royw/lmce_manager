# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:05 -0500 2008
#
# == Synopsis
# Database Table: pluto_main.Distro
#
# * primary keys: PK_Distro
# * foreign keys: FK_OperatingSystem
# * external keys: 
#
# == References
# * PlutoMain::LmceOperatingSystem
#
# == Referenced By
# * PlutoMain::LmcePackageDirectory
# * PlutoMain::LmcePackageCompat
# * PlutoMain::LmceRepositorySource
# * PlutoMain::LmceInstallWizardDistro
# * PlutoMain::LmceDeviceTemplate
# * PlutoMain::LmcePackageSourceCompat
# * PlutoMain::LmcePackageDirectoryFile
#
# == Database Table Columns
#   * PK_Distro             [Type:int(11), Default:NULL, Key:PRI, Null:NO, Extra:auto_increment]
#   * Description           [Type:varchar(30), Default:NULL, Null:NO]
#   * Define                [Type:varchar(25), Default:NULL, Null:YES]
#   * FK_OperatingSystem    [Type:int(11), Default:0, Null:NO]
#   * Installer             [Type:varchar(100), Default:NULL, Null:YES]
#   * KickStartCD           [Type:varchar(100), Default:NULL, Null:YES]
#   * Binaries              [Type:varchar(100), Default:NULL, Null:YES]
#   * SourceCode            [Type:varchar(100), Default:NULL, Null:YES]
#   * Confirmed             [Type:tinyint(1), Default:0, Null:NO]
#   * Core                  [Type:tinyint(1), Default:0, Null:NO]
#   * MediaDirector         [Type:tinyint(1), Default:0, Null:NO]
#   * Orbiter               [Type:tinyint(1), Default:0, Null:NO]
#   * InstallerURL          [Type:varchar(100), Default:NULL, Null:YES]
#   * psc_id                [Type:int(11), Default:NULL, Key:UNI, Null:YES]
#   * psc_batch             [Type:int(11), Default:NULL, Null:YES]
#   * psc_user              [Type:int(11), Default:NULL, Null:YES]
#   * psc_frozen            [Type:tinyint(1), Default:0, Null:YES]
#   * psc_mod               [Type:timestamp, Default:CURRENT_TIMESTAMP, Null:YES]
#   * psc_restrict          [Type:int(11), Default:NULL, Null:YES]
#
# == Associations
# * belongs_to lmce_operating_system
# * has_many lmce_device_templates
# * has_many lmce_install_wizard_distros
# * has_many lmce_install_wizards
# * has_many lmce_package_compats
# * has_many lmce_package_directories
# * has_many lmce_package_directory_files
# * has_many lmce_package_source_compats
# * has_many lmce_packages
# * has_many lmce_repository_sources
#

class PlutoMain::LmceDistro < PlutoMainDatabase
  set_table_name "Distro"
  set_primary_key "PK_Distro"

  # foreign key references
  # FK_Distro references PlutoMain::LmceOperatingSystem (FK_OperatingSystem)
  belongs_to  :lmce_operating_system,
      :class_name => "PlutoMain::LmceOperatingSystem",
      :foreign_key => "FK_OperatingSystem"

  # n:n via through join table PlutoMain::LmcePackageDirectory  (FK_Distro)
  has_many  :lmce_package_directories,
      :class_name => "PlutoMain::LmcePackageDirectory",
      :foreign_key => "FK_Distro"
  has_many  :lmce_packages,
      :through => :lmce_package_directories

  # 1:n  (FK_Distro)
  has_many  :lmce_package_compats,
      :class_name => "PlutoMain::LmcePackageCompat",
      :foreign_key => "FK_Distro"

  # 1:n  (FK_Distro)
  has_many  :lmce_repository_sources,
      :class_name => "PlutoMain::LmceRepositorySource",
      :foreign_key => "FK_Distro"

  # n:n via through join table PlutoMain::LmceInstallWizardDistro  (FK_Distro)
  has_many  :lmce_install_wizard_distros,
      :class_name => "PlutoMain::LmceInstallWizardDistro",
      :foreign_key => "FK_Distro"
  has_many  :lmce_install_wizards,
      :through => :lmce_install_wizard_distros

  # 1:n  (FK_Distro)
  has_many  :lmce_device_templates,
      :class_name => "PlutoMain::LmceDeviceTemplate",
      :foreign_key => "FK_Distro"

  # 1:n  (FK_Distro)
  has_many  :lmce_package_source_compats,
      :class_name => "PlutoMain::LmcePackageSourceCompat",
      :foreign_key => "FK_Distro"

  # 1:n  (FK_Distro)
  has_many  :lmce_package_directory_files,
      :class_name => "PlutoMain::LmcePackageDirectoryFile",
      :foreign_key => "FK_Distro"

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


# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:05 -0500 2008
#
# == Synopsis
# Database Table: pluto_main.InstallWizard
#
# * primary keys: PK_InstallWizard
# * foreign keys: FK_DeviceTemplate
# * external keys: 
#
# == References
# * PlutoMain::LmceDeviceTemplate
#
# == Referenced By
# * PlutoMain::LmceInstallWizardDistro
#
# == Database Table Columns
#   * PK_InstallWizard     [Type:int(11), Default:NULL, Key:PRI, Null:NO, Extra:auto_increment]
#   * FK_DeviceTemplate    [Type:int(11), Default:0, Null:NO]
#   * Step                 [Type:int(11), Default:0, Null:NO]
#   * Default              [Type:tinyint(1), Default:0, Null:YES]
#   * Comments             [Type:tinytext, Default:NULL, Null:YES]
#   * psc_id               [Type:int(11), Default:NULL, Key:UNI, Null:YES]
#   * psc_batch            [Type:int(11), Default:NULL, Null:YES]
#   * psc_user             [Type:int(11), Default:NULL, Null:YES]
#   * psc_frozen           [Type:tinyint(1), Default:0, Null:YES]
#   * psc_mod              [Type:timestamp, Default:CURRENT_TIMESTAMP, Null:YES]
#   * psc_restrict         [Type:int(11), Default:NULL, Null:YES]
#
# == Associations
# * belongs_to lmce_device_template
# * has_many lmce_distros
# * has_many lmce_install_wizard_distros
#

class PlutoMain::LmceInstallWizard < PlutoMainDatabase
  set_table_name "InstallWizard"
  set_primary_key "PK_InstallWizard"

  # foreign key references
  # FK_InstallWizard references PlutoMain::LmceDeviceTemplate (FK_DeviceTemplate)
  belongs_to  :lmce_device_template,
      :class_name => "PlutoMain::LmceDeviceTemplate",
      :foreign_key => "FK_DeviceTemplate"

  # n:n via through join table PlutoMain::LmceInstallWizardDistro  (FK_InstallWizard)
  has_many  :lmce_install_wizard_distros,
      :class_name => "PlutoMain::LmceInstallWizardDistro",
      :foreign_key => "FK_InstallWizard"
  has_many  :lmce_distros,
      :through => :lmce_install_wizard_distros

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


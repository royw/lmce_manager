# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:04 -0500 2008
#
# == Synopsis
# Database Table: pluto_main.ConfigType
#
# * primary keys: PK_ConfigType
# * foreign keys: FK_DeviceTemplate,FK_DeviceCategory
# * external keys: 
#
# == References
# * PlutoMain::LmceDeviceTemplate
# * PlutoMain::LmceDeviceCategory
#
# == Referenced By
# * PlutoMain::LmceConfigTypeSetting
# * PlutoMain::LmceConfigTypeFile
#
# == Database Table Columns
#   * PK_ConfigType        [Type:int(11), Default:NULL, Key:PRI, Null:NO, Extra:auto_increment]
#   * Description          [Type:text, Default:NULL, Null:NO]
#   * Define               [Type:text, Default:NULL, Null:NO]
#   * FK_DeviceTemplate    [Type:int(11), Default:NULL, Null:YES]
#   * FK_DeviceCategory    [Type:int(11), Default:NULL, Null:YES]
#   * psc_id               [Type:int(11), Default:NULL, Key:UNI, Null:YES]
#   * psc_batch            [Type:int(11), Default:NULL, Null:YES]
#   * psc_user             [Type:int(11), Default:NULL, Null:YES]
#   * psc_frozen           [Type:tinyint(1), Default:0, Null:YES]
#   * psc_mod              [Type:timestamp, Default:CURRENT_TIMESTAMP, Null:YES]
#   * psc_restrict         [Type:int(11), Default:NULL, Null:YES]
#
# == Associations
# * belongs_to lmce_device_category
# * belongs_to lmce_device_template
# * has_many lmce_config_type_files
# * has_many lmce_config_type_settings
#

class PlutoMain::LmceConfigType < PlutoMainDatabase
  set_table_name "ConfigType"
  set_primary_key "PK_ConfigType"

  # foreign key references
  # FK_ConfigType references PlutoMain::LmceDeviceTemplate (FK_DeviceTemplate)
  belongs_to  :lmce_device_template,
      :class_name => "PlutoMain::LmceDeviceTemplate",
      :foreign_key => "FK_DeviceTemplate"

  # FK_ConfigType references PlutoMain::LmceDeviceCategory (FK_DeviceCategory)
  belongs_to  :lmce_device_category,
      :class_name => "PlutoMain::LmceDeviceCategory",
      :foreign_key => "FK_DeviceCategory"

  # 1:n  (FK_ConfigType)
  has_many  :lmce_config_type_settings,
      :class_name => "PlutoMain::LmceConfigTypeSetting",
      :foreign_key => "FK_ConfigType"

  # 1:n  (FK_ConfigType)
  has_many  :lmce_config_type_files,
      :class_name => "PlutoMain::LmceConfigTypeFile",
      :foreign_key => "FK_ConfigType"

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


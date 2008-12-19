# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:04 -0500 2008
#
# == Synopsis
# Database Table: pluto_main.DeviceGroup
#
# * primary keys: PK_DeviceGroup
# * foreign keys: FK_DeviceGroup_Parent,FK_Installation
# * external keys: 
#
# == References
# * PlutoMain::LmceInstallation
#
# == Referenced By
# * PlutoMain::LmceDeviceDeviceGroup
# * PlutoMain::LmceCommandGroupCommand
#
# == Database Table Columns
#   * PK_DeviceGroup           [Type:int(11), Default:NULL, Key:PRI, Null:NO, Extra:auto_increment]
#   * FK_DeviceGroup_Parent    [Type:int(11), Default:NULL, Null:YES]
#   * FK_Installation          [Type:int(11), Default:NULL, Null:YES]
#   * Description              [Type:varchar(50), Default:NULL, Null:NO]
#   * Type                     [Type:int(11), Default:NULL, Null:YES]
#   * psc_id                   [Type:int(11), Default:NULL, Key:UNI, Null:YES]
#   * psc_batch                [Type:int(11), Default:NULL, Null:YES]
#   * psc_user                 [Type:int(11), Default:NULL, Null:YES]
#   * psc_frozen               [Type:tinyint(1), Default:0, Null:YES]
#   * psc_mod                  [Type:timestamp, Default:CURRENT_TIMESTAMP, Null:YES]
#   * psc_restrict             [Type:int(11), Default:NULL, Null:YES]
#
# == Associations
# * belongs_to lmce_installation
# * belongs_to parent
# * has_many device_group_parents
# * has_many lmce_command_group_commands
# * has_many lmce_command_groups
# * has_many lmce_device_device_groups
# * has_many lmce_devices
# * has_many lmce_mode_changes
#

require 'pluto_security/lmce_mode_change'

include PlutoSecurity

class PlutoMain::LmceDeviceGroup < PlutoMainDatabase
  set_table_name "DeviceGroup"
  set_primary_key "PK_DeviceGroup"

  # foreign key references
  # FK_DeviceGroup references PlutoMain::LmceInstallation (FK_Installation)
  belongs_to  :lmce_installation,
      :class_name => "PlutoMain::LmceInstallation",
      :foreign_key => "FK_Installation"

  # n:n via through join table PlutoMain::LmceDeviceDeviceGroup  (FK_DeviceGroup)
  has_many  :lmce_device_device_groups,
      :class_name => "PlutoMain::LmceDeviceDeviceGroup",
      :foreign_key => "FK_DeviceGroup"
  has_many  :lmce_devices,
      :through => :lmce_device_device_groups

  # n:n via through join table PlutoMain::LmceCommandGroupCommand  (FK_DeviceGroup)
  has_many  :lmce_command_group_commands,
      :class_name => "PlutoMain::LmceCommandGroupCommand",
      :foreign_key => "FK_DeviceGroup"
  has_many  :lmce_command_groups,
      :through => :lmce_command_group_commands

  # external key references
  # 1:n  (EK_DeviceGroup)
  has_many  :lmce_mode_changes,
      :class_name => "PlutoSecurity::LmceModeChange",
      :foreign_key => "EK_DeviceGroup"

  # self references
  belongs_to  :parent,
      :class_name => "PlutoMain::LmceDeviceGroup",
      :foreign_key => "FK_DeviceGroup_Parent"
  has_many  :device_group_parents,
      :class_name => "PlutoMain::LmceDeviceGroup",
      :foreign_key => "FK_DeviceGroup_Parent"
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


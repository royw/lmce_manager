# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:05 -0500 2008
#
# == Synopsis
# Database Table: pluto_main.RemoteControl
#
# * primary keys: PK_RemoteControl
# * foreign keys: FK_Orbiter,FK_DeviceTemplate_MediaType_DesignObj,FK_MediaType_DesignObj
# * external keys: 
#
# == References
# * PlutoMain::LmceMediaTypeDesignObj
# * PlutoMain::LmceDeviceTemplateMediaTypeDesignObj
# * PlutoMain::LmceOrbiter
#
# == Referenced By
#
# == Database Table Columns
#   * PK_RemoteControl                         [Type:int(11), Default:NULL, Key:PRI, Null:NO, Extra:auto_increment]
#   * FK_Orbiter                               [Type:int(11), Default:NULL, Null:YES]
#   * FK_DeviceTemplate_MediaType_DesignObj    [Type:int(11), Default:NULL, Null:YES]
#   * FK_MediaType_DesignObj                   [Type:int(11), Default:NULL, Null:YES]
#   * psc_id                                   [Type:int(11), Default:NULL, Null:YES]
#   * psc_batch                                [Type:int(11), Default:NULL, Null:YES]
#   * psc_user                                 [Type:int(11), Default:NULL, Null:YES]
#   * psc_frozen                               [Type:tinyint(1), Default:0, Null:YES]
#   * psc_mod                                  [Type:timestamp, Default:CURRENT_TIMESTAMP, Null:YES]
#   * psc_restrict                             [Type:int(11), Default:NULL, Null:YES]
#
# == Associations
# * belongs_to lmce_device_template_media_type_design_obj
# * belongs_to lmce_media_type_design_obj
# * belongs_to lmce_orbiter
#

class PlutoMain::LmceRemoteControl < PlutoMainDatabase
  set_table_name "RemoteControl"
  set_primary_key "PK_RemoteControl"

  # foreign key references
  # FK_RemoteControl references PlutoMain::LmceMediaTypeDesignObj (FK_MediaType_DesignObj)
  belongs_to  :lmce_media_type_design_obj,
      :class_name => "PlutoMain::LmceMediaTypeDesignObj",
      :foreign_key => "FK_MediaType_DesignObj"

  # FK_RemoteControl references PlutoMain::LmceDeviceTemplateMediaTypeDesignObj (FK_DeviceTemplate_MediaType_DesignObj)
  belongs_to  :lmce_device_template_media_type_design_obj,
      :class_name => "PlutoMain::LmceDeviceTemplateMediaTypeDesignObj",
      :foreign_key => "FK_DeviceTemplate_MediaType_DesignObj"

  # FK_RemoteControl references PlutoMain::LmceOrbiter (FK_Orbiter)
  belongs_to  :lmce_orbiter,
      :class_name => "PlutoMain::LmceOrbiter",
      :foreign_key => "FK_Orbiter"

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


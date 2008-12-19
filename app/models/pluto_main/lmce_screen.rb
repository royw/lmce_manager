# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:05 -0500 2008
#
# == Synopsis
# Database Table: pluto_main.Screen
#
# * primary keys: PK_Screen
# * foreign keys: 
# * external keys: 
#
# == References
#
# == Referenced By
# * PlutoMain::LmceDeviceTemplateMediaTypeDesignObj
# * PlutoMain::LmceScreenCommandParameter
# * PlutoMain::LmceScreenDesignObj
# * PlutoMain::LmceMediaTypeDesignObj
#
# == Database Table Columns
#   * PK_Screen                    [Type:int(11), Default:NULL, Key:PRI, Null:NO, Extra:auto_increment]
#   * Description                  [Type:varchar(40), Default:NULL, Null:YES]
#   * Define                       [Type:varchar(20), Default:NULL, Null:YES]
#   * Comments                     [Type:text, Default:NULL, Null:YES]
#   * SpecialHandingRecommended    [Type:tinyint(1), Default:NULL, Null:YES]
#   * AlwaysInclude                [Type:tinyint(1), Default:NULL, Null:YES]
#   * PreserveCallBacks            [Type:tinyint(1), Default:0, Null:YES]
#   * GoBackToScreen               [Type:tinyint(1), Default:0, Null:NO]
#   * AllowInterruptions           [Type:tinyint(1), Default:1, Null:NO]
#   * psc_id                       [Type:int(11), Default:NULL, Null:YES]
#   * psc_batch                    [Type:int(11), Default:NULL, Null:YES]
#   * psc_user                     [Type:int(11), Default:NULL, Null:YES]
#   * psc_frozen                   [Type:tinyint(1), Default:0, Null:YES]
#   * psc_mod                      [Type:timestamp, Default:CURRENT_TIMESTAMP, Null:YES]
#   * psc_restrict                 [Type:int(11), Default:NULL, Null:YES]
#
# == Associations
# * has_many lmce_command_parameters
# * has_many lmce_design_objs
# * has_many lmce_device_template_media_type_design_objs
# * has_many lmce_media_type_design_objs
# * has_many lmce_screen_command_parameters
# * has_many lmce_screen_design_objs
# * has_many lmce_screen_order
#

require 'pluto_media/lmce_download_source'

include PlutoMedia

class PlutoMain::LmceScreen < PlutoMainDatabase
  set_table_name "Screen"
  set_primary_key "PK_Screen"

  # foreign key references
  # 1:n  (FK_Screen)
  has_many  :lmce_device_template_media_type_design_objs,
      :class_name => "PlutoMain::LmceDeviceTemplateMediaTypeDesignObj",
      :foreign_key => "FK_Screen"

  # n:n via through join table PlutoMain::LmceScreenCommandParameter  (FK_Screen)
  has_many  :lmce_screen_command_parameters,
      :class_name => "PlutoMain::LmceScreenCommandParameter",
      :foreign_key => "FK_Screen"
  has_many  :lmce_command_parameters,
      :through => :lmce_screen_command_parameters

  # n:n via through join table PlutoMain::LmceScreenDesignObj  (FK_Screen)
  has_many  :lmce_screen_design_objs,
      :class_name => "PlutoMain::LmceScreenDesignObj",
      :foreign_key => "FK_Screen"
  has_many  :lmce_design_objs,
      :through => :lmce_screen_design_objs

  # 1:n  (FK_Screen)
  has_many  :lmce_media_type_design_objs,
      :class_name => "PlutoMain::LmceMediaTypeDesignObj",
      :foreign_key => "FK_Screen"

  # external key references
  # 1:n  (EK_Screen_Order)
  has_many  :lmce_screen_order,
      :class_name => "PlutoMedia::LmceDownloadSource",
      :foreign_key => "EK_Screen_Order"

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


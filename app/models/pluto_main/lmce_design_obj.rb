# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:04 -0500 2008
#
# == Synopsis
# Database Table: pluto_main.DesignObj
#
# * primary keys: PK_DesignObj
# * foreign keys: FK_DesignObjType,FK_DesignObjCategory,FK_DesignObj_IncludeIfOtherIncluded,FK_StabilityStatus,FK_DesignObj_SubstForSkin,FK_Skin_SubstForSkin
# * external keys: 
#
# == References
# * PlutoMain::LmceDesignObjCategory
# * PlutoMain::LmceStabilityStatus
# * PlutoMain::LmceDesignObjType
#
# == Referenced By
# * PlutoMain::LmceCachedScreen
# * PlutoMain::LmceScreenDesignObj
# * PlutoMain::LmceQuickStartTemplate
# * PlutoMain::LmceMediaType
# * PlutoMain::LmceDevice
# * PlutoMain::LmceDesignObjVariation
# * PlutoMain::LmceCommandGroup
# * PlutoMain::LmceDeviceTemplateDesignObj
#
# == Database Table Columns
#   * PK_DesignObj                           [Type:int(11), Default:NULL, Key:PRI, Null:NO, Extra:auto_increment]
#   * Description                            [Type:varchar(30), Default:NULL, Null:NO]
#   * Define                                 [Type:varchar(20), Default:NULL, Null:YES]
#   * FK_DesignObjType                       [Type:int(11), Default:0, Null:NO]
#   * FK_DesignObjCategory                   [Type:int(11), Default:0, Null:NO]
#   * FK_DesignObj_IncludeIfOtherIncluded    [Type:int(11), Default:NULL, Null:YES]
#   * Priority                               [Type:tinyint(4), Default:0, Null:NO]
#   * KeepGraphicInCache                     [Type:tinyint(4), Default:0, Null:NO]
#   * AlwaysInclude                          [Type:tinyint(4), Default:0, Null:NO]
#   * CantGoBack                             [Type:tinyint(4), Default:0, Null:NO]
#   * CommandsProcessedAtServer              [Type:tinyint(4), Default:0, Null:NO]
#   * TimeoutSeconds                         [Type:smallint(6), Default:NULL, Null:YES]
#   * Animate                                [Type:tinyint(4), Default:0, Null:NO]
#   * FK_StabilityStatus                     [Type:int(11), Default:1, Null:NO]
#   * CanGoBackToSameScreen                  [Type:tinyint(1), Default:0, Null:NO]
#   * ScreenType                             [Type:char(1), Default:NULL, Null:YES]
#   * FK_DesignObj_SubstForSkin              [Type:int(11), Default:NULL, Null:YES]
#   * FK_Skin_SubstForSkin                   [Type:int(11), Default:NULL, Null:YES]
#   * psc_id                                 [Type:int(11), Default:NULL, Key:UNI, Null:YES]
#   * psc_batch                              [Type:int(11), Default:NULL, Null:YES]
#   * psc_user                               [Type:int(11), Default:NULL, Null:YES]
#   * psc_frozen                             [Type:tinyint(1), Default:0, Null:YES]
#   * psc_mod                                [Type:timestamp, Default:CURRENT_TIMESTAMP, Null:YES]
#   * psc_restrict                           [Type:int(11), Default:NULL, Null:YES]
#
# == Associations
# * belongs_to include_if_other_included
# * belongs_to lmce_design_obj_category
# * belongs_to lmce_design_obj_type
# * belongs_to lmce_stability_status
# * belongs_to subst_for_skin
# * has_many design_obj_include_if_other_includeds
# * has_many design_obj_subst_for_skins
# * has_many lmce_cached_screens
# * has_many lmce_command_groups
# * has_many lmce_design_obj_popup
# * has_many lmce_design_obj_variations
# * has_many lmce_device_template_design_objs
# * has_many lmce_device_templates
# * has_many lmce_devices
# * has_many lmce_media_types
# * has_many lmce_quick_start_templates
# * has_many lmce_screen_design_objs
# * has_many lmce_screens
#

require 'pluto_media/lmce_download_source'

include PlutoMedia

class PlutoMain::LmceDesignObj < PlutoMainDatabase
  set_table_name "DesignObj"
  set_primary_key "PK_DesignObj"

  # foreign key references
  # FK_DesignObj references PlutoMain::LmceDesignObjCategory (FK_DesignObjCategory)
  belongs_to  :lmce_design_obj_category,
      :class_name => "PlutoMain::LmceDesignObjCategory",
      :foreign_key => "FK_DesignObjCategory"

  # FK_DesignObj references PlutoMain::LmceStabilityStatus (FK_StabilityStatus)
  belongs_to  :lmce_stability_status,
      :class_name => "PlutoMain::LmceStabilityStatus",
      :foreign_key => "FK_StabilityStatus"

  # FK_DesignObj references PlutoMain::LmceDesignObjType (FK_DesignObjType)
  belongs_to  :lmce_design_obj_type,
      :class_name => "PlutoMain::LmceDesignObjType",
      :foreign_key => "FK_DesignObjType"

  # 1:n  (FK_DesignObj)
  has_many  :lmce_cached_screens,
      :class_name => "PlutoMain::LmceCachedScreen",
      :foreign_key => "FK_DesignObj"

  # n:n via through join table PlutoMain::LmceScreenDesignObj  (FK_DesignObj)
  has_many  :lmce_screen_design_objs,
      :class_name => "PlutoMain::LmceScreenDesignObj",
      :foreign_key => "FK_DesignObj"
  has_many  :lmce_screens,
      :through => :lmce_screen_design_objs

  # 1:n  (FK_DesignObj)
  has_many  :lmce_quick_start_templates,
      :class_name => "PlutoMain::LmceQuickStartTemplate",
      :foreign_key => "FK_DesignObj"

  # 1:n  (FK_DesignObj)
  has_many  :lmce_media_types,
      :class_name => "PlutoMain::LmceMediaType",
      :foreign_key => "FK_DesignObj"

  # 1:n  (FK_DesignObj)
  has_many  :lmce_devices,
      :class_name => "PlutoMain::LmceDevice",
      :foreign_key => "FK_DesignObj"

  # 1:n  (FK_DesignObj)
  has_many  :lmce_design_obj_variations,
      :class_name => "PlutoMain::LmceDesignObjVariation",
      :foreign_key => "FK_DesignObj"

  # 1:n  (FK_DesignObj)
  has_many  :lmce_command_groups,
      :class_name => "PlutoMain::LmceCommandGroup",
      :foreign_key => "FK_DesignObj"

  # n:n via through join table PlutoMain::LmceDeviceTemplateDesignObj  (FK_DesignObj)
  has_many  :lmce_device_template_design_objs,
      :class_name => "PlutoMain::LmceDeviceTemplateDesignObj",
      :foreign_key => "FK_DesignObj"
  has_many  :lmce_device_templates,
      :through => :lmce_device_template_design_objs

  # external key references
  # 1:n  (EK_DesignObj_Popup)
  has_many  :lmce_design_obj_popup,
      :class_name => "PlutoMedia::LmceDownloadSource",
      :foreign_key => "EK_DesignObj_Popup"

  # self references
  belongs_to  :include_if_other_included,
      :class_name => "PlutoMain::LmceDesignObj",
      :foreign_key => "FK_DesignObj_IncludeIfOtherIncluded"
  has_many  :design_obj_include_if_other_includeds,
      :class_name => "PlutoMain::LmceDesignObj",
      :foreign_key => "FK_DesignObj_IncludeIfOtherIncluded"
  belongs_to  :subst_for_skin,
      :class_name => "PlutoMain::LmceDesignObj",
      :foreign_key => "FK_DesignObj_SubstForSkin"
  has_many  :design_obj_subst_for_skins,
      :class_name => "PlutoMain::LmceDesignObj",
      :foreign_key => "FK_DesignObj_SubstForSkin"
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


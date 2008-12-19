# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:05 -0500 2008
#
# == Synopsis
# Database Table: pluto_main.Skin
#
# * primary keys: PK_Skin
# * foreign keys: FK_UI,FK_Style,FK_Skin_TextPlacement,FK_StabilityStatus,FK_Screen_MainMenu,FK_Screen_Sleeping,FK_Screen_ScreenSaver,FK_Package
# * external keys: 
#
# == References
# * PlutoMain::LmceUi
# * PlutoMain::LmcePackage
# * PlutoMain::LmceStyle
# * PlutoMain::LmceStabilityStatus
#
# == Referenced By
# * PlutoMain::LmceDesignObjVariationDesignObjParameter
# * PlutoMain::LmceMediaTypeDesignObj
# * PlutoMain::LmceEffectTypeEffectSkin
# * PlutoMain::LmceDesignObjVariationTextSkinLanguage
# * PlutoMain::LmceDesignObjVariationDesignObjSkinLanguage
# * PlutoMain::LmceDeviceTemplateMediaTypeDesignObj
# * PlutoMain::LmceScreenDesignObj
# * PlutoMain::LmceStyleVariation
#
# == Database Table Columns
#   * PK_Skin                   [Type:int(11), Default:NULL, Key:PRI, Null:NO, Extra:auto_increment]
#   * Description               [Type:varchar(30), Default:NULL, Null:NO]
#   * Define                    [Type:varchar(30), Default:NULL, Null:YES]
#   * FK_UI                     [Type:int(11), Default:NULL, Null:YES]
#   * MergeStandardVariation    [Type:tinyint(1), Default:1, Null:NO]
#   * DataSubdirectory          [Type:varchar(30), Default:NULL, Null:YES]
#   * FK_Style                  [Type:int(11), Default:NULL, Null:YES]
#   * FK_Skin_TextPlacement     [Type:int(11), Default:NULL, Null:YES]
#   * DrawTextBeforeChildren    [Type:tinyint(4), Default:0, Null:NO]
#   * FK_StabilityStatus        [Type:int(11), Default:1, Null:NO]
#   * FK_Screen_MainMenu        [Type:int(11), Default:1, Null:NO]
#   * FK_Screen_Sleeping        [Type:int(11), Default:29, Null:NO]
#   * FK_Screen_ScreenSaver     [Type:int(11), Default:74, Null:NO]
#   * FK_Package                [Type:int(11), Default:NULL, Null:YES]
#   * psc_id                    [Type:int(11), Default:NULL, Key:UNI, Null:YES]
#   * psc_batch                 [Type:int(11), Default:NULL, Null:YES]
#   * psc_user                  [Type:int(11), Default:NULL, Null:YES]
#   * psc_frozen                [Type:tinyint(1), Default:0, Null:YES]
#   * psc_mod                   [Type:timestamp, Default:CURRENT_TIMESTAMP, Null:YES]
#   * psc_restrict              [Type:int(11), Default:NULL, Null:YES]
#
# == Associations
# * belongs_to lmce_package
# * belongs_to lmce_stability_status
# * belongs_to lmce_style
# * belongs_to lmce_ui
# * belongs_to text_placement
# * has_many lmce_design_obj_variation_design_obj_parameters
# * has_many lmce_design_obj_variation_design_obj_skin_languages
# * has_many lmce_design_obj_variation_text_skin_languages
# * has_many lmce_design_obj_variations
# * has_many lmce_device_template_media_type_design_objs
# * has_many lmce_effect_type_effect_skins
# * has_many lmce_effect_types
# * has_many lmce_media_type_design_objs
# * has_many lmce_screen_design_objs
# * has_many lmce_screens
# * has_many lmce_style_variations
# * has_many skin_text_placements
#

class PlutoMain::LmceSkin < PlutoMainDatabase
  set_table_name "Skin"
  set_primary_key "PK_Skin"

  # foreign key references
  # FK_Skin references PlutoMain::LmceUi (FK_UI)
  belongs_to  :lmce_ui,
      :class_name => "PlutoMain::LmceUi",
      :foreign_key => "FK_UI"

  # FK_Skin references PlutoMain::LmcePackage (FK_Package)
  belongs_to  :lmce_package,
      :class_name => "PlutoMain::LmcePackage",
      :foreign_key => "FK_Package"

  # FK_Skin references PlutoMain::LmceStyle (FK_Style)
  belongs_to  :lmce_style,
      :class_name => "PlutoMain::LmceStyle",
      :foreign_key => "FK_Style"

  # FK_Skin references PlutoMain::LmceStabilityStatus (FK_StabilityStatus)
  belongs_to  :lmce_stability_status,
      :class_name => "PlutoMain::LmceStabilityStatus",
      :foreign_key => "FK_StabilityStatus"

  # n:n via through join table PlutoMain::LmceDesignObjVariationDesignObjParameter  (FK_Skin)
  has_many  :lmce_design_obj_variation_design_obj_parameters,
      :class_name => "PlutoMain::LmceDesignObjVariationDesignObjParameter",
      :foreign_key => "FK_Skin"
  has_many  :lmce_design_obj_variations,
      :through => :lmce_design_obj_variation_design_obj_parameters

  # 1:n  (FK_Skin)
  has_many  :lmce_media_type_design_objs,
      :class_name => "PlutoMain::LmceMediaTypeDesignObj",
      :foreign_key => "FK_Skin"

  # n:n via through join table PlutoMain::LmceEffectTypeEffectSkin  (FK_Skin)
  has_many  :lmce_effect_type_effect_skins,
      :class_name => "PlutoMain::LmceEffectTypeEffectSkin",
      :foreign_key => "FK_Skin"
  has_many  :lmce_effect_types,
      :through => :lmce_effect_type_effect_skins

  # 1:n  (FK_Skin)
  has_many  :lmce_design_obj_variation_text_skin_languages,
      :class_name => "PlutoMain::LmceDesignObjVariationTextSkinLanguage",
      :foreign_key => "FK_Skin"

  # 1:n  (FK_Skin)
  has_many  :lmce_design_obj_variation_design_obj_skin_languages,
      :class_name => "PlutoMain::LmceDesignObjVariationDesignObjSkinLanguage",
      :foreign_key => "FK_Skin"

  # 1:n  (FK_Skin)
  has_many  :lmce_device_template_media_type_design_objs,
      :class_name => "PlutoMain::LmceDeviceTemplateMediaTypeDesignObj",
      :foreign_key => "FK_Skin"

  # n:n via through join table PlutoMain::LmceScreenDesignObj  (FK_Skin)
  has_many  :lmce_screen_design_objs,
      :class_name => "PlutoMain::LmceScreenDesignObj",
      :foreign_key => "FK_Skin"
  has_many  :lmce_screens,
      :through => :lmce_screen_design_objs

  # 1:n  (FK_Skin)
  has_many  :lmce_style_variations,
      :class_name => "PlutoMain::LmceStyleVariation",
      :foreign_key => "FK_Skin"

  # self references
  belongs_to  :text_placement,
      :class_name => "PlutoMain::LmceSkin",
      :foreign_key => "FK_Skin_TextPlacement"
  has_many  :skin_text_placements,
      :class_name => "PlutoMain::LmceSkin",
      :foreign_key => "FK_Skin_TextPlacement"
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


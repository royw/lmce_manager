# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:04 -0500 2008
#
# == Synopsis
# Database Table: pluto_main.DesignObjVariation_Text_Skin_Language
#
# * primary keys: PK_DesignObjVariation_Text_Skin_Language
# * foreign keys: FK_DesignObjVariation_Text,FK_Skin,FK_Language,FK_HorizAlignment,FK_VertAlignment,FK_Style
# * external keys: 
#
# == References
# * PlutoMain::LmceLanguage
# * PlutoMain::LmceDesignObjVariationText
# * PlutoMain::LmceStyle
# * PlutoMain::LmceSkin
# * PlutoMain::LmceHorizAlignment
# * PlutoMain::LmceVertAlignment
#
# == Referenced By
#
# == Database Table Columns
#   * PK_DesignObjVariation_Text_Skin_Language    [Type:int(11), Default:NULL, Key:PRI, Null:NO, Extra:auto_increment]
#   * FK_DesignObjVariation_Text                  [Type:int(11), Default:0, Null:NO]
#   * FK_Skin                                     [Type:int(11), Default:NULL, Null:YES]
#   * FK_Language                                 [Type:int(11), Default:NULL, Null:YES]
#   * X                                           [Type:int(11), Default:0, Null:NO]
#   * Y                                           [Type:int(11), Default:0, Null:NO]
#   * Width                                       [Type:int(11), Default:0, Null:NO]
#   * Height                                      [Type:int(11), Default:0, Null:NO]
#   * Rotate                                      [Type:int(11), Default:NULL, Null:YES]
#   * Opacity                                     [Type:int(11), Default:NULL, Null:YES]
#   * FK_HorizAlignment                           [Type:int(11), Default:NULL, Null:YES]
#   * FK_VertAlignment                            [Type:int(11), Default:NULL, Null:YES]
#   * FK_Style                                    [Type:int(11), Default:NULL, Null:YES]
#   * PlainBackgroundColor                        [Type:int(11), Default:NULL, Null:YES]
#   * psc_id                                      [Type:int(11), Default:NULL, Key:UNI, Null:YES]
#   * psc_batch                                   [Type:int(11), Default:NULL, Null:YES]
#   * psc_user                                    [Type:int(11), Default:NULL, Null:YES]
#   * psc_frozen                                  [Type:tinyint(1), Default:0, Null:YES]
#   * psc_mod                                     [Type:timestamp, Default:CURRENT_TIMESTAMP, Null:YES]
#   * psc_restrict                                [Type:int(11), Default:NULL, Null:YES]
#
# == Associations
# * belongs_to lmce_design_obj_variation_text
# * belongs_to lmce_horiz_alignment
# * belongs_to lmce_language
# * belongs_to lmce_skin
# * belongs_to lmce_style
# * belongs_to lmce_vert_alignment
#

class PlutoMain::LmceDesignObjVariationTextSkinLanguage < PlutoMainDatabase
  set_table_name "DesignObjVariation_Text_Skin_Language"
  set_primary_key "PK_DesignObjVariation_Text_Skin_Language"

  # foreign key references
  # FK_DesignObjVariation_Text_Skin_Language references PlutoMain::LmceLanguage (FK_Language)
  belongs_to  :lmce_language,
      :class_name => "PlutoMain::LmceLanguage",
      :foreign_key => "FK_Language"

  # FK_DesignObjVariation_Text_Skin_Language references PlutoMain::LmceDesignObjVariationText (FK_DesignObjVariation_Text)
  belongs_to  :lmce_design_obj_variation_text,
      :class_name => "PlutoMain::LmceDesignObjVariationText",
      :foreign_key => "FK_DesignObjVariation_Text"

  # FK_DesignObjVariation_Text_Skin_Language references PlutoMain::LmceStyle (FK_Style)
  belongs_to  :lmce_style,
      :class_name => "PlutoMain::LmceStyle",
      :foreign_key => "FK_Style"

  # FK_DesignObjVariation_Text_Skin_Language references PlutoMain::LmceSkin (FK_Skin)
  belongs_to  :lmce_skin,
      :class_name => "PlutoMain::LmceSkin",
      :foreign_key => "FK_Skin"

  # FK_DesignObjVariation_Text_Skin_Language references PlutoMain::LmceHorizAlignment (FK_HorizAlignment)
  belongs_to  :lmce_horiz_alignment,
      :class_name => "PlutoMain::LmceHorizAlignment",
      :foreign_key => "FK_HorizAlignment"

  # FK_DesignObjVariation_Text_Skin_Language references PlutoMain::LmceVertAlignment (FK_VertAlignment)
  belongs_to  :lmce_vert_alignment,
      :class_name => "PlutoMain::LmceVertAlignment",
      :foreign_key => "FK_VertAlignment"

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


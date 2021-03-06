# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:04 -0500 2008
#
# == Synopsis
# Database Table: pluto_main.DesignObjVariation_DesignObjParameter
# Through Join Table
#
# * primary keys: FK_DesignObjVariation,FK_DesignObjParameter
# * foreign keys: FK_DesignObjVariation,FK_DesignObjParameter,FK_Skin,FK_Language
# * external keys: 
#
# == References
# * PlutoMain::LmceDesignObjParameter
# * PlutoMain::LmceSkin
# * PlutoMain::LmceDesignObjVariation
# * PlutoMain::LmceLanguage
#
# == Referenced By
#
# == Database Table Columns
#   * FK_DesignObjVariation    [Type:int(11), Default:0, Key:PRI, Null:NO]
#   * FK_DesignObjParameter    [Type:int(11), Default:0, Key:PRI, Null:NO]
#   * Value                    [Type:text, Default:NULL, Null:YES]
#   * FK_Skin                  [Type:int(11), Default:NULL, Null:YES]
#   * FK_Language              [Type:int(11), Default:NULL, Null:YES]
#   * Ignore                   [Type:tinyint(1), Default:0, Null:NO]
#   * psc_id                   [Type:int(11), Default:NULL, Key:UNI, Null:YES]
#   * psc_batch                [Type:int(11), Default:NULL, Null:YES]
#   * psc_user                 [Type:int(11), Default:NULL, Null:YES]
#   * psc_frozen               [Type:tinyint(1), Default:0, Null:YES]
#   * psc_mod                  [Type:timestamp, Default:CURRENT_TIMESTAMP, Null:YES]
#   * psc_restrict             [Type:int(11), Default:NULL, Null:YES]
#
# == Associations
# * belongs_to lmce_design_obj_parameter
# * belongs_to lmce_design_obj_variation
# * belongs_to lmce_language
# * belongs_to lmce_skin
#

class PlutoMain::LmceDesignObjVariationDesignObjParameter < PlutoMainDatabase
  set_table_name "DesignObjVariation_DesignObjParameter"
  set_primary_keys "FK_DesignObjVariation", "FK_DesignObjParameter"

  # foreign key references
  # FK_DesignObjVariation_DesignObjParameter references PlutoMain::LmceDesignObjParameter (FK_DesignObjParameter)
  belongs_to  :lmce_design_obj_parameter,
      :class_name => "PlutoMain::LmceDesignObjParameter",
      :foreign_key => "FK_DesignObjParameter"

  # FK_DesignObjVariation_DesignObjParameter references PlutoMain::LmceSkin (FK_Skin)
  belongs_to  :lmce_skin,
      :class_name => "PlutoMain::LmceSkin",
      :foreign_key => "FK_Skin"

  # FK_DesignObjVariation_DesignObjParameter references PlutoMain::LmceDesignObjVariation (FK_DesignObjVariation)
  belongs_to  :lmce_design_obj_variation,
      :class_name => "PlutoMain::LmceDesignObjVariation",
      :foreign_key => "FK_DesignObjVariation"

  # FK_DesignObjVariation_DesignObjParameter references PlutoMain::LmceLanguage (FK_Language)
  belongs_to  :lmce_language,
      :class_name => "PlutoMain::LmceLanguage",
      :foreign_key => "FK_Language"

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


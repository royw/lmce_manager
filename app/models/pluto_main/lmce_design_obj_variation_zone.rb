# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:04 -0500 2008
#
# == Synopsis
# Database Table: pluto_main.DesignObjVariation_Zone
#
# * primary keys: PK_DesignObjVariation_Zone
# * foreign keys: FK_DesignObjVariation,FK_Button,FK_CommandGroup_D,FK_DesignObj_Goto
# * external keys: 
#
# == References
# * PlutoMain::LmceCommandGroupD
# * PlutoMain::LmceDesignObjVariation
# * PlutoMain::LmceButton
#
# == Referenced By
#
# == Database Table Columns
#   * PK_DesignObjVariation_Zone    [Type:int(11), Default:NULL, Key:PRI, Null:NO, Extra:auto_increment]
#   * FK_DesignObjVariation         [Type:int(11), Default:NULL, Null:YES]
#   * FK_Button                     [Type:int(11), Default:NULL, Null:YES]
#   * FK_CommandGroup_D             [Type:int(11), Default:0, Null:NO]
#   * FK_DesignObj_Goto             [Type:int(11), Default:NULL, Null:YES]
#   * Description                   [Type:varchar(20), Default:NULL, Null:NO]
#   * X                             [Type:int(11), Default:0, Null:NO]
#   * Y                             [Type:int(11), Default:0, Null:NO]
#   * Width                         [Type:int(11), Default:0, Null:NO]
#   * Height                        [Type:int(11), Default:0, Null:NO]
#   * psc_id                        [Type:int(11), Default:NULL, Key:UNI, Null:YES]
#   * psc_batch                     [Type:int(11), Default:NULL, Null:YES]
#   * psc_user                      [Type:int(11), Default:NULL, Null:YES]
#   * psc_frozen                    [Type:tinyint(1), Default:0, Null:YES]
#   * psc_mod                       [Type:timestamp, Default:CURRENT_TIMESTAMP, Null:YES]
#   * psc_restrict                  [Type:int(11), Default:NULL, Null:YES]
#
# == Associations
# * belongs_to lmce_button
# * belongs_to lmce_command_group_d
# * belongs_to lmce_design_obj_variation
#

class PlutoMain::LmceDesignObjVariationZone < PlutoMainDatabase
  set_table_name "DesignObjVariation_Zone"
  set_primary_key "PK_DesignObjVariation_Zone"

  # foreign key references
  # FK_DesignObjVariation_Zone references PlutoMain::LmceCommandGroupD (FK_CommandGroup_D)
  belongs_to  :lmce_command_group_d,
      :class_name => "PlutoMain::LmceCommandGroupD",
      :foreign_key => "FK_CommandGroup_D"

  # FK_DesignObjVariation_Zone references PlutoMain::LmceDesignObjVariation (FK_DesignObjVariation)
  belongs_to  :lmce_design_obj_variation,
      :class_name => "PlutoMain::LmceDesignObjVariation",
      :foreign_key => "FK_DesignObjVariation"

  # FK_DesignObjVariation_Zone references PlutoMain::LmceButton (FK_Button)
  belongs_to  :lmce_button,
      :class_name => "PlutoMain::LmceButton",
      :foreign_key => "FK_Button"

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

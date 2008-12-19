# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:04 -0500 2008
#
# == Synopsis
# Database Table: pluto_main.DesignObjType_DesignObjParameter
# Through Join Table
#
# * primary keys: FK_DesignObjType,FK_DesignObjParameter
# * foreign keys: FK_DesignObjType,FK_DesignObjParameter
# * external keys: 
#
# == References
# * PlutoMain::LmceDesignObjType
# * PlutoMain::LmceDesignObjParameter
#
# == Referenced By
#
# == Database Table Columns
#   * FK_DesignObjType         [Type:int(11), Default:0, Key:PRI, Null:NO]
#   * FK_DesignObjParameter    [Type:int(11), Default:0, Key:PRI, Null:NO]
#   * Comments                 [Type:text, Default:NULL, Null:YES]
#   * psc_id                   [Type:int(11), Default:NULL, Key:UNI, Null:YES]
#   * psc_batch                [Type:int(11), Default:NULL, Null:YES]
#   * psc_user                 [Type:int(11), Default:NULL, Null:YES]
#   * psc_frozen               [Type:tinyint(1), Default:0, Null:YES]
#   * psc_mod                  [Type:timestamp, Default:CURRENT_TIMESTAMP, Null:YES]
#   * psc_restrict             [Type:int(11), Default:NULL, Null:YES]
#
# == Associations
# * belongs_to lmce_design_obj_parameter
# * belongs_to lmce_design_obj_type
#

class PlutoMain::LmceDesignObjTypeDesignObjParameter < PlutoMainDatabase
  set_table_name "DesignObjType_DesignObjParameter"
  set_primary_keys "FK_DesignObjType", "FK_DesignObjParameter"

  # foreign key references
  # FK_DesignObjType_DesignObjParameter references PlutoMain::LmceDesignObjType (FK_DesignObjType)
  belongs_to  :lmce_design_obj_type,
      :class_name => "PlutoMain::LmceDesignObjType",
      :foreign_key => "FK_DesignObjType"

  # FK_DesignObjType_DesignObjParameter references PlutoMain::LmceDesignObjParameter (FK_DesignObjParameter)
  belongs_to  :lmce_design_obj_parameter,
      :class_name => "PlutoMain::LmceDesignObjParameter",
      :foreign_key => "FK_DesignObjParameter"

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

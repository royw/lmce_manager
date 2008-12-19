# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:04 -0500 2008
#
# == Synopsis
# Database Table: pluto_main.DesignObjCategory
#
# * primary keys: PK_DesignObjCategory
# * foreign keys: FK_DesignObjCategory_Parent
# * external keys: 
#
# == References
#
# == Referenced By
# * PlutoMain::LmceDesignObj
#
# == Database Table Columns
#   * PK_DesignObjCategory           [Type:int(11), Default:NULL, Key:PRI, Null:NO, Extra:auto_increment]
#   * FK_DesignObjCategory_Parent    [Type:int(11), Default:NULL, Null:YES]
#   * Description                    [Type:varchar(20), Default:NULL, Null:YES]
#   * psc_id                         [Type:int(11), Default:NULL, Key:UNI, Null:YES]
#   * psc_batch                      [Type:int(11), Default:NULL, Null:YES]
#   * psc_user                       [Type:int(11), Default:NULL, Null:YES]
#   * psc_frozen                     [Type:tinyint(1), Default:0, Null:YES]
#   * psc_mod                        [Type:timestamp, Default:CURRENT_TIMESTAMP, Null:YES]
#   * psc_restrict                   [Type:int(11), Default:NULL, Null:YES]
#
# == Associations
# * belongs_to parent
# * has_many design_obj_category_parents
# * has_many lmce_design_objs
#

class PlutoMain::LmceDesignObjCategory < PlutoMainDatabase
  set_table_name "DesignObjCategory"
  set_primary_key "PK_DesignObjCategory"

  # foreign key references
  # 1:n  (FK_DesignObjCategory)
  has_many  :lmce_design_objs,
      :class_name => "PlutoMain::LmceDesignObj",
      :foreign_key => "FK_DesignObjCategory"

  # self references
  belongs_to  :parent,
      :class_name => "PlutoMain::LmceDesignObjCategory",
      :foreign_key => "FK_DesignObjCategory_Parent"
  has_many  :design_obj_category_parents,
      :class_name => "PlutoMain::LmceDesignObjCategory",
      :foreign_key => "FK_DesignObjCategory_Parent"
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


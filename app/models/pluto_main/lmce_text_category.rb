# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:05 -0500 2008
#
# == Synopsis
# Database Table: pluto_main.TextCategory
#
# * primary keys: PK_TextCategory
# * foreign keys: FK_TextCategory_Parent
# * external keys: 
#
# == References
#
# == Referenced By
# * PlutoMain::LmceText
#
# == Database Table Columns
#   * PK_TextCategory           [Type:int(11), Default:NULL, Key:PRI, Null:NO, Extra:auto_increment]
#   * FK_TextCategory_Parent    [Type:int(11), Default:NULL, Null:YES]
#   * Description               [Type:varchar(100), Default:NULL, Null:YES]
#   * psc_id                    [Type:int(11), Default:NULL, Key:UNI, Null:YES]
#   * psc_batch                 [Type:int(11), Default:NULL, Null:YES]
#   * psc_user                  [Type:int(11), Default:NULL, Null:YES]
#   * psc_frozen                [Type:tinyint(1), Default:0, Null:YES]
#   * psc_mod                   [Type:timestamp, Default:CURRENT_TIMESTAMP, Null:YES]
#   * psc_restrict              [Type:int(11), Default:NULL, Null:YES]
#
# == Associations
# * belongs_to parent
# * has_many lmce_texts
# * has_many text_category_parents
#

class PlutoMain::LmceTextCategory < PlutoMainDatabase
  set_table_name "TextCategory"
  set_primary_key "PK_TextCategory"

  # foreign key references
  # 1:n  (FK_TextCategory)
  has_many  :lmce_texts,
      :class_name => "PlutoMain::LmceText",
      :foreign_key => "FK_TextCategory"

  # self references
  belongs_to  :parent,
      :class_name => "PlutoMain::LmceTextCategory",
      :foreign_key => "FK_TextCategory_Parent"
  has_many  :text_category_parents,
      :class_name => "PlutoMain::LmceTextCategory",
      :foreign_key => "FK_TextCategory_Parent"
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


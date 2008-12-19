# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:04 -0500 2008
#
# == Synopsis
# Database Table: pluto_main.Array
#
# * primary keys: PK_Array
# * foreign keys: FK_Array_Parent
# * external keys: 
#
# == References
#
# == Referenced By
# * PlutoMain::LmceCommandGroup
#
# == Database Table Columns
#   * PK_Array           [Type:int(11), Default:NULL, Key:PRI, Null:NO, Extra:auto_increment]
#   * Description        [Type:varchar(30), Default:NULL, Null:NO]
#   * Define             [Type:varchar(30), Default:NULL, Null:NO]
#   * CommandGroup       [Type:tinyint(4), Default:0, Null:NO]
#   * FK_Array_Parent    [Type:int(11), Default:NULL, Null:YES]
#   * psc_id             [Type:int(11), Default:NULL, Key:UNI, Null:YES]
#   * psc_batch          [Type:int(11), Default:NULL, Null:YES]
#   * psc_user           [Type:int(11), Default:NULL, Null:YES]
#   * psc_frozen         [Type:tinyint(1), Default:0, Null:YES]
#   * psc_mod            [Type:timestamp, Default:CURRENT_TIMESTAMP, Null:YES]
#   * psc_restrict       [Type:int(11), Default:NULL, Null:YES]
#
# == Associations
# * belongs_to parent
# * has_many array_parents
# * has_many lmce_command_groups
#

class PlutoMain::LmceArray < PlutoMainDatabase
  set_table_name "Array"
  set_primary_key "PK_Array"

  # foreign key references
  # 1:n  (FK_Array)
  has_many  :lmce_command_groups,
      :class_name => "PlutoMain::LmceCommandGroup",
      :foreign_key => "FK_Array"

  # self references
  belongs_to  :parent,
      :class_name => "PlutoMain::LmceArray",
      :foreign_key => "FK_Array_Parent"
  has_many  :array_parents,
      :class_name => "PlutoMain::LmceArray",
      :foreign_key => "FK_Array_Parent"
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


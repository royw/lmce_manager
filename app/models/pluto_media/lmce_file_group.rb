# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:05 -0500 2008
#
# == Synopsis
# Database Table: pluto_media.FileGroup
#
# * primary keys: PK_FileGroup
# * foreign keys: 
# * external keys: 
#
# == References
#
# == Referenced By
# * PlutoMedia::LmceFile
#
# == Database Table Columns
#   * PK_FileGroup    [Type:int(11), Default:NULL, Key:PRI, Null:NO, Extra:auto_increment]
#   * Descrption      [Type:varchar(100), Default:NULL, Null:YES]
#   * psc_id          [Type:int(11), Default:NULL, Null:YES]
#   * psc_batch       [Type:int(11), Default:NULL, Null:YES]
#   * psc_user        [Type:int(11), Default:NULL, Null:YES]
#   * psc_frozen      [Type:tinyint(1), Default:0, Null:YES]
#   * psc_mod         [Type:timestamp, Default:CURRENT_TIMESTAMP, Null:NO]
#   * psc_restrict    [Type:int(11), Default:NULL, Null:YES]
#
# == Associations
# * has_many lmce_files
#

class PlutoMedia::LmceFileGroup < PlutoMediaDatabase
  set_table_name "FileGroup"
  set_primary_key "PK_FileGroup"

  # foreign key references
  # 1:n  (FK_FileGroup)
  has_many  :lmce_files,
      :class_name => "PlutoMedia::LmceFile",
      :foreign_key => "FK_FileGroup"

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


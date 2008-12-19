# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:05 -0500 2008
#
# == Synopsis
# Database Table: pluto_main.FAQ
#
# * primary keys: PK_FAQ
# * foreign keys: FK_Package
# * external keys: 
#
# == References
# * PlutoMain::LmcePackage
#
# == Referenced By
#
# == Database Table Columns
#   * PK_FAQ          [Type:int(11), Default:NULL, Key:PRI, Null:NO, Extra:auto_increment]
#   * FK_Package      [Type:int(11), Default:NULL, Null:YES]
#   * Summary         [Type:varchar(100), Default:NULL, Null:YES]
#   * Content         [Type:text, Default:NULL, Null:YES]
#   * psc_id          [Type:int(11), Default:NULL, Null:YES]
#   * psc_batch       [Type:int(11), Default:NULL, Null:YES]
#   * psc_user        [Type:int(11), Default:NULL, Null:YES]
#   * psc_frozen      [Type:tinyint(1), Default:0, Null:YES]
#   * psc_mod         [Type:timestamp, Default:CURRENT_TIMESTAMP, Null:YES]
#   * psc_restrict    [Type:int(11), Default:NULL, Null:YES]
#
# == Associations
# * belongs_to lmce_package
#

class PlutoMain::LmceFaq < PlutoMainDatabase
  set_table_name "FAQ"
  set_primary_key "PK_FAQ"

  # foreign key references
  # FK_FAQ references PlutoMain::LmcePackage (FK_Package)
  belongs_to  :lmce_package,
      :class_name => "PlutoMain::LmcePackage",
      :foreign_key => "FK_Package"

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


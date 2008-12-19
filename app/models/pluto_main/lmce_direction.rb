# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:05 -0500 2008
#
# == Synopsis
# Database Table: pluto_main.Direction
#
# * primary keys: PK_Direction
# * foreign keys: 
# * external keys: 
#
# == References
#
# == Referenced By
#
# == Database Table Columns
#   * PK_Direction    [Type:int(11), Default:NULL, Key:PRI, Null:NO, Extra:auto_increment]
#   * Description     [Type:varchar(25), Default:NULL, Null:NO]
#   * Define          [Type:varchar(25), Default:NULL, Null:NO]
#   * psc_id          [Type:int(11), Default:NULL, Key:UNI, Null:YES]
#   * psc_batch       [Type:int(11), Default:NULL, Null:YES]
#   * psc_user        [Type:int(11), Default:NULL, Null:YES]
#   * psc_frozen      [Type:tinyint(1), Default:0, Null:YES]
#   * psc_mod         [Type:timestamp, Default:CURRENT_TIMESTAMP, Null:YES]
#   * psc_restrict    [Type:int(11), Default:NULL, Null:YES]
#
# == Associations
#

class PlutoMain::LmceDirection < PlutoMainDatabase
  set_table_name "Direction"
  set_primary_key "PK_Direction"

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


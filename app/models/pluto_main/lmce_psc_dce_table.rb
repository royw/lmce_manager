# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:05 -0500 2008
#
# == Synopsis
# Database Table: pluto_main.psc_dce_tables
#
# * primary keys: PK_psc_dce_tables
# * foreign keys: 
# * external keys: 
#
# == References
#
# == Referenced By
#
# == Database Table Columns
#   * PK_psc_dce_tables    [Type:int(11), Default:NULL, Key:PRI, Null:NO, Extra:auto_increment]
#   * Tablename            [Type:varchar(60), Default:NULL, Null:NO]
#   * filter               [Type:varchar(255), Default:NULL, Null:YES]
#   * frozen               [Type:tinyint(1), Default:0, Null:NO]
#   * anonymous            [Type:tinyint(1), Default:0, Null:NO]
#   * last_psc_id          [Type:int(11), Default:0, Null:NO]
#   * last_psc_batch       [Type:int(11), Default:0, Null:NO]
#
# == Associations
#

class PlutoMain::LmcePscDceTable < PlutoMainDatabase
  set_table_name "psc_dce_tables"
  set_primary_key "PK_psc_dce_tables"


  # add your model extensions after this line

end


# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:05 -0500 2008
#
# == Synopsis
# Database Table: pluto_main.psc_constants_batdet
#
# * primary keys: PK_psc_constants_batdet
# * foreign keys: FK_psc_constants_bathdr,FK_psc_constants_bathdr_orig,FK_psc_constants_bathdr_auth,FK_psc_constants_bathdr_unauth
# * external keys: 
#
# == References
# * PlutoMain::LmcePscConstantsBathdr
#
# == Referenced By
#
# == Database Table Columns
#   * PK_psc_constants_batdet           [Type:int(11), Default:NULL, Key:PRI, Null:NO, Extra:auto_increment]
#   * FK_psc_constants_bathdr           [Type:int(11), Default:0, Null:NO]
#   * Tablename                         [Type:varchar(60), Default:NULL, Null:NO]
#   * New                               [Type:int(11), Default:0, Null:NO]
#   * Deleted                           [Type:int(11), Default:0, Null:NO]
#   * Modified                          [Type:int(11), Default:0, Null:NO]
#   * FK_psc_constants_bathdr_orig      [Type:int(11), Default:0, Null:NO]
#   * FK_psc_constants_bathdr_auth      [Type:int(11), Default:0, Null:NO]
#   * FK_psc_constants_bathdr_unauth    [Type:int(11), Default:0, Null:NO]
#
# == Associations
# * belongs_to lmce_psc_constants_bathdr
#

class PlutoMain::LmcePscConstantsBatdet < PlutoMainDatabase
  set_table_name "psc_constants_batdet"
  set_primary_key "PK_psc_constants_batdet"

  # foreign key references
  # FK_psc_constants_batdet references PlutoMain::LmcePscConstantsBathdr (FK_psc_constants_bathdr)
  belongs_to  :lmce_psc_constants_bathdr,
      :class_name => "PlutoMain::LmcePscConstantsBathdr",
      :foreign_key => "FK_psc_constants_bathdr"


  # add your model extensions after this line

end


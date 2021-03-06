# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:05 -0500 2008
#
# == Synopsis
# Database Table: pluto_main.psc_ir_batuser
#
# * primary keys: PK_psc_ir_batuser
# * foreign keys: FK_psc_ir_bathdr
# * external keys: 
#
# == References
# * PlutoMain::LmcePscIrBathdr
#
# == Referenced By
#
# == Database Table Columns
#   * PK_psc_ir_batuser    [Type:int(11), Default:NULL, Key:PRI, Null:NO, Extra:auto_increment]
#   * FK_psc_ir_bathdr     [Type:int(11), Default:0, Null:NO]
#   * psc_user             [Type:int(11), Default:0, Null:NO]
#   * is_sup               [Type:tinyint(1), Default:0, Null:NO]
#   * no_pass              [Type:tinyint(1), Default:0, Null:NO]
#
# == Associations
# * belongs_to lmce_psc_ir_bathdr
#

class PlutoMain::LmcePscIrBatuser < PlutoMainDatabase
  set_table_name "psc_ir_batuser"
  set_primary_key "PK_psc_ir_batuser"

  # foreign key references
  # FK_psc_ir_batuser references PlutoMain::LmcePscIrBathdr (FK_psc_ir_bathdr)
  belongs_to  :lmce_psc_ir_bathdr,
      :class_name => "PlutoMain::LmcePscIrBathdr",
      :foreign_key => "FK_psc_ir_bathdr"


  # add your model extensions after this line

end


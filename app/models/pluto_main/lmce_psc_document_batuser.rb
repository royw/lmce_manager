# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:05 -0500 2008
#
# == Synopsis
# Database Table: pluto_main.psc_document_batuser
#
# * primary keys: PK_psc_document_batuser
# * foreign keys: FK_psc_document_bathdr
# * external keys: 
#
# == References
# * PlutoMain::LmcePscDocumentBathdr
#
# == Referenced By
#
# == Database Table Columns
#   * PK_psc_document_batuser    [Type:int(11), Default:NULL, Key:PRI, Null:NO, Extra:auto_increment]
#   * FK_psc_document_bathdr     [Type:int(11), Default:0, Null:NO]
#   * psc_user                   [Type:int(11), Default:0, Null:NO]
#   * is_sup                     [Type:tinyint(1), Default:0, Null:NO]
#   * no_pass                    [Type:tinyint(1), Default:0, Null:NO]
#
# == Associations
# * belongs_to lmce_psc_document_bathdr
#

class PlutoMain::LmcePscDocumentBatuser < PlutoMainDatabase
  set_table_name "psc_document_batuser"
  set_primary_key "PK_psc_document_batuser"

  # foreign key references
  # FK_psc_document_batuser references PlutoMain::LmcePscDocumentBathdr (FK_psc_document_bathdr)
  belongs_to  :lmce_psc_document_bathdr,
      :class_name => "PlutoMain::LmcePscDocumentBathdr",
      :foreign_key => "FK_psc_document_bathdr"


  # add your model extensions after this line
end

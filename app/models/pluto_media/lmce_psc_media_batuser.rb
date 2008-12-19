# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:05 -0500 2008
#
# == Synopsis
# Database Table: pluto_media.psc_media_batuser
#
# * primary keys: PK_psc_media_batuser
# * foreign keys: FK_psc_media_bathdr
# * external keys: 
#
# == References
# * PlutoMedia::LmcePscMediaBathdr
#
# == Referenced By
#
# == Database Table Columns
#   * PK_psc_media_batuser    [Type:int(11), Default:NULL, Key:PRI, Null:NO, Extra:auto_increment]
#   * FK_psc_media_bathdr     [Type:int(11), Default:0, Null:NO]
#   * psc_user                [Type:int(11), Default:0, Null:NO]
#   * is_sup                  [Type:tinyint(1), Default:0, Null:NO]
#   * no_pass                 [Type:tinyint(1), Default:0, Null:NO]
#
# == Associations
# * belongs_to lmce_psc_media_bathdr
#

class PlutoMedia::LmcePscMediaBatuser < PlutoMediaDatabase
  set_table_name "psc_media_batuser"
  set_primary_key "PK_psc_media_batuser"

  # foreign key references
  # FK_psc_media_batuser references PlutoMedia::LmcePscMediaBathdr (FK_psc_media_bathdr)
  belongs_to  :lmce_psc_media_bathdr,
      :class_name => "PlutoMedia::LmcePscMediaBathdr",
      :foreign_key => "FK_psc_media_bathdr"


  # add your model extensions after this line

end


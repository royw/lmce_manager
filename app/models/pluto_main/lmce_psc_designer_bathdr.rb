# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:05 -0500 2008
#
# == Synopsis
# Database Table: pluto_main.psc_designer_bathdr
#
# * primary keys: PK_psc_designer_bathdr
# * foreign keys: 
# * external keys: 
#
# == References
#
# == Referenced By
# * PlutoMain::LmcePscDesignerBatuser
# * PlutoMain::LmcePscDesignerBatdet
#
# == Database Table Columns
#   * PK_psc_designer_bathdr    [Type:int(11), Default:NULL, Key:PRI, Null:NO, Extra:auto_increment]
#   * IPAddress                 [Type:varchar(16), Default:NULL, Null:YES]
#   * date                      [Type:datetime, Default:NULL, Null:YES]
#   * comments                  [Type:text, Default:NULL, Null:YES]
#
# == Associations
# * has_many lmce_psc_designer_batdets
# * has_many lmce_psc_designer_batusers
#

class PlutoMain::LmcePscDesignerBathdr < PlutoMainDatabase
  set_table_name "psc_designer_bathdr"
  set_primary_key "PK_psc_designer_bathdr"

  # foreign key references
  # 1:n  (FK_psc_designer_bathdr)
  has_many  :lmce_psc_designer_batusers,
      :class_name => "PlutoMain::LmcePscDesignerBatuser",
      :foreign_key => "FK_psc_designer_bathdr"

  # 1:n  (FK_psc_designer_bathdr)
  has_many  :lmce_psc_designer_batdets,
      :class_name => "PlutoMain::LmcePscDesignerBatdet",
      :foreign_key => "FK_psc_designer_bathdr"


  # add your model extensions after this line

end


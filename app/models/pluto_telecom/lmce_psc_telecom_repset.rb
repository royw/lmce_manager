# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:05 -0500 2008
#
# == Synopsis
# Database Table: pluto_telecom.psc_telecom_repset
#
# * primary keys: PK_psc_telecom_repset
# * foreign keys: 
# * external keys: 
#
# == References
#
# == Referenced By
#
# == Database Table Columns
#   * PK_psc_telecom_repset    [Type:int(11), Default:NULL, Key:PRI, Null:NO, Extra:auto_increment]
#   * Setting                  [Type:varchar(30), Default:NULL, Null:NO]
#   * Value                    [Type:text, Default:NULL, Null:YES]
#
# == Associations
#

class PlutoTelecom::LmcePscTelecomRepset < PlutoTelecomDatabase
  set_table_name "psc_telecom_repset"
  set_primary_key "PK_psc_telecom_repset"


  # add your model extensions after this line

end


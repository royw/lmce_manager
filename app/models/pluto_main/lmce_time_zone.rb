# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:05 -0500 2008
#
# == Synopsis
# Database Table: pluto_main.TimeZone
#
# * primary keys: PK_TimeZone
# * foreign keys: 
# * external keys: 
#
# == References
#
# == Referenced By
# * PlutoMain::LmceCity
#
# == Database Table Columns
#   * PK_TimeZone         [Type:int(11), Default:NULL, Key:PRI, Null:NO, Extra:auto_increment]
#   * ZoneName            [Type:varchar(50), Default:NULL, Key:UNI, Null:YES]
#   * Coordinate          [Type:varchar(15), Default:NULL, Null:YES]
#   * TimeZoneOffset      [Type:double, Default:NULL, Null:YES]
#   * SummerTimeOffset    [Type:double, Default:NULL, Null:YES]
#   * Comments            [Type:varchar(100), Default:NULL, Null:YES]
#   * CountryCode         [Type:varchar(5), Default:NULL, Null:YES]
#
# == Associations
# * has_many lmce_cities
#

class PlutoMain::LmceTimeZone < PlutoMainDatabase
  set_table_name "TimeZone"
  set_primary_key "PK_TimeZone"

  # foreign key references
  # 1:n  (FK_TimeZone)
  has_many  :lmce_cities,
      :class_name => "PlutoMain::LmceCity",
      :foreign_key => "FK_TimeZone"


  # add your model extensions after this line

end


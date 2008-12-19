# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:05 -0500 2008
#
# == Synopsis
# Database Table: pluto_media.Picture_Disc
# Through Join Table
#
# * primary keys: FK_Picture,FK_Disc
# * foreign keys: FK_Picture,FK_Disc
# * external keys: 
#
# == References
# * PlutoMedia::LmceDisc
# * PlutoMedia::LmcePicture
#
# == Referenced By
#
# == Database Table Columns
#   * FK_Picture      [Type:int(11), Default:0, Key:PRI, Null:NO]
#   * FK_Disc         [Type:int(11), Default:0, Key:PRI, Null:NO]
#   * psc_id          [Type:int(11), Default:NULL, Key:UNI, Null:YES]
#   * psc_batch       [Type:int(11), Default:NULL, Null:YES]
#   * psc_user        [Type:int(11), Default:NULL, Null:YES]
#   * psc_frozen      [Type:tinyint(1), Default:0, Null:YES]
#   * psc_mod         [Type:timestamp, Default:CURRENT_TIMESTAMP, Null:NO]
#   * psc_restrict    [Type:int(11), Default:NULL, Null:YES]
#
# == Associations
# * belongs_to lmce_disc
# * belongs_to lmce_picture
#

class PlutoMedia::LmcePictureDisc < PlutoMediaDatabase
  set_table_name "Picture_Disc"
  set_primary_keys "FK_Picture", "FK_Disc"

  # foreign key references
  # FK_Picture_Disc references PlutoMedia::LmceDisc (FK_Disc)
  belongs_to  :lmce_disc,
      :class_name => "PlutoMedia::LmceDisc",
      :foreign_key => "FK_Disc"

  # FK_Picture_Disc references PlutoMedia::LmcePicture (FK_Picture)
  belongs_to  :lmce_picture,
      :class_name => "PlutoMedia::LmcePicture",
      :foreign_key => "FK_Picture"

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


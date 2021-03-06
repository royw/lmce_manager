# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:05 -0500 2008
#
# == Synopsis
# Database Table: pluto_media.Picture_Download
# Through Join Table
#
# * primary keys: FK_Picture,FK_Download
# * foreign keys: FK_Picture,FK_Download
# * external keys: 
#
# == References
# * PlutoMedia::LmcePicture
# * PlutoMedia::LmceDownload
#
# == Referenced By
#
# == Database Table Columns
#   * FK_Picture      [Type:int(11), Default:0, Key:PRI, Null:NO]
#   * FK_Download     [Type:int(11), Default:0, Key:PRI, Null:NO]
#   * psc_id          [Type:int(11), Default:NULL, Null:YES]
#   * psc_batch       [Type:int(11), Default:NULL, Null:YES]
#   * psc_user        [Type:int(11), Default:NULL, Null:YES]
#   * psc_frozen      [Type:tinyint(1), Default:0, Null:YES]
#   * psc_mod         [Type:timestamp, Default:CURRENT_TIMESTAMP, Null:NO]
#   * psc_restrict    [Type:int(11), Default:NULL, Null:YES]
#
# == Associations
# * belongs_to lmce_download
# * belongs_to lmce_picture
#

class PlutoMedia::LmcePictureDownload < PlutoMediaDatabase
  set_table_name "Picture_Download"
  set_primary_keys "FK_Picture", "FK_Download"

  # foreign key references
  # FK_Picture_Download references PlutoMedia::LmcePicture (FK_Picture)
  belongs_to  :lmce_picture,
      :class_name => "PlutoMedia::LmcePicture",
      :foreign_key => "FK_Picture"

  # FK_Picture_Download references PlutoMedia::LmceDownload (FK_Download)
  belongs_to  :lmce_download,
      :class_name => "PlutoMedia::LmceDownload",
      :foreign_key => "FK_Download"

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


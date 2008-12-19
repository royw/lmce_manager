# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:05 -0500 2008
#
# == Synopsis
# Database Table: pluto_media.MediaProvider
#
# * primary keys: PK_MediaProvider
# * foreign keys: FK_ProviderSource
# * external keys: EK_MediaType
#
# == References
# * PlutoMedia::LmceProviderSource
#
# == Referenced By
# * PlutoMedia::LmceBookmark
#
# == Database Table Columns
#   * PK_MediaProvider     [Type:int(11), Default:NULL, Key:PRI, Null:NO, Extra:auto_increment]
#   * Description          [Type:varchar(40), Default:NULL, Null:YES]
#   * EK_MediaType         [Type:int(11), Default:NULL, Null:YES]
#   * FK_ProviderSource    [Type:int(11), Default:NULL, Null:YES]
#   * Type                 [Type:varchar(10), Default:NULL, Null:YES]
#   * ID                   [Type:varchar(255), Default:NULL, Null:YES]
#   * Lineup               [Type:text, Default:NULL, Null:YES]
#   * psc_id               [Type:int(11), Default:NULL, Null:YES]
#   * psc_batch            [Type:int(11), Default:NULL, Null:YES]
#   * psc_user             [Type:int(11), Default:NULL, Null:YES]
#   * psc_frozen           [Type:tinyint(1), Default:0, Null:YES]
#   * psc_mod              [Type:timestamp, Default:CURRENT_TIMESTAMP, Null:NO]
#   * psc_restrict         [Type:int(11), Default:NULL, Null:YES]
#
# == Associations
# * belongs_to lmce_media_type
# * belongs_to lmce_provider_source
# * has_many lmce_bookmarks
#

require 'pluto_main/lmce_media_type'

include PlutoMain

class PlutoMedia::LmceMediaProvider < PlutoMediaDatabase
  set_table_name "MediaProvider"
  set_primary_key "PK_MediaProvider"

  # foreign key references
  # FK_MediaProvider references PlutoMedia::LmceProviderSource (FK_ProviderSource)
  belongs_to  :lmce_provider_source,
      :class_name => "PlutoMedia::LmceProviderSource",
      :foreign_key => "FK_ProviderSource"

  # 1:n  (FK_MediaProvider)
  has_many  :lmce_bookmarks,
      :class_name => "PlutoMedia::LmceBookmark",
      :foreign_key => "FK_MediaProvider"

  # external key references
  # EK_MediaProvider references PlutoMain::LmceMediaType (EK_MediaType)
  belongs_to  :lmce_media_type,
      :class_name => "PlutoMain::LmceMediaType",
      :foreign_key => "EK_MediaType"

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


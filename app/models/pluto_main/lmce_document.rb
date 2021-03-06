# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:05 -0500 2008
#
# == Synopsis
# Database Table: pluto_main.Document
#
# * primary keys: PK_Document
# * foreign keys: FK_Document_Parent
# * external keys: 
#
# == References
#
# == Referenced By
# * PlutoMain::LmceDocumentComment
#
# == Database Table Columns
#   * PK_Document           [Type:int(11), Default:NULL, Key:PRI, Null:NO, Extra:auto_increment]
#   * FK_Document_Parent    [Type:int(11), Default:NULL, Null:YES]
#   * Hidden                [Type:tinyint(1), Default:0, Null:NO]
#   * Order                 [Type:int(11), Default:0, Null:NO]
#   * Title                 [Type:varchar(60), Default:NULL, Null:NO]
#   * Contents              [Type:longtext, Default:NULL, Null:YES]
#   * psc_id                [Type:int(11), Default:NULL, Key:UNI, Null:YES]
#   * psc_batch             [Type:int(11), Default:NULL, Null:YES]
#   * psc_user              [Type:int(11), Default:NULL, Null:YES]
#   * psc_frozen            [Type:tinyint(1), Default:0, Null:YES]
#   * psc_mod               [Type:timestamp, Default:CURRENT_TIMESTAMP, Null:YES]
#   * psc_restrict          [Type:int(11), Default:NULL, Null:YES]
#
# == Associations
# * belongs_to parent
# * has_many document_parents
# * has_many lmce_document_comments
#

class PlutoMain::LmceDocument < PlutoMainDatabase
  set_table_name "Document"
  set_primary_key "PK_Document"

  # foreign key references
  # 1:n  (FK_Document)
  has_many  :lmce_document_comments,
      :class_name => "PlutoMain::LmceDocumentComment",
      :foreign_key => "FK_Document"

  # self references
  belongs_to  :parent,
      :class_name => "PlutoMain::LmceDocument",
      :foreign_key => "FK_Document_Parent"
  has_many  :document_parents,
      :class_name => "PlutoMain::LmceDocument",
      :foreign_key => "FK_Document_Parent"
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


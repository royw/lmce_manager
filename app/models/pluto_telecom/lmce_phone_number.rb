# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:05 -0500 2008
#
# == Synopsis
# Database Table: pluto_telecom.PhoneNumber
#
# * primary keys: PK_PhoneNumber
# * foreign keys: FK_Contact,FK_PhoneType
# * external keys: 
#
# == References
# * PlutoTelecom::LmceContact
# * PlutoTelecom::LmcePhoneType
#
# == Referenced By
# * PlutoTelecom::LmceSpeedDial
# * PlutoTelecom::LmcePhoneNumberUsersSync
# * PlutoTelecom::LmceOutgoingLog
# * PlutoTelecom::LmceIncomingLog
#
# == Database Table Columns
#   * PK_PhoneNumber    [Type:int(11), Default:NULL, Key:PRI, Null:NO, Extra:auto_increment]
#   * FK_Contact        [Type:int(11), Default:NULL, Null:YES]
#   * FK_PhoneType      [Type:int(11), Default:NULL, Null:YES]
#   * CountryCode       [Type:varchar(5), Default:NULL, Null:YES]
#   * AreaCode          [Type:varchar(6), Default:NULL, Null:YES]
#   * PhoneNumber       [Type:varchar(15), Default:NULL, Null:YES]
#   * Extension         [Type:varchar(10), Default:NULL, Null:YES]
#   * DialAs            [Type:varchar(20), Default:NULL, Null:YES]
#   * psc_id            [Type:int(11), Default:NULL, Key:UNI, Null:YES]
#   * psc_batch         [Type:int(11), Default:NULL, Null:YES]
#   * psc_user          [Type:int(11), Default:NULL, Null:YES]
#   * psc_frozen        [Type:tinyint(1), Default:0, Null:YES]
#   * psc_mod           [Type:timestamp, Default:CURRENT_TIMESTAMP, Null:NO]
#   * psc_restrict      [Type:int(11), Default:NULL, Null:YES]
#
# == Associations
# * belongs_to lmce_contact
# * belongs_to lmce_phone_type
# * has_many lmce_incoming_logs
# * has_many lmce_outgoing_logs
# * has_many lmce_phone_number_users_syncs
# * has_many lmce_speed_dials
# * has_many lmce_users
#

class PlutoTelecom::LmcePhoneNumber < PlutoTelecomDatabase
  set_table_name "PhoneNumber"
  set_primary_key "PK_PhoneNumber"

  # foreign key references
  # FK_PhoneNumber references PlutoTelecom::LmceContact (FK_Contact)
  belongs_to  :lmce_contact,
      :class_name => "PlutoTelecom::LmceContact",
      :foreign_key => "FK_Contact"

  # FK_PhoneNumber references PlutoTelecom::LmcePhoneType (FK_PhoneType)
  belongs_to  :lmce_phone_type,
      :class_name => "PlutoTelecom::LmcePhoneType",
      :foreign_key => "FK_PhoneType"

  # 1:n  (FK_PhoneNumber)
  has_many  :lmce_speed_dials,
      :class_name => "PlutoTelecom::LmceSpeedDial",
      :foreign_key => "FK_PhoneNumber"

  # n:n via through join table PlutoTelecom::LmcePhoneNumberUsersSync  (FK_PhoneNumber)
  has_many  :lmce_phone_number_users_syncs,
      :class_name => "PlutoTelecom::LmcePhoneNumberUsersSync",
      :foreign_key => "FK_PhoneNumber"
  has_many  :lmce_users,
      :through => :lmce_phone_number_users_syncs

  # 1:n  (FK_PhoneNumber)
  has_many  :lmce_outgoing_logs,
      :class_name => "PlutoTelecom::LmceOutgoingLog",
      :foreign_key => "FK_PhoneNumber"

  # 1:n  (FK_PhoneNumber)
  has_many  :lmce_incoming_logs,
      :class_name => "PlutoTelecom::LmceIncomingLog",
      :foreign_key => "FK_PhoneNumber"

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


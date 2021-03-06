# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:05 -0500 2008
#
# == Synopsis
# Database Table: pluto_telecom.PriorityCallers
#
# * primary keys: PK_PriorityCallers
# * foreign keys: 
# * external keys: EK_Users
#
# == References
#
# == Referenced By
#
# == Database Table Columns
#   * PK_PriorityCallers    [Type:int(11), Default:NULL, Key:PRI, Null:NO, Extra:auto_increment]
#   * EK_Users              [Type:int(11), Default:NULL, Null:YES]
#   * PhoneNumber           [Type:varchar(100), Default:NULL, Null:YES]
#   * psc_id                [Type:int(11), Default:NULL, Null:YES]
#   * psc_batch             [Type:int(11), Default:NULL, Null:YES]
#   * psc_user              [Type:int(11), Default:NULL, Null:YES]
#   * psc_frozen            [Type:tinyint(1), Default:0, Null:YES]
#   * psc_mod               [Type:timestamp, Default:CURRENT_TIMESTAMP, Null:NO]
#   * psc_restrict          [Type:int(11), Default:NULL, Null:YES]
#
# == Associations
# * belongs_to lmce_user
#

require 'pluto_telecom/lmce_user'

include PlutoTelecom

class PlutoTelecom::LmcePriorityCaller < PlutoTelecomDatabase
  set_table_name "PriorityCallers"
  set_primary_key "PK_PriorityCallers"

  # external key references
  # EK_PriorityCallers references PlutoTelecom::LmceUser (EK_Users)
  belongs_to  :lmce_user,
      :class_name => "PlutoTelecom::LmceUser",
      :foreign_key => "EK_Users"

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


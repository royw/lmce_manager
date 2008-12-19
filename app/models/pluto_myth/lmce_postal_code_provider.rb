# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:05 -0500 2008
#
# == Synopsis
# Database Table: pluto_myth.PostalCode_Provider
# Through Join Table
#
# * primary keys: EK_PostalCode,FK_Provider
# * foreign keys: FK_Provider
# * external keys: EK_PostalCode
#
# == References
# * PlutoMyth::LmceProvider
#
# == Referenced By
#
# == Database Table Columns
#   * EK_PostalCode    [Type:int(11), Default:0, Key:PRI, Null:NO]
#   * FK_Provider      [Type:int(11), Default:0, Key:PRI, Null:NO]
#   * psc_id           [Type:int(11), Default:NULL, Null:YES]
#   * psc_batch        [Type:int(11), Default:NULL, Null:YES]
#   * psc_user         [Type:int(11), Default:NULL, Null:YES]
#   * psc_frozen       [Type:tinyint(1), Default:0, Null:YES]
#   * psc_mod          [Type:timestamp, Default:CURRENT_TIMESTAMP, Null:NO]
#   * psc_restrict     [Type:int(11), Default:NULL, Null:YES]
#
# == Associations
# * belongs_to lmce_postal_code
# * belongs_to lmce_provider
#

require 'pluto_main/lmce_postal_code'

include PlutoMain

class PlutoMyth::LmcePostalCodeProvider < PlutoMythDatabase
  set_table_name "PostalCode_Provider"
  set_primary_keys "EK_PostalCode", "FK_Provider"

  # foreign key references
  # FK_PostalCode_Provider references PlutoMyth::LmceProvider (FK_Provider)
  belongs_to  :lmce_provider,
      :class_name => "PlutoMyth::LmceProvider",
      :foreign_key => "FK_Provider"

  # external key references
  # EK_PostalCode_Provider references PlutoMain::LmcePostalCode (EK_PostalCode)
  belongs_to  :lmce_postal_code,
      :class_name => "PlutoMain::LmcePostalCode",
      :foreign_key => "EK_PostalCode"

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

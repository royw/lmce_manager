# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)
# generated by mysql2models.rb 0.2 Tue Jun 17 01:17:05 -0500 2008
#
# == Synopsis
# Database Table: pluto_main.DHCPDevice
#
# * primary keys: PK_DHCPDevice
# * foreign keys: FK_DeviceTemplate,FK_PnpProtocol,FK_DeviceCategory,FK_Manufacturer
# * external keys: 
#
# == References
# * PlutoMain::LmceDeviceCategory
# * PlutoMain::LmceDeviceTemplate
# * PlutoMain::LmceManufacturer
# * PlutoMain::LmcePnpProtocol
#
# == Referenced By
# * PlutoMain::LmceDhcpDeviceDeviceData
#
# == Database Table Columns
#   * PK_DHCPDevice         [Type:int(11), Default:NULL, Key:PRI, Null:NO, Extra:auto_increment]
#   * FK_DeviceTemplate     [Type:int(11), Default:NULL, Null:YES]
#   * Mac_Range_Low         [Type:bigint(20), Default:0, Null:NO]
#   * Mac_Range_High        [Type:bigint(20), Default:0, Null:NO]
#   * VendorModelID         [Type:varchar(50), Default:NULL, Null:YES]
#   * SerialNumber          [Type:varchar(50), Default:NULL, Null:YES]
#   * Parms                 [Type:varchar(50), Default:NULL, Null:YES]
#   * Category              [Type:varchar(20), Default:NULL, Null:YES]
#   * FK_PnpProtocol        [Type:int(11), Default:NULL, Null:YES]
#   * PnpDetectionScript    [Type:varchar(25), Default:NULL, Null:YES]
#   * FK_DeviceCategory     [Type:int(11), Default:NULL, Null:YES]
#   * FK_Manufacturer       [Type:int(11), Default:NULL, Null:YES]
#   * Description           [Type:varchar(30), Default:NULL, Null:YES]
#   * psc_id                [Type:int(11), Default:NULL, Key:UNI, Null:YES]
#   * psc_batch             [Type:int(11), Default:NULL, Null:YES]
#   * psc_user              [Type:int(11), Default:NULL, Null:YES]
#   * psc_frozen            [Type:tinyint(1), Default:0, Null:YES]
#   * psc_mod               [Type:timestamp, Default:CURRENT_TIMESTAMP, Null:YES]
#   * psc_restrict          [Type:int(11), Default:NULL, Null:YES]
#
# == Associations
# * belongs_to lmce_device_category
# * belongs_to lmce_device_template
# * belongs_to lmce_manufacturer
# * belongs_to lmce_pnp_protocol
# * has_many lmce_device_datas
# * has_many lmce_dhcp_device_device_datas
#

class PlutoMain::LmceDhcpDevice < PlutoMainDatabase
  set_table_name "DHCPDevice"
  set_primary_key "PK_DHCPDevice"

  # foreign key references
  # FK_DHCPDevice references PlutoMain::LmceDeviceCategory (FK_DeviceCategory)
  belongs_to  :lmce_device_category,
      :class_name => "PlutoMain::LmceDeviceCategory",
      :foreign_key => "FK_DeviceCategory"

  # FK_DHCPDevice references PlutoMain::LmceDeviceTemplate (FK_DeviceTemplate)
  belongs_to  :lmce_device_template,
      :class_name => "PlutoMain::LmceDeviceTemplate",
      :foreign_key => "FK_DeviceTemplate"

  # FK_DHCPDevice references PlutoMain::LmceManufacturer (FK_Manufacturer)
  belongs_to  :lmce_manufacturer,
      :class_name => "PlutoMain::LmceManufacturer",
      :foreign_key => "FK_Manufacturer"

  # FK_DHCPDevice references PlutoMain::LmcePnpProtocol (FK_PnpProtocol)
  belongs_to  :lmce_pnp_protocol,
      :class_name => "PlutoMain::LmcePnpProtocol",
      :foreign_key => "FK_PnpProtocol"

  # n:n via through join table PlutoMain::LmceDhcpDeviceDeviceData  (FK_DHCPDevice)
  has_many  :lmce_dhcp_device_device_datas,
      :class_name => "PlutoMain::LmceDhcpDeviceDeviceData",
      :foreign_key => "FK_DHCPDevice"
  has_many  :lmce_device_datas,
      :through => :lmce_dhcp_device_device_datas

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


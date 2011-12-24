class RenameAddressColumnInHosts < ActiveRecord::Migration
  def change
    rename_column :hosts, :address, :ip_address
  end
end

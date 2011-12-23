class AddNotNullToHosts < ActiveRecord::Migration
  def change
    change_column :hosts, :address, :string,{ :null => false }
    change_column :hosts, :inbound, :decimal,{ :null => false, :precision => 16, :scale => 0, :default => 0 }
    change_column :hosts, :outbound,:decimal,{ :null => false, :precision => 16, :scale => 0, :default => 0 }
    change_column :hosts, :inbound_restricted, :boolean, { :null =>false ,:default=>false }
    change_column :hosts, :outbound_restricted, :boolean, { :default=>false, :null => false }
  end
end

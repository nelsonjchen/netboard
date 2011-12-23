class AddBandwidthInfoToHosts < ActiveRecord::Migration
  def change
    # Bandwidth will break integers
    add_column :hosts, :inbound, :decimal, {:precision => 16, :scale => 0}
    add_column :hosts, :outbound, :decimal, {:precision => 16, :scale => 0}
    add_column :hosts, :inbound_restricted, :boolean
    add_column :hosts, :outbound_restricted, :boolean
  end
end

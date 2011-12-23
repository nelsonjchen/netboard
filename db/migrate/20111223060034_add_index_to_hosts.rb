class AddIndexToHosts < ActiveRecord::Migration
  def change
    add_index :hosts, :address, {unique:true}
  end
end

class AddParentToBoards < ActiveRecord::Migration[5.0]
  def change
    add_column :boards, :parent_id, :integer
  end
end

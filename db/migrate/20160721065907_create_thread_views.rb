class CreateThreadViews < ActiveRecord::Migration[5.0]
  def change
    create_table :thread_views do |t|
      t.references :thread, foreign_key: true
      t.references :viewer, references: :users, column: 'viewer_id', foreign_key: true

      t.timestamps
    end

    add_index :thread_views, [:viewer_id, :thread_id], unique: true
  end
end
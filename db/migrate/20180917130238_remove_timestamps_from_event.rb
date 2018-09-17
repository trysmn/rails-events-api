class RemoveTimestampsFromEvent < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :created_at, :string
    remove_column :events, :updated_at, :string
  end
end

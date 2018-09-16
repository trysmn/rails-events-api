class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :start_time
      t.string :end_time
      t.string :label
      t.string :category

      t.timestamps
    end
  end
end

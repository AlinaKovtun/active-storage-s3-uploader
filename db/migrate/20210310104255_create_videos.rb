class CreateVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :videos do |t|
      t.string :name
      t.integer :attachment_id
      t.integer :revision

      t.timestamps
    end
  end
end

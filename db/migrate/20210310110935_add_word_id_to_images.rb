class AddWordIdToImages < ActiveRecord::Migration[6.1]
  def change
    add_column :images, :word_id, :integer
  end
end

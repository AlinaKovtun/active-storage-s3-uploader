class AddWordIdToAudios < ActiveRecord::Migration[6.1]
  def change
    add_column :audios, :word_id, :integer
  end
end

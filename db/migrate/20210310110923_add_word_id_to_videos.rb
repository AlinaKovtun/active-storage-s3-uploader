class AddWordIdToVideos < ActiveRecord::Migration[6.1]
  def change
    add_column :videos, :word_id, :integer
  end
end

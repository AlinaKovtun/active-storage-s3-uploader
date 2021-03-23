class AddAttachmentToVideos < ActiveRecord::Migration[6.1]
  def change
    add_column :videos, :attachment, :string
  end
end

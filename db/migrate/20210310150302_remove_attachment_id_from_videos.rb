class RemoveAttachmentIdFromVideos < ActiveRecord::Migration[6.1]
  def change
    remove_column :videos, :attachment_id, :integer
  end
end

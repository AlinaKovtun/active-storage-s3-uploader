class RemoveAttachmentIdFromAudios < ActiveRecord::Migration[6.1]
  def change
    remove_column :audios, :attachment_id, :integer
  end
end

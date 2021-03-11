class RemoveAttachmentIdFromImages < ActiveRecord::Migration[6.1]
  def change
    remove_column :images, :attachment_id, :integer
  end
end

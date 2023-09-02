class DropAttachinaryFiles < ActiveRecord::Migration[7.0]
  def change
    drop_table :attachinary_files
  end
end

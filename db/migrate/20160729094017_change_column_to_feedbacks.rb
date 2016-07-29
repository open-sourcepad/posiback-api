class ChangeColumnToFeedbacks < ActiveRecord::Migration[5.0]
  def change
    rename_column :feedbacks, :nasibackan_id, :nasiback_id
  end
end

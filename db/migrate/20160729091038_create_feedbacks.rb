class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.text :content
      t.integer :nansiback_id
      t.integer :nasibackan_id
      t.timestamp
    end
  end
end

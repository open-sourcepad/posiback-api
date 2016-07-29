class AddToFeedbacks < ActiveRecord::Migration[5.0]
  def change
    add_column :feedbacks, :category, :string

  end
end

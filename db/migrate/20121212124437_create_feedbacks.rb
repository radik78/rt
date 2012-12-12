class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.text :message
      t.string :urlpage

      t.timestamps
    end
  end
end

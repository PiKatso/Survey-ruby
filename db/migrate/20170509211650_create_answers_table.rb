class CreateAnswersTable < ActiveRecord::Migration[5.1]
  def change
    create_table :answers, id: :uuid do |t|
      t.column :question_id, :uuid
      t.column :description, :string

      t.timestamps
    end
  end
end

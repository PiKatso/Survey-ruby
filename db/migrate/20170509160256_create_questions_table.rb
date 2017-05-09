class CreateQuestionsTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:questions, id: :uuid) do |t|
      t.column(:question, :string)
      t.column(:survey_id, :uuid)

      t.timestamps
    end
  end
end

ActiveRecord::Base.connection.execute('create extension if not exists "pgcrypto"')
#this line allows uuids to work if the proper gem is not previously installed

class CreateTableSurvey < ActiveRecord::Migration[5.1]
  def change
    create_table(:surveys, id: :uuid) do |t|
      t.column(:name, :string)
      t.column(:description, :string)

      t.timestamps()
    end
  end
end

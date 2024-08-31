class CreateAccessLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :access_logs do |t|
      t.string :employee
      t.datetime :entry_time
      t.datetime :exit_time
      t.references :vehicle, null: false, foreign_key: true
      t.references :visitor, foreign_key: true
      t.timestamps
    end
  end
end

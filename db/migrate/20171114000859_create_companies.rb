class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.datetime :trial_status
      t.string :plan_level

      t.timestamps
    end
  end
end

class CreateRailsLiveDashboardEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :rails_live_dashboard_entries do |t|
      t.string :type, limit: 20, null: false
      t.string :batch_id, limit: 36, null: false
      t.json :content, null: false
      t.boolean :should_show, default: true
      t.datetime :created_at, null: false
    end

    add_index :rails_live_dashboard_entries, :batch_id
    add_index :rails_live_dashboard_entries, :created_at
  end
end

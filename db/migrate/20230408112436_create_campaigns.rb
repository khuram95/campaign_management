class CreateCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns do |t|
      t.references  :user, index: true, foreign_key: true, null: false
      t.string      :name
      t.string      :user_count
      t.integer     :status, default: 0

      t.timestamps
    end
  end
end

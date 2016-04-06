class CreateMediaTags < ActiveRecord::Migration
  def change
    create_table :media_tags do |t|
      t.integer :user_id
      t.string :link_url

      t.timestamps null: false
    end
  end
end

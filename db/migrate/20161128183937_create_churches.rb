class CreateChurches < ActiveRecord::Migration
  def change
    create_table :churches do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.binary :picture
      t.string :web_site
      t.text :description

      t.timestamps null: false
    end
  end
end

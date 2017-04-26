class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.references :user, foreign_key: true
      t.string :title, null: false, unique: true
      t.text :data, null: false, default: ''
      t.string :url, null: false
      t.text :encrypted_data, null: false, default: ''
      t.boolean :published, default: false

      t.timestamps
    end
  end
end

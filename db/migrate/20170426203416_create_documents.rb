class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.references :user, foreign_key: true
      t.string :title, null: false
      t.string :url, null: false
      t.text :encrypted_data, null: false, default: ''
      t.boolean :published, default: false
      t.string :alg1
      t.string :alg2
      t.string :alg3
      t.string :key1
      t.string :key2
      t.string :key3

      t.timestamps
    end
  end
end

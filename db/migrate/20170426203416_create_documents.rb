class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.references :user, foreign_key: true
      t.string :title, null: false
      t.string :url, null: false
      t.text :encrypted_data
      t.text :encrypted_data_iv
      t.boolean :published, default: false
      t.string :algorithms
      t.string :encryption_broker_key
      
      t.timestamps
    end
  end
end

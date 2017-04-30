# == Schema Information
#
# Table name: documents
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  title          :string           not null
#  url            :string           not null
#  encrypted_data :text             default(""), not null
#  published      :boolean          default("false")
#  alg1           :string
#  alg2           :string
#  alg3           :string
#  key1           :string
#  key2           :string
#  key3           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_documents_on_user_id  (user_id)
#

require 'openssl'

class Document < ApplicationRecord
  belongs_to :user

  attr_encrypted :data, key: 'This is a key that is 256 bits!!'
  validates :title, presence: true
  validates :data, presence: true
 
  # def encrypt
  #   algorithms = {
  #     "aes-256-cbc" => {
  #       name: "AES-256-CBC",
  #       key_size: 32
  #     },
  #     "aes-128-cbc" => {
  #       name: "AES-256-CBC",
  #       key_size: 32
  #     }
  #   }

  #   alg = algorithms[algorithms.keys.sample]
  #   self.alg1 = alg
  #   salt  = SecureRandom.random_bytes(64)
  #   key   = ActiveSupport::KeyGenerator.new(self.user.email).generate_key(salt, alg[:key_size])
  #   self.key1 = salt
  #   crypt = ActiveSupport::MessageEncryptor.new(key)
  #   encrypted_data = crypt.encrypt_and_sign(self.data)
  #   # s.unpack('H*')[0].upcase

  #   # alg = algorithms[algorithms.keys.sample]
  #   # self.alg2 = alg
  #   # salt  = SecureRandom.random_bytes(256)
  #   # key   = ActiveSupport::KeyGenerator.new(self.user.email).generate_key(salt, alg[:key_size])
  #   # self.key2 = key
  #   # crypt = ActiveSupport::MessageEncryptor.new(key)
  #   # encrypted_data = crypt.encrypt_and_sign(encrypted_data).unpack('H*')[0].upcase

  #   # alg = algorithms[algorithms.keys.sample]
  #   # self.alg3 = alg
  #   # salt  = SecureRandom.random_bytes(256)
  #   # key   = ActiveSupport::KeyGenerator.new(self.user.email).generate_key(salt, alg[:key_size])
  #   # self.key3 = key
  #   # crypt = ActiveSupport::MessageEncryptor.new(key)
  #   # self.encrypted_data = crypt.encrypt_and_sign(encrypted_data).unpack('H*')[0].upcase
  # end
end

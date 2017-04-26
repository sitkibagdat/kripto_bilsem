# == Schema Information
#
# Table name: documents
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  title          :string           not null
#  data           :text             default(""), not null
#  url            :string           not null
#  encrypted_data :text             default(""), not null
#  published      :boolean          default("f")
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_documents_on_user_id  (user_id)
#

class Document < ApplicationRecord
  belongs_to :user
end
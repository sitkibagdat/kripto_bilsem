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

require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

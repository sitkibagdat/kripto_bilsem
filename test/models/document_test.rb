# == Schema Information
#
# Table name: documents
#
#  id                    :integer          not null, primary key
#  user_id               :integer
#  title                 :string           not null
#  url                   :string           not null
#  encrypted_data        :text
#  encrypted_data_iv     :text
#  published             :boolean          default("false")
#  algorithms            :string
#  encryption_broker_key :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
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

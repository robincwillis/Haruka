# == Schema Information
#
# Table name: terms
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  kanji              :string(255)
#  kana               :string(255)
#  def                :string(255)
#  lit                :string(255)
#  desc               :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  phonetic           :string(255)
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

require 'test_helper'

class TermTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

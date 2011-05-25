require File.dirname(__FILE__) + '/../spec_helper'

describe InfoSubsection do
  it "should be valid" do
    InfoSubsection.new.should be_valid
  end
end

# == Schema Information
#
# Table name: info_subsections
#
#  id              :integer(4)      not null, primary key
#  info_section_id :integer(4)
#  content         :text
#  pos             :integer(4)
#  filename        :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#


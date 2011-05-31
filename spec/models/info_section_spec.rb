require File.dirname(__FILE__) + '/../spec_helper'

describe InfoSection do
  it "two info sections cannot have the same position" do
    @sec1 = Factory(:info_section)
    @sec2 = Factory(:info_section)
    @sec2.pos = @sec1.pos
    @sec1.should be_valid
    @sec2.should_not be_valid
  end

  it "cannot have more than 4 subsections" do
    section = Factory(:info_section)
    5.times{ Factory(:info_subsection, :info_section_id => section.id) }
    section.info_subsections.count.should eq 4
  end
end

# == Schema Information
#
# Table name: info_sections
#
#  id         :integer(4)      not null, primary key
#  title      :string(255)
#  pos        :integer(4)
#  created_at :datetime
#  updated_at :datetime
#


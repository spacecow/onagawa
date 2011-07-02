require File.dirname(__FILE__) + '/../spec_helper'

describe InfoSubsection do
  before(:each) do
    @section1 = Factory(:info_section)
  end
  it "subsection in the same section cannot have the same position" do
    @subsection1 = Factory(:info_subsection, :info_section_id => @section1.id)
    @subsection2 = Factory(:info_subsection, :info_section_id => @section1.id)
    @subsection2.pos = @subsection1.pos
    @subsection1.should be_valid
    @subsection2.should_not be_valid
  end
  it "subsection in different sections can have the same position" do
    @section2 = Factory(:info_section) 
    @subsection1 = Factory(:info_subsection, :info_section_id => @section1.id)
    @subsection2 = Factory(:info_subsection, :info_section_id => @section2.id)
    @subsection2.pos = @subsection1.pos
    @subsection1.should be_valid
    @subsection2.should be_valid
  end
end




# == Schema Information
#
# Table name: info_subsections
#
#  id              :integer(4)      not null, primary key
#  info_section_id :integer(4)
#  pos             :integer(4)
#  filename        :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  content_key     :string(255)
#


class InfoSectionsController < ApplicationController
  load_and_authorize_resource

  def index
    @info_sections = InfoSection.all
  end

  def show
    @info_section = InfoSection.find(params[:id])
    @info_sections = InfoSection.order("pos asc")
    @info_subsections = @info_section.info_subsections.order("pos asc")
    @info_subsection = params[:pos] ?
      @info_subsections.find_by_pos(params[:pos]) : @info_subsections.first
  end

  def new
    build_info_subsections
  end

  def create
    @info_section.pos = last_section_pos+1
    if @info_section.save
      update_info_subsections_pos
      redirect_to @info_section, :notice => created(:info_section)
    else
      build_info_subsections
      render :action => 'new'
    end
  end

  def edit
    @info_section = InfoSection.find(params[:id])
    build_info_subsections
  end

  def update
    @info_section = InfoSection.find(params[:id])
    if @info_section.update_attributes(params[:info_section])
      update_info_subsections_pos
      redirect_to @info_section, :notice  => updated(:info_section)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @info_section = InfoSection.find(params[:id])
    @info_section.destroy
    redirect_to info_sections_url, :notice => deleted(:info_section)
  end

  private
    
    def build_info_subsections
      (4-@info_section.info_subsections.count).times do
        @info_section.info_subsections.build
      end
    end
    def last_section_pos; InfoSection.count == 0 ? 0 : ordered_section_pos.last end
    def ordered_section_pos; InfoSection.select(:pos).order("pos asc").map(&:pos) end
    def update_info_subsections_pos
      @info_section.info_subsections.each_with_index do |info_subsection,i|
        info_subsection.update_attributes(:pos => i+1)
      end
    end
end

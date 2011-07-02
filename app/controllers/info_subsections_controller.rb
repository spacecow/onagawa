class InfoSubsectionsController < ApplicationController
  include PosController

  load_and_authorize_resource

  def index
    @info_sections = InfoSection.where(:marked_deleted => 0).order("pos asc")
    @info_section = InfoSection.find(params[:info_section_id])
    @info_subsections = @info_section.info_subsections.order("pos asc")
  end

  def show
    @info_subsection = InfoSubsection.find(params[:id])
  end

  def new
    @info_subsection = InfoSubsection.new
  end

  def create
    @info_subsection = InfoSubsection.new(params[:info_subsection])
    if @info_subsection.save
      redirect_to @info_subsection, :notice => created(:info_subsection)
    else
      render :action => 'new'
    end
  end

  def edit
    @info_subsection = InfoSubsection.find(params[:id])
  end

  def update
    @info_subsection = InfoSubsection.find(params[:id])
    if @info_subsection.update_attributes(params[:info_subsection])
      redirect_to @info_subsection, :notice  => updated(:info_subsection)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @info_subsection = InfoSubsection.find(params[:id])
    @info_subsection.destroy
    redirect_to info_subsections_url, :notice => deleted(:info_subsection)
  end

  private
    def child; @info_subsection end
    def parent; @info_section ||= InfoSection.find(params[:info_section_id]) end
    def pos_function; "switch_redis_content_key" end
    def switch_redis_content_key(p1,p2)
      $redis["en."+p1.content_key],$redis["en."+p2.content_key] =
      $redis["en."+p2.content_key],$redis["en."+p1.content_key]
      $redis["ja."+p1.content_key],$redis["ja."+p2.content_key] =
      $redis["ja."+p2.content_key],$redis["ja."+p1.content_key]
    end
end

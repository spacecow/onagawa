class InfoSectionsController < ApplicationController
  load_and_authorize_resource

  def index
    @info_sections = InfoSection.all
  end

  def show
    @info_section = InfoSection.find(params[:id])
    @info_subsections = @info_section.info_subsections
  end

  def new
    @info_section = InfoSection.new
  end

  def create
    @info_section = InfoSection.new(params[:info_section])
    if @info_section.save
      redirect_to @info_section, :notice => created(:info_section)
    else
      render :action => 'new'
    end
  end

  def edit
    @info_section = InfoSection.find(params[:id])
  end

  def update
    @info_section = InfoSection.find(params[:id])
    if @info_section.update_attributes(params[:info_section])
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
end

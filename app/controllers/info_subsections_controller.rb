class InfoSubsectionsController < ApplicationController
  load_and_authorize_resource

  def index
    @info_subsections = InfoSubsection.all
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
end
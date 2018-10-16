class SectionsController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in
  before_action :find_page
  before_action :set_section_count, :only => [:new, :create, :edit, :update]

  def index
    @sections = @page.sections.sorted
  end

  def show
    @section = Section.find(params[:id])
    last_edited_by_id = SectionEdit.find_by_section_id(@section.id)
    @last_edited_by_username = nil
    if (last_edited_by_id)
      @last_edited_by_username = AdminUser.find_by_id(last_edited_by_id.admin_user_id).username
    end
  end

  def new
    @section = Section.new(:page_id => @page.id)
  end

  def create
    @section = Section.new(section_params)
    @section.page = @page
    if @section.save
      # add last user to modify this section
      @section_edit = SectionEdit.new(:section_id => @section.id, :admin_user_id => session[:user_id])
      @section_edit.save
      flash[:notice] = "Section created successfully."
      redirect_to(sections_path(:page_id => @page.id))
    else
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      @section_edit = SectionEdit.new(:section_id => @section.id, :admin_user_id => session[:user_id])
      @section_edit.save
      flash[:notice] = "Section updated successfully."
      redirect_to(section_path(@section, :page_id => @page.id))
    else
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "Section destroyed successfully."
    redirect_to(sections_path(:page_id => @page.id))
  end

  private

  def section_params
    params.require(:section).permit(:name, :position, :visible, :content_type, :content)
  end

  def find_page
    @page = Page.find(params[:page_id])
  end

  def set_section_count
    @section_count = @page.sections.count
    if params[:action] == 'new' || params[:action] == 'create'
      @section_count += 1
    end
  end

end

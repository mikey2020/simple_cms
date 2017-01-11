class SectionsController < ApplicationController
  
 layout 'admin'
  def index
  	@sections = Section.all
  end

  def show
  	@section = Section.find(params[:id])
  end
  
  def new
   @section = Section.new(:content_type => 'null',:content => 'empty')
  end 
  
  def create
  	@section = Section.new(section_params)
  	@section.save
  	if @section.save 
  		flash[:notice] = "Section created successfully"
  		redirect_to(sections_path)
  	else
  		render('new')	
  	end	
  end 

  def edit
  	@section = Section.find(params[:id])
  end
  
  def update 
  	@section = Section.find(params[:id])
  	@section.update_attributes(section_params)
  	flash[:notice] = "Section updated successfully"
  	redirect_to(section_path(@section))
  end 
  	
  def delete
  	@section = Section.find(params[:id])
  end

  def destroy 
  	@section = Section.find(params[:id])
     if @section.destroy
	  	 flash[:notice] = "Section '#{@section.name}' deleted successfully"
	  	 redirect_to(sections_path)
  	else 
  	   render('delete')
  	end   	
  end 

  private 
  def section_params
  	params.require(:section).permit(:name,:page_id,:position,:content_type,:content,:visible)
  end	
end

class PagesController < ApplicationController
  layout 'admin'

  def index
  	@pages = Page.all
  end

  def show
  	@page = Page.find(params[:id])
  end
 
  def new 
  	@page = Page.new(:name => "default page")
  end
  
  def create
  	@page = Page.new(page_params)
  	@page.save
  	if @page.save
  		flash[:notice] = "Page added successfully"
  		redirect_to(pages_path)
  	else
  		render('new')	
  	end	
  end

  def edit
  	@page = Page.find(params[:id])
  end
  
  def update
  	@page = Page.find(params[:id])
  	@page.update_attributes(page_params)
  	if @page.update_attributes(page_params)
  		flash[:notice] = "Page update successful"
  		redirect_to(page_path@page)
  	else
  		render('edit')	
  	end	
  end
  	
  def delete
  	@page = Page.find(params[:id])
  end

  def destroy
  	@page = Page.find(params[:id])
  	@page.destroy
  	if @page.destroy 
  		flash[:notice] = "Page '#{@page.name}' deleted successfully"
  		redirect_to(pages_path)
  	else
  		flash[:error] = "Page #{@page.name} not deleted"
  		render('delete')	
  	end	
  end

  
  private 
  def page_params
  	params.require(:page).permit(:name,:position,:subject_id,:permalink,:visible)
  end

end

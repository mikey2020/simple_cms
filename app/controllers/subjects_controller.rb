class SubjectsController < ApplicationController
  
 layout 'admin'

  def index
    @subjects = Subject.sort
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new(:name => "default" ,:position => 0)
  end
  
  def create
    #instantiate a new object using form parameters
    @subject = Subject.new(subject_params)
    #save object
    @subject.save
    #if save is successful,redirect to index page
    flash[:notice] = "Subject added successfully"
    if @subject.save
      redirect_to(subjects_path)#supossed to use subjects_path here but just this incase of error change
    #is save is unsuccessful,return form page to user to fix problems 
    else
      render('new')
    end  
  end 
    
  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    #find a new object using form parameters
    @subject = Subject.find(params[:id])
    #update object
    @subject.update_attributes(subject_params)
    #if update is successful,redirect to index page
    flash[:notice] = "Subject updated successfully"
    if @subject.update_attributes(subject_params)
      redirect_to(subject_path(@subject))#supossed to use subjects_path here but just this incase of error change
    #is save is unsuccessful,return form page to user to fix problems 
    else
      render('edit')
    end  
  end 

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject '#{@subject.name}' deleted successfully"
    redirect_to(subjects_path)
  end 
  #am defining this method so i dont have to repeat the code everytime i need it in a CRUD method
  #a private ruby method that allows attributes to be assign to an object  
  private
  def subject_params
    params.require(:subject).permit(:name,:position,:visible)
  end  
end

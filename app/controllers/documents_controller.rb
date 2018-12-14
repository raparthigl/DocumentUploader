class DocumentsController < ApplicationController
    before_action :get_project
    
  def index
       @documents = @project.documents
	end

	def create
    @document = @project.documents.build(document_params)
    if @document.save
      redirect_to project_documents_path(@project), notice: "File uploaded successfully"
    else
      render :new
    end 
	end

	def new
		@document = @project.documents.build
	end	

  private 

  def get_project
  	@project = Project.find(params[:project_id])
  end

  def document_params
    params.require(:document).permit(:name, :attachment)
  end  
end
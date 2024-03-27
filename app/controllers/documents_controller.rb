class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  def index
    @documents = Document.all
  end

  def show
  end

  def new
    @document = Document.new
    @children = current_user.children
    @parents = @children.map(&:parents).flatten.uniq
  end

  def create
    @document = Document.new(document_params)
    @document.document_creator_id = current_user.id
    if @document.save
      redirect_to document_path(@document)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @children = current_user.children
    @parents = @children.map(&:parents).flatten.uniq
  end

  def update
    if @document.update(document_params)
      redirect_to document_path(@document), notice: "Changements enregistrés avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @document.destroy
    redirect_to documents_path, notice: "Document supprimé avec succès."
  end

  private

  def set_document
    @document = Document.find(params[:id])
  end

  def document_params
    params.require(:document).permit(:title, :rich_details, :category, :child_id, :doctype, :document_creator_id, :attachment)
  end
end

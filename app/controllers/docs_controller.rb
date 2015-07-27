class DocsController < ApplicationController
  before_action :set_folder #, only: [:new, :show, :edit, :update, :destroy]
  before_action :set_doc, only: [:show, :edit, :update, :destroy]

  # GET /docs
  # GET /docs.json
  def index
    @docs = Doc.all
  end

  # GET /docs/1
  # GET /docs/1.json
  # (updated to nest inside folder)
  def show
  end

  # GET /docs/new
  # (updated to nest inside folder)
  def new
    @doc = Doc.new
    8.times {@doc.sections.build}
  end

  # GET /docs/1/edit
  # (updated to nest inside folder)
  def edit
    (8 - @doc.sections.size).times {@doc.sections.build}
  end

  # POST /docs
  # POST /docs.json
  # (updated to nest inside folder)
  def create
    @doc = Doc.new(doc_params)

    respond_to do |format|
      if @folder.docs << @doc
        format.html { redirect_to [@folder, @doc], notice: 'Doc was successfully created.' }
        format.json { render :show, status: :created, location: @doc }
      else
        format.html { render :new }
        format.json { render json: @doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /docs/1
  # PATCH/PUT /docs/1.json
  # (updated to nest inside folder)
  def update
    respond_to do |format|
      if @doc.update(doc_params)
        
        format.html { redirect_to [@folder, @doc], notice: 'Doc was successfully updated.' }
        format.json { render :show, status: :ok, location: @doc }
      else
        format.html { render :edit }
        format.json { render json: @doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /docs/1
  # DELETE /docs/1.json
  # (updated to nest inside folder)
  def destroy
    @doc.destroy
    respond_to do |format|
      format.html { redirect_to @folder, notice: 'Doc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doc
      @doc = @folder.docs.find(params[:id])
    end
    
    def set_folder
      @folder = Folder.find(params[:folder_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doc_params
      params.require(:doc).permit(:fileType, :title, :sections_attributes => [:id, :title, :content, :_destroy])
    end
end

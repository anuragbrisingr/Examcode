class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /sections
  # GET /sections.json
  def index
    @sections = Section.all
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
  end
  
  def student
   @section = Section.find(params[:obj]['id'].to_i)
  end
  
  def categ
   @sections = Section.all
   @usersection = UserSection.new
  end
  
  def calc
   #byebug
   if params[:section]
     @calcs = []
     params[:section].each do |x|
       @calcs << 1 if Question.find(x[0]).cans == Answer.find(x[1]["answer_id"]).content   
     end
     @calcs = @calcs.inject(:+)
   end
 
   u=current_user.user_sections.new  
   u.section_id = params[:section_id].to_i
   u.save
   end
  # GET /sections/new
  def new
    @section = Section.new
    
  5.times do
    question = @section.questions.build
    4.times { question.answers.build }
  end
  end

  # GET /sections/1/edit
  def edit
   byebug
  end

  # POST /sections
  # POST /sections.json
  def create
    @section = Section.new(section_params)

    respond_to do |format|
      if @section.save
        format.html { redirect_to @section, notice: 'Section was successfully created.' }
        format.json { render :show, status: :created, location: @section }
      else
        format.html { render :new }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to @section, notice: 'Section was successfully updated.' }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to sections_url, notice: 'Section was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:name, questions_attributes: [:content, :cans,  answers_attributes: [:content]])
    end
end

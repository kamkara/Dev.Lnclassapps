class AnwsersController < ApplicationController
  before_action :authenticate_user!, :set_question
  before_action :set_anwser, only: %i[ show edit update destroy ]

  # GET /anwsers or /anwsers.json
  def index
    @anwsers = Anwser.all
  end

  # GET /anwsers/1 or /anwsers/1.json
  def show

  end

  # GET /anwsers/new
  def new
    @anwser = @question.anwsers.build
  end

  # GET /anwsers/1/edit
  def edit
  end

  # POST /anwsers or /anwsers.json
  def create
    @anwser = @question.anwsers.build(anwser_params)
    @anwser.user_id = current_user.id

    respond_to do |format|
      if @anwser.save
        format.html { redirect_to question_path(@question), notice: "Anwser was successfully created." }
        format.json { render :show, status: :created, location: @anwser }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @anwser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /anwsers/1 or /anwsers/1.json
  def update
    respond_to do |format|
      if @anwser.update(anwser_params)
        format.html { redirect_to anwser_url(@anwser), notice: "Anwser was successfully updated." }
        format.json { render :show, status: :ok, location: @anwser }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @anwser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anwsers/1 or /anwsers/1.json
  def destroy
    @anwser.destroy

    respond_to do |format|
      format.html { redirect_to anwsers_url, notice: "Anwser was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anwser
      @anwser = Anwser.find(params[:id])
    end

    def set_question
      @question = Question.friendly.find(params[:question_id])
    end
    # Only allow a list of trusted parameters through.
    def anwser_params
      params.require(:anwser).permit(:content, :user_id, :question_id)
    end
end
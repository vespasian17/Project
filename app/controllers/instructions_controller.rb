class InstructionsController < ApplicationController
  before_action :set_instruction, only: [:show, :edit, :update, :destroy]
  
  def index
    @instructions = current_user.instructions.all
  end

  def show
  end

  def new
    @instruction = Instruction.new
  end

  def edit
  end

  def create
    @user = current_user
    @instruction = @user.instructions.build(instruction_params)

    respond_to do |format|
      if @instruction.save
        format.html { redirect_to @instruction, notice: 'Instruction was successfully created.' }
        format.json { render :show, status: :created, location: @instruction }
      else
        format.html { render :new }
        format.json { render json: @instruction.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @instruction.update(instruction_params)
        format.html { redirect_to @instruction, notice: 'Instruction was successfully updated.' }
        format.json { render :show, status: :ok, location: @instruction }
      else
        format.html { render :edit }
        format.json { render json: @instruction.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @instruction.destroy
    respond_to do |format|
      format.html { redirect_to instructions_url, notice: 'Instruction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_instruction
      @instruction = Instruction.find(params[:id])
      @qr = RQRCode::QRCode.new( @instruction.url_youtube, :size => 4, :level => :h )
    end

    def instruction_params
      params.require(:instruction).permit(:body, :step_id, :category_id, :url_youtube, :all_tags, :title)
    end
end

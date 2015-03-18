class StepsController < ApplicationController
  before_action :set_list
  before_action :set_step, only: [:show, :edit, :update, :destroy]

  def index
    @steps = @list.steps
  end

  def show
  end

  def new
    @step = @list.steps.build
  end

  def edit
  end

  def create
    @step = Step.new(step_params)

    respond_to do |format|
      if @step.save
        format.html { redirect_to list_steps_path(@list), notice: 'Step was successfully created.' }
        format.json { render :show, status: :created, location: @step }
      else
        format.html { render :new }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @step.update(step_params)
        format.html { redirect_to list_steps_path(@list), notice: 'Step was successfully updated.' }
        format.json { render :show, status: :ok, location: @step }
      else
        format.html { render :edit }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @step.destroy
    respond_to do |format|
      format.html { redirect_to list_steps_path(@list), notice: 'Step was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_step
      @step = @list.steps.find(params[:id])
    end

    def step_params
      params.require(:step).permit(:content, :list_id)
    end

    def set_list
      @list = List.find(params[:list_id])
    end
end

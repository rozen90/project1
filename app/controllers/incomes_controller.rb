class IncomesController < ApplicationController
  before_action :set_income, only: [:show, :edit, :update, :destroy]
  before_filter :set_expenses!

  # GET /incomes
  # GET /incomes.json
  def index
    @incomes = @income_category.incomes.all
  end

  # GET /incomes/1
  # GET /incomes/1.json
  def show; end

  # GET /incomes/new
  def new
    @income = Income.new
  end

  # GET /incomes/1/edit
  def edit; end

  # POST /incomes
  # POST /incomes.json
  def create
    @income = @income_category.incomes.new(income_params)

    respond_to do |format|
      if @income.save
        format.html { redirect_to income_category_incomes_path(@income_category), notice: 'Income was successfully created.' }
        format.json { render :show, status: :created, location: @income }
        #format.js
      end
    end
  end

  # PATCH/PUT /incomes/1
  # PATCH/PUT /incomes/1.json
  def update
    respond_to do |format|
      if @income.update(income_params)
        format.html { redirect_to income_category_incomes_path(@income_category), notice: 'Income was successfully updated.' }
        format.json { render :show, status: :ok, location: @income }
        #format.js
      else
        format.html { render :edit }
        format.json { render json: @income.errors, status: :unprocessable_entity }
        #format.js
      end
    end
  end

  # DELETE /incomes/1
  # DELETE /incomes/1.json
  def destroy
    @income.destroy
    respond_to do |format|
      format.html { redirect_to [@income_category, @income], notice: 'Income was successfully destroyed.' }
      format.json { head :no_content }
      #format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_income
      @income = Income.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def income_params
      params.require(:income).permit(:date, :price, :income_category_id)
    end

    def set_expenses!
      @income_category = IncomeCategory.find(params[:income_category_id]) rescue nil
      if !@income_category
        redirect_to root_path, :alert => "Post not found!"
      end
    end
end

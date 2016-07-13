class IncomeCategoriesController < ApplicationController
  before_action :set_income_category, only: [:show, :edit, :update, :destroy]

  def search
    d1 = Date.civil(params[:userect]["born_on(1i)"].to_i, params[:userect]["born_on(2i)"].to_i, params[:userect]["born_on(3i)"].to_i) 
    d2 = Date.civil(params[:userwe]["born_on(1i)"].to_i, params[:userwe]["born_on(2i)"].to_i, params[:userwe]["born_on(3i)"].to_i)
    income_category = Income.where(income_category_id: params[:people])
    @s = income_category.where(date: d1..d2)

    respond_to do |format|
        format.html { }
        format.csv {send_data @s.to_csv}
        format.xls #{send_data @s.to_csv(col_sep: "\t") }
    end
  end

  # GET /income_categories
  # GET /income_categories.json
  def index
    @income_categories = IncomeCategory.where(user_id: current_user)
    @expense_categories = ExpenseCategory.where(user_id: current_user)
  end

  # GET /income_categories/1
  # GET /income_categories/1.json
  def show
  end

  # GET /income_categories/new
  def new
    @income_category = IncomeCategory.new
  end

  # GET /income_categories/1/edit
  def edit
  end

  # POST /income_categories
  # POST /income_categories.json
  def create
    @income_category = current_user.income_categories.new(income_category_params)

    respond_to do |format|
      if @income_category.save
        format.html { redirect_to income_categories_path, notice: 'Income category was successfully created.' }
        format.json { render :show, status: :created, location: @income_category }
      else
        format.html { render :new }
        format.json { render json: @income_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /income_categories/1
  # PATCH/PUT /income_categories/1.json
  def update
    respond_to do |format|
      if @income_category.update(income_category_params)
        format.html { redirect_to income_categories_path, notice: 'Income category was successfully updated.' }
        format.json { render :show, status: :ok, location: @income_category }
      else
        format.html { render :edit }
        format.json { render json: @income_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /income_categories/1
  # DELETE /income_categories/1.json
  def destroy
    @income_category.destroy
    respond_to do |format|
      format.html { redirect_to income_categories_url, notice: 'Income category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_income_category
      @income_category = IncomeCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def income_category_params
      params.require(:income_category).permit(:title, :description, :user_id)
    end

end

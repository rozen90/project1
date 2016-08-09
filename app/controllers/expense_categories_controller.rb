class ExpenseCategoriesController < ApplicationController
  before_action :set_expense_category, only: [:show, :edit, :update, :destroy]

  def search
    d1 = Date.civil(params[:userect]["born_on(1i)"].to_i, 
                    params[:userect]["born_on(2i)"].to_i, 
                    params[:userect]["born_on(3i)"].to_i) 
    d2 = Date.civil(params[:userwe]["born_on(1i)"].to_i, 
                    params[:userwe]["born_on(2i)"].to_i, 
                    params[:userwe]["born_on(3i)"].to_i)
    expense_category = Expense.where(expense_category_id: params[:people])
    @s = expense_category.where(date: d1..d2)

    respond_to do |format|
      format.html { }
      format.csv {send_data @s.to_csv}
      format.xls #{send_data @s.to_csv(col_sep: "\t") }
    end
  end

  # GET /expense_categories
  # GET /expense_categories.json
  def index
    @expense_categories = ExpenseCategory.all
  end

  # GET /expense_categories/1
  # GET /expense_categories/1.json
  def show; end

  # GET /expense_categories/new
  def new
    @expense_category = ExpenseCategory.new
  end

  # GET /expense_categories/1/edit
  def edit; end

  # POST /expense_categories
  # POST /expense_categories.json
  def create
    @expense_category = current_user.expense_categories.new(expense_category_params)

    respond_to do |format|
      if @expense_category.save
        format.html { redirect_to income_categories_path, notice: 'Expense category was successfully created.' }
        format.json { render :show, status: :created, location: @expense_category }
        format.js
      else
        format.html { render :new }
        format.json { render json: @expense_category.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /expense_categories/1
  # PATCH/PUT /expense_categories/1.json
  def update
    respond_to do |format|
      if @expense_category.update(expense_category_params)
        format.html { redirect_to income_categories_path, notice: 'Expense category was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense_category }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @expense_category.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /expense_categories/1
  # DELETE /expense_categories/1.json
  def destroy
    @expense_category.destroy
    respond_to do |format|
      format.html { redirect_to income_categories_path, notice: 'Expense category was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense_category
      @expense_category = ExpenseCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_category_params
      params.require(:expense_category).permit(:title, :description, :user_id)
    end
end

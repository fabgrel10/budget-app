class ExpensesController < ApplicationController
  def index
    @user = current_user
    @category = Category.find(params[:category_id])
    @category_expenses = CategoryExpense.includes(:expense)
      .where(category_id: params[:category_id]).order(created_at: :desc)
  end

  def new
    @expense = Expense.new
    @categories = current_user.categories
  end

  def create
    @expense = Expense.new(name: params[:name], amount: params[:amount])
    @expense.user_id = current_user.id
    respond_to do |format|
      if @expense.save
        category_expense = CategoryExpense.new(category_id: params[:categories], expense_id: @expense.id)
        category_expense.save
        format.html do
          redirect_to category_expenses_path(category_id: params[:categories]),
                      notice: 'New expense created successfully!'
        end
      else
        format.html { render :new, alert: 'Failed to create expense' }
      end
    end
  end
end

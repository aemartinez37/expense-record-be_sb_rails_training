class ExpensesController < ApplicationController
  def create

    user = User.find(params[:user_id])
    expense = user.expenses.create(expense_params)
    unless expense.save
      return render json: { message: expense.errors.messages },
                    status: :unprocessable_entity
    end

    render json: { message: 'Create Success',
    expense: }

  end

  def update
    user = User.find(params[:user_id])
    expense = user.expenses.find(params[:id])

    unless expense.update(expense_params)
      return render json: { message: expense.errors.full_messages },
                    status: :unprocessable_entity
    end

    render json: { message: 'Update Success',
    expense: }
  end

  def all
    user = User.find(params[:user_id])
    render json: user.expenses.all
  end

  def index
    render json: Expense.all
  end

  def show
    user = User.find(params[:user_id])
    expense = user.expenses.find(params[:id])

    render json: expense
  end

  def destroy
    user = User.find(params[:user_id])
    expense = user.expenses.find(params[:id])

    unless expense.destroy
      return render json: { message: expense.errors.full_messages },
                    status: :unprocessable_entity
    end

    render json: { message: 'Destroy Success',
    expense: expense }

  end

  private
    def expense_params
      params.require(:expense).permit(:spending_date, :description, :type, :value)
    end
  end

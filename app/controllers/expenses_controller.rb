class ExpensesController < ApplicationController
  def create

    @user = User.find(params[:user_id])
    @expense = @user.expenses.create(expense_params)
    unless @expense.save
      return render json: { message: expense.errors.full_messages },
                    status: :unprocessable_entity
    end

    render json: { message: 'Create Success',
    expense: @expense }

  end

  def destroy
    @user = User.find(params[:user_id])
    @expense = @user.expenses.find(params[:id])

    unless @expense.destroy
      return render json: { message: expense.errors.full_messages },
                    status: :unprocessable_entity
    end

    render json: { message: 'Destroy Success',
    expense: @expense }

  end

  private
    def expense_params
      params.require(:expense).permit(:spending_date, :description, :type, :value)
    end
  end

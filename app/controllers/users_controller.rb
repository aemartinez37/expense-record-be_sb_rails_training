class UsersController < ApplicationController
    def create
      user = User.new(user_params)
  
      unless user.save
        return render json: { message: user.errors.full_messages },
                      status: :unprocessable_entity
      end
  
      render json: { message: 'Create Success',
                     user: }
    end
  
    def update
      user = User.find(params[:id])
  
      unless user.update(user_params)
        return render json: { message: user.errors.full_messages },
                      status: :unprocessable_entity
      end
  
      render json: { message: 'Update Success',
                     user: }
    end
  
    def index
      render json: User.all
    end
  
    def show
      users = User.where(username: params[:username])

      unless users[0]
        return render json: { message: "Couldn't find username" },
                      status: :not_found
      end
  
      render json: users[0]
    end
  
    def destroy
      user = User.find(params[:id])
  
      unless user.destroy
        return render json: { message: user.errors.full_messages },
                      status: :unprocessable_entity
      end
  
      render json: { message: 'Destroy Success',
                     user: }
    end
  
    private
  
    def user_params
      params.permit(:username, :full_name, :email)
    end
  end

class Admins::UsersController < Admins::BaseController
  before_action :find_user, only: %i(edit update destroy)

  def index
    @users = User.user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      flash[:info] = t ".success"
      redirect_to admins_users_path
    else
      flash[:danger] =  t ".error"
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".success"
      redirect_to  admins_users_path
    else
      flash[:danger] =  t".not_update"
      render :edit
    end
  end

  def destroy
    @user.destroy

    if @user.destroyed?
      flash[:success] = t ".success_destroy_user"
      redirect_to request.referrer
    else
      flash[:danger] = t ".danger_destroy_user"
      redirect_to request.referrer
    end
  end

  private

  def user_params
    params.require(:user).permit User::USER_PARAMS
  end

  def find_user
    @user = User.find_by id: params[:id]
    redirect_to root_path unless @user
  end
end

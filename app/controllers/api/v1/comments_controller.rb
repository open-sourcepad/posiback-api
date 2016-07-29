class Api::V1::CommentsController < ApiController


  def index
    render json: collection
  end

  def show
    render json: obj
  end

  def create
    obj = user.feedbacks.new(obj_params)
    obj.nansiback = current_user

    if obj.save
      render json: obj
    else
      render json: { message: 'Validation failed', errors: obj.errors.full_messages }, status: 422
    end
  end


  private

  def obj
    @obj ||= Feedback.find(params[:id])
  end

  def user
    @user ||= User.find(params[:user_id])
  end

  def obj_params
    params.require(:comment).permit(*%i(content))
  end


end

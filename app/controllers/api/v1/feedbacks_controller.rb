class Api::V1::FeedbacksController < ApiController


  def index
    render json: {feedbacks: collection}
  end

  def show
    # include comments
    render json: obj
  end

  def create
    obj = collection.new(obj_params)
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

  def collection
    @collection ||= user.feedbacks_received
  end

  def obj_params
    params.require(:feedback).permit(*%i(content category))
  end


end

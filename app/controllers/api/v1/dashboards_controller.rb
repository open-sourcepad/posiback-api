class Api::V1::DashboardsController < ApiController

  def index
    users = User.all.includes(:feedbacks_received)

    render json: {
      users: users.map do |u|
        output = u.attributes.slice(*%i(email first_name last_name))
        output[:positive_feedbacks] = u.feedbacks_received.positive.count
        output[:negative_feedbacks] = u.feedbacks_received.negative.count
        output
      end
    }
  end

end

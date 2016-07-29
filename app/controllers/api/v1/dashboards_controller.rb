class Api::V1::DashboardsController < ApiController

  def show
    users = User.all.includes(:feedbacks_received)

    render json: {
      users: users.map do |u|
        output = u.attributes.slice(*%w(email first_name last_name))
        output[:positive_feedbacks] = u.feedbacks_received.positive.count
        output[:negative_feedbacks] = u.feedbacks_received.negative.count
        output
      end
    }
  end

end

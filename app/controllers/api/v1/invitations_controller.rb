class Api::V1::InvitationsController < ApiController

  def index
    render json: {message: "Helloooo"}
  end

  def create
    invitation = InvitationService::CreateInvitationService.new(current_user, params[:email], params[:account_id]).call
    render json: { invitation: invitation }
  rescue StandardError => e
    render json: { error: e }, status: 400

  end


end
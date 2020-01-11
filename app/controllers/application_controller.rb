class ApplicationController < ActionController::API
  def addMembers
    @members = (params[:emails])
    @members.each do |member|
      memberEntry = Member.create({
                                 email: member[:email],
                                 name: member[:name]
                             })
      memberEntry.save
    end

    render json: {status: 'SUCCESS'}
  end

  def inviteMembers
    @emails = params[:emails]
    ApplicationJob.perform_later(@emails)
    render json: {status: 'SUCCESS'}
  end
end

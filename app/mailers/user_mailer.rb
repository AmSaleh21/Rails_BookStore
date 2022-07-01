class UserMailer < ApplicationMailer
    default from: "from@example.com"

    def post_created
      creator = params[:id]
      @user = User.find(1)
      mail(to: @user.email, subject: 'product post created')
    end
    
end

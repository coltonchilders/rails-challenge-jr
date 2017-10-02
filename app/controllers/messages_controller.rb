class MessagesController < ApplicationController
    def index
		@messages = Message.all
	end
    
    def not_found
        raise ActionController::RoutingError.new('Not Found')
    end
    
    def auth
        @message = Message.find(params[:id])
    end
    
    def destroy
        @message = Message.find(params[:id])
        @message.destroy
        redirect_to :action => :index, status: 303
    end
    
    def new
        @message = Message.new
    end
    
    def create
        @message = Message.new(message_params)
        if !@message.password_digest
            @message.password_digest = "no-password"
        end
   	    if @message.save
      	 redirect_to '/messages'
        else
      	 render 'new'
        end
    end
    
    def show
        @message = Message.find(params[:id])

        if @message.password_digest != "no-password"
            redirect_to '/messages/' + @message.id.to_s + '/' + @message.token + '/auth'
        else
            @message.destroy
        end
    end
    
    def update
        @message = Message.find(params[:id])
        if password_param[:pw] != nil
            @res = @message.authenticate(password_param[:pw])
            if @res
                @message.password_digest = "no-password"
                @message.save
                redirect_to '/' + @message.id.to_s + '/' + @message.token
            else
                flash.now[:alert] = 'Incorrect password'
                render 'auth'
            end
        else
            render 'auth'
        end
    end
    private
        def password_param
            params.require(:message).permit( :pw)
        end
    private
        def message_params
            params.require(:message).permit( :body, :email, :token, :password)
        end
end

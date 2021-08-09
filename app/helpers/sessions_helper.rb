module SessionsHelper
    def log_in(group)
        session[:group_id] = group.id
    end

    def remember(group)
      group.remember
      cookies.permanent.signed[:group_id] = group.id
      cookies.permanent[:remember_token] = group.remember_token
    end

    def current_group
        if (group_id = session[:group_id])
            @current_group ||= Group.find_by(id: group_id)
        elsif (group_id = cookies.signed[:group_id])
            group = Group.find_by(id: group_id)
            if group && group.authenticated?(cookies[:remember_token])
                log_in group
                @current_group = group
            end
        end
    end

    # def current_user
    #     if (user_id = session[:user_id])
    #         @current_user ||= User.find_by(id: user_id)
        
    #     end
    # end

    def logged_in?
        !current_group.nil?
    end

    def forget(group)
        group.forget
        cookies.delete(:group_id)
        cookies.delete(:remember_token)
    end

    def log_out
        forget(current_group)
        session.delete(:group_id)
        @current_group = nil
    end

    def current_group?(group)
        group == current_group
    end

    def redirect_back_or(default)
        redirect_to(session[:forwarding_url] || default)
        session.delete(:forwarding_url)
    end

    # アクセスしようとしたURLを覚えておく
    def store_location
        session[:forwarding_url] = request.original_url if request.get?
    end
end

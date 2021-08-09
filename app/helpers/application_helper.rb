module ApplicationHelper

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

    def logged_in?
        !current_group.nil?
    end

end

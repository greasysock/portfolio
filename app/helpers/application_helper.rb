module ApplicationHelper
    def login_helper
        if current_user.is_a? GuestUser
            (link_to "login", new_user_session_path) +
            " ".html_safe +
            (link_to "register", new_user_registration_path)
        elsif current_user.is_a? User
            link_to "logout", destroy_user_session_path, method: :delete
        end
    end

    def source_helper
        if session[:source]
            greeting = "Thanks for visiting me from #{session[:source]}"
            content_tag(:p,greeting, class: "source-greeting")
        end
    end

    def nav_items
        [
            {
                url: root_path,
                title: "HOME"
            },
            {
                url: blogs_path,
                title: 'BLOG'
            },
            {
                url: portfolios_path,
                title: 'PORTFOLIO'
            },
            {
                url: about_path,
                title: 'ABOUT ME'
            },
            {
                url: contact_path,
                title: 'CONTACT'
            }
        ]
    end

    def nav_helper
        nav_links = ''
        nav_items.each.with_index do |item, index|
            nav_links << content_tag(:span, " / ", class: "footdogs") unless index.equal? 0
            nav_links << link_to(active(item[:url], item[:title]), item[:url])
        end
        nav_links.html_safe
    end

    def active(path, title)
        if current_page? path
            "[#{title}]"
        else
            title
        end
    end
end

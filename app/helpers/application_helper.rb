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

    def social_links
        [
            {icon: 'github', url: 'https://github.com/greasysock'},
            {icon: 'linkedin', url: 'https://linkedin.com/in/chris-gresock'}
        ]
    end

    def social_helper
        out_social = ''
        out_social << content_tag( :ol, class: "list-unstyled social-links") do
            social_links.collect do |item|
                content_tag(:li) do
                    link_to (fa_icon item[:icon]), item[:url], target: "_blank"
                end
            end.join.html_safe
        end
        out_social.html_safe
    end
end

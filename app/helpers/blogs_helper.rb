module BlogsHelper

    def status_button(blog)
        btn = "btn"
        case blog.status.to_sym
        when :draft
            "#{btn} btn-secondary"
        when :published
            "#{btn} btn-success"
        end
    end

    def admin_controls blog
        if logged_in?(:site_admin)
            content_tag :div, class: "card blogs-admin" do
                content_tag(:a, "Edit", class: "btn btn-warning", href: edit_blog_path(blog)) + "<br>".html_safe + 
                content_tag(:a, "Delete", class: "btn btn-danger", href: url_for(blog), method: :delete, data: { confirm: 'Are you sure?' }) +
                content_tag(:a, blog.status.capitalize, class: status_button(blog), href: toggle_status_blog_path(blog), method: :delete, data: { confirm: 'Are you sure?' })
            end
        end
    end

    def markdown content
        options = {
            filter_html:     true,
            link_attributes: { rel: 'nofollow', target: "_blank" },
            space_after_headers: true,
            prettify: true
          }
        renderer = Redcarpet::Render::HTML.new(options)
        markdown = Redcarpet::Markdown.new(renderer, extensions = {})
        markdown.render(content).html_safe
    end

    def random_lego_logo
        "https://randomuser.me/portraits/lego/#{rand(9)}.jpg"
    end
end

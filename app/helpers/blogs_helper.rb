module BlogsHelper
    def admin_controls blog
        if logged_in?(:site_admin)
            content_tag(:a, "Edit", class: "btn btn-outline-warning", href: edit_blog_path(blog)) +
            content_tag(:a, "Delete", class: "btn btn-outline-danger", href: url_for(blog), method: :delete, data: { confirm: 'Are you sure?' })
        end
    end
end

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

    class CodeRayify < Redcarpet::Render::HTML
        def block_code(code, language)
            CodeRay.scan(code, language).div if language
        end
    end

    def markdown content
        coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)
        options = {
            fenced_code_blocks: true,
            no_intra_imphasis: true,
            autolink: true,
            lax_html_blocks: true
          }
        markdown = Redcarpet::Markdown.new(coderayified, options)
        markdown.render(content).html_safe
    end

    def get_correct_logo id
        return id if id < 10 && id >= 0
        return 0 if id < 0
        get_correct_logo id-10
        
    end

    def random_lego_logo user
        "https://randomuser.me/portraits/lego/#{get_correct_logo user.id}.jpg"
    end
end

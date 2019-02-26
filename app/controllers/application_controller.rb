class ApplicationController < ActionController::Base
    include DeviseWhitelist
    include SessionParameters
    include CurrentUserConcern
    include DefaultPageContent

    before_action :set_copyright
    def set_copyright
        @copyright = GresockViewTool::Renderer.copyright "Chris Gresock", "All rights reserved"
    end
end

module GresockViewTool
    class Renderer
        def self.copyright name, msg
            "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
        end
    end
end
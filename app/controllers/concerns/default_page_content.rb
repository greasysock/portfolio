module DefaultPageContent
    extend ActiveSupport::Concern

    included do
        before_action :set_page_title
    end

    def set_page_subtitle subtitle
        @page_title = "Chris Gresock | #{subtitle}"
    end

    def set_page_title
        @page_subtitle = "My Portfolio"
        @page_title = set_page_subtitle @page_subtitle
        @seo_keywords = "Chris Gresock Portfolio"
    end
end
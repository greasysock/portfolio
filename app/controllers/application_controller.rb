class ApplicationController < ActionController::Base
    include DeviseWhitelist
    include SessionParameters
    include CurrentUserConcern
    include DefaultPageContent
    
end

class ApplicationController < ActionController::Base
    include DeviseWhitelist
    include SessionParameters
    include CurrentUserConcern
end

class ApplicationController < ActionController::Base
    include DeviseWhitelist
    include SessionParameters
end

class TssApi < ActionWebService::API::Base
  api_method :parse, :expects => [{:name=>:string}], :returns => [:string]
end


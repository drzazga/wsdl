class HelloMessageApi < ActionWebService::API::Base
  api_method :hello_message, :expects => [{:name=>:string}], :returns => [:string]

end


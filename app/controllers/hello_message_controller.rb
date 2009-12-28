class HelloMessageController < ApplicationController
  web_service_api HelloMessageApi
  web_service_dispatching_mode :direct
  wsdl_service_name 'hello_message'
  web_service_scaffold :invoke

  def hello_message(name)
    return "Hello "+ name
  end
end

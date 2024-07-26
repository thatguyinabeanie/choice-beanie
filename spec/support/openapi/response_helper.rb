module OpenApi
  module Response
    def self.set_example_response_metadata
      lambda {
        after do |example|
          example.metadata[:response] = if response
                                          {
                                            code: response.code,
                                            body: response.body,
                                            headers: response.headers
                                          }
                                        else
                                          {
                                            code: 'no response',
                                            body: 'no response',
                                            headers: {}
                                          }
                                        end
        end
      }
    end
  end
end

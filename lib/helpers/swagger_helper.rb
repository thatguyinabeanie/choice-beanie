module SwaggerHelper
  def set_example_response_metadata(example, response)
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
end

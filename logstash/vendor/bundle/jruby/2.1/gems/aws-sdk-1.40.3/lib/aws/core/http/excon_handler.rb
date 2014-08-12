require 'excon'

class ExconHandler

  def handle(req, resp, &read_block)
    options = {
      :method => req.http_method.downcase.to_sym,
      :path => req.path,
      :query => req.querystring,
      :headers => req.headers,
      :body => req.body_stream,
    }
    options[:response_block] = read_block if block_given?
    connection = Excon.new(req.endpoint)
    excon_resp = connection.request(options)
    resp.status = excon_resp.status.to_i
    resp.headers = excon_resp.headers
    resp.body = excon_resp.body unless block_given?
  end

end

AWS.config(http_handler: ExconHandler.new)


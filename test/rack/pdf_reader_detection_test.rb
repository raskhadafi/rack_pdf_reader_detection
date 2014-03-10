require 'minitest/autorun'
require 'rack/test'
require 'pry'

require File.expand_path(File.dirname(__FILE__) + '/../../lib/rack_pdf_reader_detection')

class PdfReaderDetectionTest < MiniTest::Test
  include Rack::Test::Methods

  HTML_DOC = <<-EOF
  <html>
    <head>
      <title>Rack::PdfReaderDetection</title>
    </head>
    <body>
      <h1>Rack::PdfReaderDetection</h1>
    </body>
  </html>
  EOF

  def app
    hello_world_app = lambda do |env|
      [200, {'Content-Type' => 'text/html'}, HTML_DOC]
    end

    Rack::PdfReaderDetection.new(hello_world_app)
  end

  def test_add_content
    response = get '/'

    puts response.body
  end

end

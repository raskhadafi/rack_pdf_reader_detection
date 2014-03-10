require 'rack_pdf_reader_detection'

TestApp = Rack::Builder.new do
  use Rack::PdfReaderDetection

  HTML_DOC = <<-EOF
  <html>
    <head>
      <title>TestApp</title>
    </head>
    <body>
      <h1>TestApp</h1>
    </body>
  </html>
  EOF

  app = proc do |env|
    [200, { 'Content-Type' => 'text/html', 'Content-Length' => HTML_DOC.length.to_s }, [HTML_DOC]]
  end

  run app
end.to_app

run TestApp

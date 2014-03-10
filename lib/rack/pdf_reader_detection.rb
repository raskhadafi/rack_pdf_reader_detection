module Rack
  class PdfReaderDetection < Struct.new :app, :options

    require_relative 'pdf_reader_detection/java_script'

    ContentTypeDetection = /text\/html|application\/xhtml\+xml/

    def call(env)
      status, headers, response = app.call(env)

      if headers["Content-Type"] =~ ContentTypeDetection
        body = ''
        response.each { |part| body << part }

        body_begin_tag = body.rindex("<body>")
        body_end_tag   = body.rindex("</body>")

        if body_end_tag
          body.insert(body_end_tag, JavaScript)

          headers["Content-Length"] = body.length.to_s
          response                  = [body]
        end
      end

      [status, headers, response]
    end

  end
end

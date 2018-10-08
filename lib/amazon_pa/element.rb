module AmazonPa
  class Element
    def initialize(operation, response)
      @operation = operation
      @response =  response
    end

    def get_elements(path)
      REXML::XPath.match(@response, "#{base_path}#{path}").map do |element|
        AmazonPa::Element.new(@operation, element)
      end
    end

    def get_element(path)
      elements = get_elements(path)
      elements[0] if elements
    end

    def get(path)
      REXML::XPath.match(@response, "#{path}")[0]&.text
    end

    private

    def base_path
      "/#{@operation}Response/"
    end
  end
end

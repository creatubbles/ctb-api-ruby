require "creatubbles/base_object"

class Creatubbles::Upload < Creatubbles::BaseObject

  define_type_name 'uploads'
  define_attributes %w[
    url
    content_type
    ping_url
    completed_at
    aborted
    aborted_with
    processing_completed
    processing_details
    created_at
    updated_at
  ]

  alias :aborted? :aborted

  def upload(file)
    upload_url = URI.parse(url)
    Net::HTTP.start(upload_url.host) do |http|
      http.send_request("PUT", upload_url.request_uri, IO.read(file), "content-type" => content_type)
    end
  end

  def ping
    @connection.put(ping_url)
  end

  def processing?
    !processing_completed && !aborted
  end

end

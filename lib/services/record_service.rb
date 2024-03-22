# frozen_string_literal: true

class RecordService
  def initialize(api_url)
    @api_url = api_url
  end

  def save_record(name, score)
    uri = URI("#{@api_url}/records")
    header = {'Content-Type': 'application/json'}
    record = { name: name, score: score }.to_json

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme == 'https'
    request = Net::HTTP::Post.new(uri, header)
    request.body = record

    response = http.request(request)
    puts response.body
  rescue StandardError => e
    puts "Failed to save record. #{e.message}"
  end

  def fetch_records
    uri = URI("#{@api_url}/records")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme == 'https'
    response = http.get(uri)

    records = JSON.parse(response.body)
    records
  rescue StandardError => e
    puts "Failed to load records, try again: #{e.message}"
    []
  end
end
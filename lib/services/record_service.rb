# frozen_string_literal: true

require 'httparty'

class RecordService
  include HTTParty
  base_uri 'http://domain.com'

  def initialize(api_url)
    @options = { headers: { 'Content-Type' => 'application/json' } }
    self.class.base_uri(api_url)
  end

  def save_records(name, score)
    body = { name: name, score: score }.to_json
    options = @options.merge(body: body)
    response = self.class.post('/records', options)
    puts response.body
  rescue StandardError => e
    puts "Failed to save record: #{e.message}"
  end

  def fetch_records
    response = self.class.get('/records', @options)
    response.parsed_response
  rescue StandardError => e
    puts "Failed to load records, try again: #{e.message}"
    []
  end
end
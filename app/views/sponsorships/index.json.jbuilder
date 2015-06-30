json.array!(@sponsorships) do |sponsorship|
  json.extract! sponsorship, :id, :sport, :level, :description, :user_id
  json.url sponsorship_url(sponsorship, format: :json)
end

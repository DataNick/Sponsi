json.array!(@rewards) do |reward|
  json.extract! reward, :id, :number_of_goods, :good, :sponsorship_id_id
  json.url reward_url(reward, format: :json)
end

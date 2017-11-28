json.extract! client, :id, :name, :date, :sex, :weight, :age, :height, :biketype, :helmet, :lock, :reason, :ridden_before, :caseworker_id, :completed_at, :created_at, :updated_at
json.url client_url(client, format: :json)

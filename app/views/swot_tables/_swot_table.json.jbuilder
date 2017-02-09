json.extract! swot_table, :id, :title, :strength, :weakness, :opportunity, :threats, :created_at, :updated_at
json.url swot_table_url(swot_table, format: :json)
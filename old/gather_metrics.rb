require 'pry'
require 'json'

api_command = '
curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GH_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  --url https://api.github.com/orgs/pulibrary/dependabot/alerts?state=open\&per_page=100
  '

response = `#{api_command}`
open_alerts = JSON.parse(response)

# Are there more than 100 open alerts?
api_command_for_next = '
curl -L \
  --include
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GH_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  --url https://api.github.com/orgs/pulibrary/dependabot/alerts?state=open\&per_page=100
  '

pry.binding



puts "#################"
puts "Report for pulibrary, gathered on #{Time.now}"
puts "#################"
puts "Total open alerts: #{open_alerts.count}"

# #################
# Report for pulibrary, gathered on 2024-06-10 10:09:04 -0400
# #################
# Total alerts: 100
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
PublicTemplate.delete_all(conditions: {name: 'Business Planning Template'})

demo = PublicTemplate.new

demo.name = 'Business Planning Template'

['Objective Setting', 'Market Analysis', 'Competitor Analysis', 
'Customer Segmentation', 'Routes to Market', 'Product Portfolio',
'Sales Plan', 'Marketing Campaigns', 'Budget'].each do |name|
  elem = TemplateElement.new
  elem.name = name
  demo.child_template_elements << elem
end

['Objective Name 1', 'Objective Name 2'].each do |name|
  demo.child_template_elements[0].child_template_elements.build(:name => name)
end

['Market Forecast', 'Market Assessment', 'Market Positioning', 'Market Strategy'].each do |name|
  demo.child_template_elements[1].child_template_elements.build(:name => name)
end

['Competitor Assessment', 'Competitor Positioning'].each do |name|
  demo.child_template_elements[2].child_template_elements.build(:name => name)
end

['Segment Analysis', 'Segment Assessment', 'Segment Positioning', 'Segment Strategy'].each do |name|
  demo.child_template_elements[3].child_template_elements.build(:name => name)
end

['Route Structure', 'Route Capacity', 'Route Forecast'].each do |name|
  demo.child_template_elements[4].child_template_elements.build(:name => name)
end

['Product Features', 'Product Profitability', 'Product Assessment', 'Product Strategy'].each do |name|
  demo.child_template_elements[5].child_template_elements.build(:name => name)
end

['Sales Metric', 'Sales Forecast'].each do |name|
  demo.child_template_elements[6].child_template_elements.build(:name => name)
end

['Campaign Objectives', 'Campaign Metrics', 'Campaign Strategy', 'Campaign Execution'].each do |name|
  demo.child_template_elements[7].child_template_elements.build(:name => name)
end

['Budget Plan'].each do |name|
  demo.child_template_elements[8].child_template_elements.build(:name => name)
end


demo.save!




# set :environment, :development

every 1.day ,:at => '0:00' do
  runner  'Temperature.add_temps'
end

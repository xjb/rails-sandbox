require 'simplecov'

SimpleCov.start 'rails' do
  enable_coverage :branch

  # minimum_coverage 90
  # minimum_coverage_by_file 80

  # add_filter do |source_file|
  #   source_file.lines.count < 5
  # end

  add_filter 'app/channels'
  # add_filter 'app/jobs'
  # add_filter 'app/mailers'

  add_group 'Decorators', 'app/decorators'
  add_group 'Services', 'app/services'
  groups.delete('Channels')
  groups.delete('Mailers')
  groups.delete('Jobs')
  groups.delete('Libraries')
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

# Require all files from lib directory
Dir[File.join(__dir__, 'lib', '*.rb')].sort.each { |file| require file }

# rubocop
desc "Look for style guide offenses in your code"
task :rubocop do
  sh "rubocop --format simple || true"
end

# create irb with lib loaded
desc "Create an interactive console with all lib files loaded"
task :console do
  files = Dir[File.join(__dir__, 'lib', '*.rb')].sort
  require_command = files.map { |file| '-r ' + file }.join(" ")
  sh "irb -f #{require_command}"
end

# Set Day
day = 5

(1..day).each do |d|
  task "day_0#{d}".to_sym do
    input = File.join(__dir__, "inputs", "day-0#{d}-input.txt")
    puts "Part 1:"
    puts "---------"
    puts eval "day_0#{d}(input, part = 1)"
    puts "---------"
    puts "Part 2:"
    puts "---------"
    puts eval "day_0#{d}(input, part = 2)"
    puts "---------"
  end
end
task default: %w[spec]
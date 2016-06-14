Dir.glob("app/**/*.rb").sort.each do |file|
  require File.expand_path(file)
end

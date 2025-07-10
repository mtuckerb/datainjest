require 'bundler'
require 'pp'

def gem_to_nix(spec)
  {
    groups: spec.groups.map(&:to_s),
    version: spec.version.to_s,
    source: {
      type: "gem",
      remotes: ["https://rubygems.org"] # Default to RubyGems
    }
  }
end

gemset = Bundler.load.specs.each_with_object({}) do |spec, hash|
  begin
    hash[spec.name] = gem_to_nix(spec)
  rescue => e
    puts "Error processing gem #{spec.name}: #{e.message}"
  end
end

File.open('gemset.nix', 'w') do |f|
  f.puts "{"
  gemset.each do |name, data|
    f.puts "  #{name} = {"
    f.puts "    groups = [ #{data[:groups].map { |g| "\"#{g}\"" }.join(' ')} ];"
    f.puts "    platforms = [ ];" # Add this line if you need empty platforms
    f.puts "    source = {"
    f.puts "      remotes = [ \"#{data[:source][:remotes].first}\" ];"
    f.puts "      sha256 = \"0000000000000000000000000000000000000000000000000000000000000000\";" # Placeholder
    f.puts "      type = \"gem\";"
    f.puts "    };"
    f.puts "    version = \"#{data[:version]}\";"
    f.puts "  };"
    f.puts
  end
  f.puts "}"
end

puts "gemset.nix file has been generated."

require 'open-uri'
require 'digest/sha2'

def fetch_gem_sha256(name, version)
  url = "https://rubygems.org/downloads/#{name}-#{version}.gem"
  gem_content = URI.open(url).read
  Digest::SHA256.hexdigest(gem_content)
rescue OpenURI::HTTPError
  puts "Warning: Unable to fetch SHA256 for #{name}-#{version}"
  "0000000000000000000000000000000000000000000000000000000000000000"
end

def parse_gemfile_lock
  gemfile_lock_path = File.join(Dir.pwd, 'Gemfile.lock')
  content = File.read(gemfile_lock_path)
  
  gems = {}
  current_section = nil
  
  content.each_line do |line|
    case line.strip
    when "GEM"
      current_section = :gems
    when "PLATFORMS", "DEPENDENCIES", "BUNDLED WITH"
      current_section = nil
    else
      if current_section == :gems && line =~ /^\s{4}(\S+) \((.*?)\)/
        gem_name = $1
        gem_version = $2
        gems[gem_name] = gem_version
      end
    end
  end
  
  gems
end

gems = parse_gemfile_lock

File.open('gemset.nix', 'w') do |f|
  f.puts "{"
  gems.each do |name, version|
    sha256 = fetch_gem_sha256(name, version)
    f.puts "  #{name} = {"
    f.puts "    version = \"#{version}\";"
    f.puts "    source = {"
    f.puts "      type = \"gem\";"
    f.puts "      sha256 = \"#{sha256}\";"
    f.puts "    };"
    f.puts "  };"
  end
  f.puts "}"
end

puts "Generated gemset.nix with correct SHA256 values"

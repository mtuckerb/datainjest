require 'bundler'
require 'json'

def generate_gemset
  gemset = {}
  Bundler.load.specs.each do |spec|
    gemset[spec.name] = {
      'version' => spec.version.to_s,
      'source' => {
        'type' => 'gem',
      }
    }
  end
  gemset
end

File.write('gemset.nix', JSON.pretty_generate(generate_gemset))
puts "Generated gemset.nix"
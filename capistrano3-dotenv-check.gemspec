Gem::Specification.new do |spec|
  spec.name = "capistrano3-dotenv-check"
  spec.version = "0.0.2"
  spec.authors = ["NamNV609"]
  spec.email = ["namnv609@gmail.com"]
  spec.description = "Capistrano3 check .env variables"
  spec.summary = "Capistrano3 check .env variables"
  spec.license = "MIT"
  spec.homepage = "https://github.com/namnv609/capistrano3-dotenv-check"
  spec.files = `git ls-files`.split($/)
  spec.require_paths = ["lib"]
  spec.add_dependency "terminal-table", "~> 1.8"
  spec.add_dependency "dotenv-rails", "~> 2.1"
  spec.add_dependency "dotenv", "~> 2.1"
end

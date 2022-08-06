require_relative "./lib/grey_parrot"

Gem::Specification.new do |s|
  s.name     = "grey_parrot"
  s.summary  = "GreyParrot"
  s.version  = GreyParrot::VERSION
  s.authors  = ["Steve Weiss"]
  s.email    = ["weissst@mail.gvsu.edu"]
  s.homepage = "https://github.com/sirscriptalot/grey_parrot"
  s.license  = "MIT"
  s.files    = `git ls-files`.split("\n")

  s.add_development_dependency "rspec", "~> 3.11"
end

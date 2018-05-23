# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "knitting_yarn_deals/version"

Gem::Specification.new do |spec|
  spec.name             = "knitting_yarn_deals"
  spec.version          = KnittingYarnDeals::VERSION
  spec.author           = ["Christina Chronister"]
  spec.email            = ["cchronister743@gmail.com"]
  spec.platform         = Gem::Platform::RUBY
  spec.rubygems_version = "2.4.8 ans 2.6.13"

  spec.summary          = %q{Gem that uses scraping in nokogiri a website to help knitters to find yarn deals.}
  spec.description      = %q{As a knitter I am always looking for yarn deals even though I have a basement full of yarn. I want to help other knitters.}
  spec.homepage         = "https://github.com/Christy743/knitting-yarn-deals-cli-app"
  spec.license          = "MIT"
  spec.version          = "0.2.2"

  spec.files            = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.executables       = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths    = ["lib"]
  spec.post_install_message = "Thanks for installing!"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.4"
  spec.add_development_dependency "rspec", "~> 3.6"
  spec.add_development_dependency "pry", "~> 0.10.4"

  spec.add_dependency "nokogiri"
end

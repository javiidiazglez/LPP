# frozen_string_literal: true

require_relative "lib/granja/version"

Gem::Specification.new do |spec|
  spec.name = "granja"
  spec.version = Granja::VERSION
  spec.authors = ["José Javier Díaz González"]
  spec.email = ["alu0101128894@ull.edu.es"]

  spec.summary = "#10. Programación Funcional"
  spec.description = "Se va a utilizar la metodología de desarrollo dirigido por pruebas (TDD), La herramienta RSpec, La Herramienta de gestión de dependencias Bundler, La Herramienta de comprobación continua Guard y La Herramientas de generación de documentación rdoc"
  spec.homepage = "https://github.com/ULL-ESIT-LPP-2122/granja-alu0101128894.git"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html

  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "guard-bundler"

end

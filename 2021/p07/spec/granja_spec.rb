# frozen_string_literal: true

RSpec.describe Granja do
  
  it "Tiene un número de version, usando la sintaxis semántica X.Y.Z" do
    expect(Granja::VERSION).not_to be nil
  end

end
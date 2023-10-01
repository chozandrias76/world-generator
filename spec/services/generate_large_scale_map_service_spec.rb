require 'spec_helper'
require 'rails_helper'

describe GenerateLargeScaleMapService do
  it 'can be initialized with width and height' do
    expect(
      described_class.new(width: 1, height: 1, dimensions: 2, seed: 1234)
    ).to be_a(described_class)
  end

  describe '#generate_map' do
    subject do
      described_class.new(
        **args
      ).generate_map
    end

    let(:args) do
      {
        width: 1, height: 1, dimensions: 2, seed: 1234
      }
    end

    it 'returns an instance of Perlin Noise' do
      expect(subject).to be_a(Perlin::Noise)
    end
  end
end

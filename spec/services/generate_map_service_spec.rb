require 'spec_helper'
require 'rails_helper'

describe GenerateMapService, type: :class do
  subject(:generate_map_service) do
    described_class.new(
      width: described_class::MAP_WIDTH,
      height: described_class::MAP_HEIGHT,
      perlin_scale: described_class::PERLIN_SCALE,
      water_level: described_class::WATER_LEVEL
    )
  end

  describe '#generate_terrain' do
    it 'returns a valid terrain map' do
      terrain_map = generate_map_service.send(:generate_terrain)
      expect(terrain_map).to be_an(Array)
      expect(terrain_map.length).to eq(described_class::MAP_WIDTH)
      expect(terrain_map[0].length).to eq(described_class::MAP_HEIGHT)

      # You can add more specific expectations based on your knowledge
      # of how the terrain should look.
      # For example, check that values are within a certain range.
      terrain_map.each do |row|
        row.each do |elevation|
          expect(elevation).to be_between(0.0, 1.0).inclusive
        end
      end
    end
  end
end

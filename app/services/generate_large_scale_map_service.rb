
class GenerateLargeScaleMapService
  def initialize(height:, width:, dimensions: , seed: )
    @height = height
    @width = width
    @dimensions = dimensions
    @seed = seed
  end

  def generate_map
    noise_generator = Perlin::Noise.new(@dimensions, seed: @seed)
  end
end
require 'rmagick'
require 'perlin_noise'

class GenerateMapService
  MAP_WIDTH = 800
  MAP_HEIGHT = 600
  PERLIN_SCALE = 30.0
  WATER_LEVEL = 0.4

  def initialize(width:, height:, perlin_scale:, water_level:)
    @width = width || MAP_WIDTH
    @height = height || MAP_HEIGHT
    @perlin_scale = perlin_scale || PERLIN_SCALE
    @water_level = water_level || WATER_LEVEL
  end

  def generate
    # Visualize the generated map
    map = generate_terrain
    visualize_map(map, generate_biomes(map))
  end

  private

  # Generate a terrain map using Perlin Noise
  def generate_terrain
    noise_generator = Perlin::Noise.new(2)
    terrain_map = Array.new(@width) { Array.new(@height) }

    (0..@width - 1).each do |x|
      (0..@height - 1).each do |y|
        nx = x.to_f / @width - 0.5
        ny = y.to_f / @height - 0.5
        elevation = (noise_generator[(nx * @perlin_scale).abs, (ny * @perlin_scale).abs] + 1.0) / 2.0
        terrain_map[x][y] = elevation
      end
    end

    terrain_map
  end

  # Generate a basic biome map based on terrain
  def generate_biomes(terrain_map)
    biome_map = Array.new(terrain_map.length) { Array.new(terrain_map[0].length) }

    (0..terrain_map.length - 1).each do |x|
      (0..terrain_map[0].length - 1).each do |y|
        elevation = terrain_map[x][y]

        biome_map[x][y] = if elevation < WATER_LEVEL
                            :water
                          elsif elevation < WATER_LEVEL + 0.2
                            :beach
                          else
                            :land
                          end
      end
    end

    biome_map
  end

  # Visualization of the terrain and biomes using RMagick
  def visualize_map(terrain_map, biome_map)
    width = terrain_map.length
    height = terrain_map[0].length

    img = Magick::Image.new(width, height)

    (0..width - 1).each do |x|
      (0..height - 1).each do |y|
        color = case biome_map[x][y]
                when :water then 'blue'
                when :beach then 'yellow'
                when :land then 'green'
                else 'white'
                end

        img.pixel_color(x, y, color)
      end
    end
    img.format = 'png'

    img.write('map.png')
  end

  # Define map dimensions and generation parameters
end

class Image
  def initialize(array)
    @image = array
  end

  def output_image
    @image.each do |x|
      puts x.join
    end
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image
class Storage
  def initialize
    @transportations = []
    @id_counter = 1
  end

  def add(transportation)
    transportation.id = @id_counter
    @id_counter += 1
    @transportations << transportation
    transportation
  end

  def all
    @transportations
  end
end

STORAGE = Storage.new

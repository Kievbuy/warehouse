require 'pry'
class Product::DestinationAssignment
  include Callable

  def initialize(product, default_destination)
    @product = product
    @default_destination = default_destination
    @destinations = Hash.new(0)
  end

  def call
    destination_prioritisation
    set_destination
  end

  private
  
  def destination_prioritisation
    Destination.all.each do |destination|
      @destinations[destination.id] += 1 if suitable_reference(destination)
      @destinations[destination.id] += 1 if suitable_category(destination)
      @destinations[destination.id] += 1 if suitable_price(destination)
    end
  end

  def set_destination
    destination_id = @destinations.sort_by { |k, v| v }.last.try(:[], 0)
    destination_id ? Destination.find(destination_id) : @default_destination
  end

  def suitable_reference(destination)
    return false unless destination.references.any?

    destination.reference_ids.include? @product.reference_id
  end

  def suitable_category(destination)
    return false unless destination.categories.any?

    destination.category_ids.include? @product.category_id
  end

  def suitable_price(destination)
    return false unless destination.max_price

    destination.max_price > @product.price.to_i
  end
end

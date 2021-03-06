class City < ActiveRecord::Base
  include SharedInstanceMethods
  extend SharedClassMethods

  has_many :neighborhoods
  has_many :listings, :through => :neighborhoods
  #before_save :find_ratio_res_to_listings


  def city_openings(check_in, check_out)
    self.listings.map do |listing|
      listing
    end
  end



  def city_or_neighborhood_reservations
    if self.class == City
      number = self.neighborhoods.map do |n|
        n.listings.map do |l|
          l.reservations.count
        end
      end.flatten.sum
    else
      number = self.listings.map do |l|
        l.reservations.count
      end.flatten.sum
    end
    number
  end

end


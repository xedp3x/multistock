class Device < ActiveRecord::Base 
  attr_accessible :place_id
  
  belongs_to  :place
  
  has_many    :comment
  
  def self.valid_ean?(ean)
    ean = ean.to_s
    ean.length == 8 && ean == complete_ean(ean[0,7])
  end
  
  def self.complete_ean(seven)
    seven = seven.to_s
    return nil unless seven.length == 7 && seven.match(/\d{7}/)

    arr = (0..6).to_a.collect do |i|
      if (i+1) % 2 == 0
        seven[i,1].to_i
      else
        seven[i,1].to_i * 3
      end
    end
    sum = arr.inject { |sum, n| sum + n }
    remainder = sum % 10
    if remainder == 0
      check = 0
    else
      check = 10 - remainder
    end

    seven + check.to_s
  end
  
  def self.find_by_ean(ean)
    ean = ean.to_s
    return nil if not valid_ean?(ean)
    return self.find_by_id(ean[0,7])
  end
  
  def ean
    Device.complete_ean id
  end
  
end

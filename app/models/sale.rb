class Sale < ActiveRecord::Base
  def finished?
    ends_on < Date.current
  end

  def upcoming?
    starts_on > Date.current
  end

  def active?
    !upcoming? && !finished?
  end

  #AR Scope
  def self.active
    where("sales.starts_on <= ? AND sales.ends_on >=  ?", 
    Date.current, Date.current).any?
  end

end

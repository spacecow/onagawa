class OperatorController < ApplicationController
  def info
    @infosections = InfoSection.order("pos asc")
  end
  def info2
  end
  def info3
  end
  def info4
  end



  def contact
  end
end

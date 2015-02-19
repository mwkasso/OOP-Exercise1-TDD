class FamilyMember < Person
  attr_accessor :relationship
  # *args splat parse as many args as you want
  def initialize(relationship = "relative" ,*args)
    @relationship = relationship
    super
  end
end
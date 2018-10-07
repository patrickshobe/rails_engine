class RevnueDateSerializer < ActiveModel::Serializer
  attributes :total_revenue

  def total_revenue
    binding.pry
  end
end

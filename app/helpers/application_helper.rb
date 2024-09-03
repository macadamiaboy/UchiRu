module ApplicationHelper
  def token_mask(prefix, length = 30)
    "#{prefix}#{"*"*length}"
  end
end

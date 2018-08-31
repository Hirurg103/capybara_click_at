require "capybara_click_at/version"

module CapybaraClickAt
  def click_at(x, y, options = {})
    container = if options[:css]
     find(:css, options[:css])
    elsif options[:xpath]
      find(:xpath, options[:xpath])
    else
      find('html')
    end

    container.click(:x => x, :y => y)
  end
end

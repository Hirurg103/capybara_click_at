require "capybara_click_at/version"

module CapybaraClickAt
  def click_at(x, y, options = {})
    capybara_version = Gem.loaded_specs["capybara"].version

    if capybara_version < Gem::Version.new("3.0.0")
      page.execute_script "
        (function click(x, y, options) {
          var findElement = (function() {
            if(options.css) {
              return document.querySelector(options.css);
            } else if(options.xPath) {
              return document.evaluate(
                options.xPath, document, null,
                XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
            } else {
              return document.querySelector('html');;
            }
          }),
          element = findElement(),
          rect = element.getBoundingClientRect(),
          event = document.createEvent('MouseEvent');

          event.initMouseEvent(
            'click',
            true /* bubble */, true /* cancelable */,
            window, element,
            0, 0, rect.left + x, rect.top + y, /* coordinates */
            false, false, false, false, /* modifier keys */
            0 /*left*/, null
          );

          element.dispatchEvent(event);
        })(#{ x }, #{ y }, { css: '#{options[:css]}', xPath: '#{options[:xpath]}' });"
    else
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
end

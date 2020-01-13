# module WaitForAjax
#   def wait_for_ajax(wait_time = Capybara.default_max_wait_time)
#     Timeout.timeout(wait_time) do
#       loop until finished_all_ajax_requests?
#     end
#     yield if block_given?
#   end
#
#   def finished_all_ajax_requests?
#     page.evaluate_script('jQuery.active').zero?
#   end
# end
#
# RSpec.configure do |config|
#   config.include WaitForAjax, type: :system
# end


# module WaitUntilElementExists
#   def wait_until_element_exists(selector)
#     Timeout.timeout(Capybara.default_max_wait_time) do
#       loop until page.all(selector).present?
#     end
#   end
# end
#
# RSpec.configure do |config|
#   config.include WaitUntilElementExists, type: :feature
# end


# module AjaxHelper
#
#   def wait_for_css(selector)
#     until has_css?(selector); end
#     yield(find(selector))
#   end
#
# end
# def wait_for_ajax
#   Timeout.timeout(2) do
#     active = page.evaluate_script('jQuery.active')
#     until active == 0
#       active = page.evaluate_script('jQuery.active')
#     end
#   end
# end
# end

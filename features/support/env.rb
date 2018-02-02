require_relative '../../lib/browser'
require 'pry'

@browser = BrowserWindow.new

at_exit do
  @browser.close
end

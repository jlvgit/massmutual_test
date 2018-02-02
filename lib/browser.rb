require 'watir'

class BrowserWindow
  def initialize
    @browser = Watir::Browser.new :firefox
  end

  def goto(url)
    @browser.goto(url)
    Watir::Wait.until {@browser.url == url}
  end

  def close
    @browser.close if @browser
  end

end

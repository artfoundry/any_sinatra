libdir = File.dirname("app/config")
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)
require 'config'

describe 'welcome page' do
  it "should print a welcome statement" do
  end
  it "should ask if the user wants instructions" do
  end
  it "should ask the user's name" do
  end
  it "should ask the user for difficulty level choice" do
  end
  
end
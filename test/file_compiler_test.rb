require 'test_helper'

class FileCompilerTest < MiniTest::Unit::TestCase
  def setup
    @source = Malachite::FileCompiler.new(Rails.root.join('app', 'go', 'upcase.go')).compile
  end

  def test_confirm_compilation_matches_fixture
    compiled = File.read(Rails.root.join('tmp', 'upcase.go')).to_s
    valid = File.read(File.expand_path('../fixtures/valid_upcase.go', __FILE__)).gsub(/HEADER/, RbConfig::CONFIG['rubyhdrdir']).gsub(/ARCH/, RbConfig::CONFIG['rubyarchhdrdir'])
    assert_equal compiled, valid
  end
end

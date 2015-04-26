require 'test_helper'

class WineTest < ActiveSupport::TestCase
  def setup
    @wine = Wine.new
  end

  test 'name remember its value' do
    @wine.name = 'Franzia'
    assert_equal = 'Franzia', @wine.name
  end

  test 'year remembers its value' do
    @wine.year = 2015
    assert_equal = 2015, @wine.year
  end

  test 'winery remembers its value' do
    @wine.winery = 'Franzia Winery'
    assert_equal 'Franzia Winery', @wine.winery
  end

  test 'country remembers its value' do
    @wine.country = 'United States'
    assert_equal 'United States', @wine.country
  end

  test 'varietal remembers its value' do
    @wine.varietal = 'Merlot'
    assert_equal = 'Merlot', @wine.varietal
  end

  test 'persistence works properly' do
    created_wine = Wine.create(name: 'Sutter Home', year:2013, winery: 'Sutter Home Winery', country: 'United States', varietal: 'Merlot')
    found_wine = Wine.find created_wine.id
    assert_not_nil found_wine
    assert_equal 'Sutter Home', found_wine.name
    assert_equal 2013, found_wine.year
    assert_equal 'Sutter Home Winery', found_wine.winery
    assert_equal 'United States', found_wine.country
    assert_equal 'Merlot', found_wine.varietal
  end

  test "update from a fixture" do
    wine = wine(:franzia)
    delta = 0.001
    assert_in_delta 2015, wine.year, delta
    wine.price = 2014
    wine.save
    updated = Wine.find(wine.id)
    assert_in_delta 2014, updated.year, delta
  end
end

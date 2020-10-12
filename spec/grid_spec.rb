require "spec_helper"
require_relative "../lib/grid"

describe Grid do
  it "should return an array of the top most coordinates" do
    grid = Grid.new(5,5)

    expect(grid.get_top_right_x).to eq(5)
    expect(grid.get_top_right_y).to eq(5)
  end

  it "should raise an error when invalid parameters are passed" do
    expect { Grid.new(10,"X") }.to raise_error(ArgumentError)
  end
end



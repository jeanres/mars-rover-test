require "spec_helper"
require_relative "../lib/rover"
require_relative "../lib/grid"

describe Rover do
  before do
    @grid = Grid.new(5,5)
  end

  describe "Initialize" do
    it "should raise an error with invalid x coordinate" do
      expect{ Rover.new(@grid, "test", 10, "N") }.to raise_error(ArgumentError)
    end

    it "should raise an error with invalid ycoordinate" do
      expect{ Rover.new(@grid, 10, "TEST", "N") }.to raise_error(ArgumentError)
    end

    it "should raise an error with invalid x direction" do
      expect{ Rover.new(@grid, 10, "TEST", "B") }.to raise_error(ArgumentError)
    end
  end

  describe "Instructions" do
    it "should raise an error with invalid instructions" do
      rover = Rover.new(@grid, 3,3, "E")
      expect{ rover.instruct('RCSFWRSDSQWEW') }.to raise_error(ArgumentError)
    end

    it "returns the correct position based on the input parameters (right)" do
      rover = Rover.new(@grid, 3,3, "E")
      rover.instruct("MMRMMRMRRM")
      expect(rover.print_location).to eq('5 1 E')
    end

    it "returns the correct position based on the input parameters (left)" do
      rover = Rover.new(@grid, 1, 2, "N")
      rover.instruct('LMLMLMLMM')
      expect(rover.print_location).to eq('1 3 N')
    end

    it "shoulkd return the previous x coordinate when going out of the grid" do
      rover = Rover.new(@grid, 5, 5, "N")
      rover.instruct("RM")
      expect(rover.print_location).to eq("5 5 E")
    end

    it "shoulkd return the previous y coordinate when going out of the grid" do
      rover = Rover.new(@grid, 5, 5, "N")
      rover.instruct("M")
      expect(rover.print_location).to eq("5 5 N")
    end
  end

  describe "Movement" do
    it "should return the correct direction with rotating right" do
      rover = Rover.new(@grid, 3,3, "N")
      expect(rover.rotate_right()).to eq("E")
      expect(rover.rotate_right()).to eq("S")
      expect(rover.rotate_right()).to eq("W")
    end

    it "should return the correct direction with rotating left" do
      rover = Rover.new(@grid, 3,3, "N")
      expect(rover.rotate_left()).to eq("W")
      expect(rover.rotate_left()).to eq("S")
      expect(rover.rotate_left()).to eq("E")
    end

    it "should return the correct coordinates when moving on the y axis" do
      rover = Rover.new(@grid, 3,3, "N")
      rover.move()
      expect(rover.print_location).to eq("3 4 N")
    end

    it "should return the correct coordinates when moving on the x axis" do
      rover = Rover.new(@grid, 3,3, "E")
      rover.move()
      expect(rover.print_location).to eq("4 3 E")
    end
  end
end

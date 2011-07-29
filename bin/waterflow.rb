#!/usr/bin/env ruby
require "rubygems"
require "thor/group"
require File.join(File.dirname(__FILE__), '..', 'lib', 'water_flow')

class WaterFlowParser < Thor::Group
  include Thor::Actions
  
  desc "Visualization and measuring of water flow"     
  
  argument :input_file, :type => :string          
  
  class_option :slow, :type => :boolean, :default => false, :desc => 'Display de water as it flows in slow motion. Cool for small images.'
  
  def one                           
    say '# Reading the file'      
    @input_string = ''
    File.open(input_file, "r") do |infile|
      @water = infile.gets.strip  
      infile.gets # blank line      
      while (line = infile.gets)
        if line.length > 1   
          @input_string << line
        end
      end                                      
    end                         
  end                      
  
  def two
    say '# Parsing'  
    
    water_flow = WaterFlow.new(:water => @water.to_i, :cave => @input_string) 
    
    if options[:slow] then ENV['slow_motion'] = 'yes' end
    cave = water_flow.simulate_flow                                             
    puts 'Measures are: ' + water_flow.measures
                   
    File.open(input_file + '_out.txt', "w") do |file|
      file.printf(water_flow.measures)
    end    
  end          
end

WaterFlowParser.start
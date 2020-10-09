require_relative './project.rb'
require_relative './backer.rb'
require 'pry'


class ProjectBacker
    attr_reader :project, :backer
    @@all = []

    def initialize (project, backer)
        @project = project
        @backer = backer
        self.class.all << self
    end

    def self.all
        @@all
    end
end
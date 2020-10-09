require_relative './project.rb'
require_relative './project_backer.rb'
require 'pry'


class Backer
    attr_reader :name
    @@all = []

    def initialize (name)
        @name = name
        self.class.all << self
    end

    def back_project(project)
        ProjectBacker.new(project, self)
    end

    def backed_projects
        projects = []
        ProjectBacker.all.select do |project_backed|
            if project_backed.backer == self
                projects << project_backed.project
            end
        end
        return projects
    end

    def self.all
        @@all
    end
end
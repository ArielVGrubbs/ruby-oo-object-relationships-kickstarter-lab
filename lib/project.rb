require_relative './backer.rb'
require_relative './project_backer.rb'
require 'pry'


class Project
    attr_reader :title
    @@all = []

    def initialize (title)
        @title = title
        self.class.all << self
    end

    def add_backer (backer)
        ProjectBacker.new(self, backer)
    end

    def backers
        backers = []
        ProjectBacker.all.select do |project_backer_instance|
            if project_backer_instance.project == self
                backers << project_backer_instance.backer
            end
        end
        return backers
    end

    def self.all
        @@all
    end
end
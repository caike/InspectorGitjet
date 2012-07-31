require 'grit'

module InspectorGitjet
  module Importable
    def self.read_history(project_path)
      project = Project.create(project_path)
    end

    class Project

      INDEX_FILE = '.inspector_gitjet_index'

      def self.create(project_path)
        project = new(project_path)
        project.load_from_path
      end

      attr_reader :project_path

      def initialize(project_path)
        @project_path = project_path
      end

      def load_from_path
        grit_repo = Grit::Repo.new(project_path)
        grit_commits = grit_repo.log

        commits = grit_commits.collect { |grit_commit|
          commit_files = grit_commit.show.collect { |file| file.a_path }
          {sha: grit_commit.sha, committed_at: grit_commit.committed_date, commit_files: [commit_files]}
        }

        # for the time being, we are always re-writing the whole index file
        File.open(INDEX_FILE,'w') do |index|
          Marshal.dump(commits, index)
        end

        # just listing to make sure it works.
        # this should be removed in the future
        File.open(INDEX_FILE, 'r') do |index|
          commits = Marshal.load(index)
        end
        commits.each do |c|
          p [c[:committed_at], c[:commit_files]].join(" - ")
        end

      end
    end
  end
end

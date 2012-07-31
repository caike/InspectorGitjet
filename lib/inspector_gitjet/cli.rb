module InspectorGitjet
  module CLI
    def self.run
      project_path = '.'
      Importable.read_history(project_path)
    end
  end
end

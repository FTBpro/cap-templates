Capistrano::Configuration.instance(:must_exist).load do

  def get_binding
    binding 
  end

  def from_template(file)
    require 'erb'
    template = File.read(file)
    ERB.new(template).result(self.get_binding)
  end

  def resolve_template(file)
    template_file_name = File.join(Dir.pwd, "config", file) 
    resolved_content = from_template(template_file_name)
    put resolved_content, File.join(release_path, "config", file).gsub(/\.erb$/, "")
  end


  namespace :deploy do
    desc "Resolves ERB configuration templates"
    task :resolve_configuration_erbs, roles: :app do
      erb_templates.each { |t| resolve_template t }
    end
  end

  after "deploy:update_code", "deploy:resolve_configuration_erbs"
end



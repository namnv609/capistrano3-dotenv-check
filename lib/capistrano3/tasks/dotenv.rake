namespace :dotenv do
  require "dotenv/parser"
  require "terminal-table"

  desc "Check .env variables"
  task :check do
    on roles(:app) do |host|
      info "Checking .env variables"

      dotenv_file_path = fetch :dotenv_file_path, "#{shared_path}/.env"
      dotenv_content = capture "cat #{dotenv_file_path}"
      dotenv_vars = Dotenv::Parser.call dotenv_content
      table_rows = []
      table_headings = %w(Key Value Expect Status)
      dotenv_checklist = fetch :dotenv_checklist, {}
      check_status = true

      dotenv_checklist.each do |key, value|
        key = key.to_s
        status_text = (dotenv_vars[key] == value ? "✔" : "✘")
        check_status = false unless status_text == "✔"
        table_rows << [key, dotenv_vars[key], value, status_text]
      end

      table = Terminal::Table.new title: host, headings: table_headings,
        rows: table_rows
      puts "#{table.to_s}\n"

      unless check_status
        abort "- #{host}: Some variables is invalid. Please check!\n"
      end
    end
  end
end

after "deploy:started", "dotenv:check"

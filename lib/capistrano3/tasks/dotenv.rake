namespace :dotenv do
  require "dotenv/parser"
  require "terminal-table"

  desc "Check .env variables"
  task :check do
    on roles(:all) do
      dotenv_file_path = fetch :dotenv_file_path, "#{shared_path}/.env"
      dotenv_content = capture "cat #{dotenv_file_path}"
      dotenv_vars = Dotenv::Parser.call dotenv_content
      table_rows = []

      dotenv_vars.each do |key, value|
        table_rows << [key, value]
      end

      table = Terminal::Table.new headings: %w(Key Value), rows: table_rows

      puts table.to_s
    end
  end
end

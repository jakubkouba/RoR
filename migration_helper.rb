module MigrationHelper

  @@default = 'cascade'

  def create_fk(from_table, from_column, to_table, constraint_name, on = {delete: @@default, update: @@default})
    execute  <<-SQL
              ALTER TABLE #{from_table}
              ADD CONSTRAINT #{constraint_name}
              FOREIGN KEY (#{from_column})
              REFERENCES #{to_table}(id)
              ON DELETE #{on[:delete].upcase}
              ON UPDATE #{on[:update].upcase}
            SQL

  end

  def drop_fk(from_table, constraint_name)
    execute <<-SQL
              ALTER TABLE #{from_table}
              DROP FOREIGN KEY #{constraint_name})
            SQL
  end

end
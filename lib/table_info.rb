module TableInfo
  extend self
  
  def schema_for(table_name)

    metadata = {table_name: table_name}
    
    ActiveRecord::Base.connection.transaction do
      metadata[:fields] = ActiveRecord::Base.connection.execute("SELECT * FROM #{table_name} WHERE false").fields
      raise ActiveRecord::Rollback
    end
    
    metadata
  end
end

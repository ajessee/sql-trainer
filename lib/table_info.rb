module TableInfo
  extend self

  if Rails.env.production?
    if defined?(ActiveRecord::Base)
      ActiveRecord::Base.establish_connection
      DB = ActiveRecord::Base.connection
    end
  else
    DB = ActiveRecord::Base.connection
  end 
  

  def schema_for(table_name)

    if Rails.env.production?
      DB.reconnect!
    end
    
    metadata = {table_name: table_name}
    
    DB.transaction do
      metadata[:fields] = DB.execute("SELECT * FROM #{table_name} WHERE false").fields
      raise ActiveRecord::Rollback
    end

    if Rails.env.production?
      ActiveRecord::Base.connection.disconnect!
    end
    
    metadata
  end
end

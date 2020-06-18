module TableInfo
  extend self

  if Rails.env.development?
    DB = ActiveRecord::Base.connection
  end
  
  def schema_for(table_name)
    
    metadata = {table_name: table_name}
    
    # for prod on heroku, call ActiveRecord::Base.connection directly or you get an error
    if Rails.env.production?
      ActiveRecord::Base.connection.transaction do
        metadata[:fields] = ActiveRecord::Base.connection.execute("SELECT * FROM #{table_name} WHERE false").fields
        raise ActiveRecord::Rollback
      end
    else
      DB.transaction do
        metadata[:fields] = DB.execute("SELECT * FROM #{table_name} WHERE false").fields
        raise ActiveRecord::Rollback
      end
    end
    
    metadata
  end
end

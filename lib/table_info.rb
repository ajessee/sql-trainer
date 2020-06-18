module TableInfo
  extend self

  DB = ActiveRecord::Base.connection
  
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

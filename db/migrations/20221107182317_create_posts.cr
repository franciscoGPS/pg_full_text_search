class CreatePosts::V20221107182317 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Post) do
      primary_key id : Int64
      add_timestamps
      add author : String
      add title : String
      add description : String
    end
  end

  def rollback
    drop table_for(Post)
  end
end

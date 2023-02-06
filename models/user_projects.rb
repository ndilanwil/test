require "sqlite3"
require_relative 'database.rb'

$table='user_projects'

class UserProjects
    attr_accessor :project, :user, :admin, :creator, :creator_name

    def initialize(array)
        @project           = array[0]
        @user = array[1]
        @admin  = array[2]
        @creator= array[3]
        @creator_name = array[4]
    end
    
    def inspect
        %Q| <Project project: "#{@project}", user: "#{@user}", admin: "#{@admin}", creator: "#{@creator}", creator_name: "#{@creator_name}">|
    end

    def to_hash
        {project: @project, user: @user, admin: @admin, creator: @creator, creator_name: @creator_name}
    end

    def self.all
        query = <<-REQUEST
            SELECT * FROM #{$table};
        REQUEST
        p rows = Connection.new.execute(query)
        if rows.any?
            rows.collect do |row|
                UserProjects.new(row)
            end
        end 
    end  

    def self.creator(project,id,creator)
        q = <<-REQUEST
            SELECT id FROM project WHERE project_name = "#{project}";
        REQUEST
        p r=Connection.new.execute(q)
        query = <<-REQUEST
            INSERT INTO user_projects (project, user, isadmin, creator, creator_name) VALUES ("#{r[0][0]}","#{id}","1","1","#{creator}");
        REQUEST
        Connection.new.execute(query)
    end
    
    def self.addmember(project,email,creator)
        q=<<-REQUEST
            SELECT id FROM user WHERE email="#{email}";
        REQUEST
        r=Connection.new.execute(q)
        query=<<-REQUEST
            INSERT INTO #{$table} (project, user, isadmin, creator, creator_name) VALUES ("#{project}","#{r[0][0]}","0" , "0", "#{creator}");
        REQUEST
        Connection.new.execute(query)
    end
    
    def self.createdByMe(id)
        q=<<-REQUEST
            SELECT project FROM #{$table} WHERE user="#{id}" AND creator=1;
        REQUEST
        p r=Connection.new.execute(q)
        i=0
        arr=[]
        while(i<r.length) do
                 query=<<-REQUEST
                    SELECT * FROM project WHERE id="#{r[i][0]}"
                REQUEST
                arr += Connection.new.execute(query)
            i+=1
        end
        p arr
        if arr.any?
            arr.collect do |row|
                query=<<-REQUEST
                SELECT creator_name FROM #{$table} WHERE project="#{row[0]}"
            REQUEST
            c=Connection.new.execute(query)
            row << c[0][0]
            UserProjects.new(row)
            end
        end 
    end
    
    def self.sharedWithMe(id)
        q=<<-REQUEST
            SELECT project FROM #{$table} WHERE user="#{id}" AND creator=0;
        REQUEST
        r=Connection.new.execute(q)
        i=0
        arr=[]
        while(i<r.length) do
                 query=<<-REQUEST
                    SELECT * FROM project WHERE id="#{r[i][0]}"
                REQUEST
                arr += Connection.new.execute(query)
            i+=1
        end
        if arr.any?
            arr.collect do |row|
                query=<<-REQUEST
                SELECT creator_name FROM #{$table} WHERE project="#{row[0]}"
            REQUEST
            c=Connection.new.execute(query)
            row << c[0][0]
            UserProjects.new(row)
            end
        end 
    end
    
    def self.allUserProject(id)
        q=<<-REQUEST
            SELECT project FROM #{$table} WHERE user="#{id}";
        REQUEST
        r=Connection.new.execute(q)
        i=0
        arr=[]
        while(i<r.length) do
                 query=<<-REQUEST
                    SELECT * FROM project WHERE id="#{r[i][0]}"
                REQUEST
                arr += Connection.new.execute(query)
            i+=1
        end
        if arr.any?
            arr.collect do |row|
                    query=<<-REQUEST
                        SELECT creator_name FROM #{$table} WHERE project="#{row[0]}"
                    REQUEST
                    c=Connection.new.execute(query)
                    row << c[0][0]
                    UserProjects.new(row)
            end
        end 
    end
end
=begin
p UserProjects.sharedWithMe(1)
#  UserProjects.creator("bitch",1,"sdfgrr")
#  UserProjects.addmember(2,"frrfd@gmail.com","yess")
#  UserProjects.addmember(3,"frrfd@gmail.com","hey")
#  UserProjects.creator("souembot",1,"sdfgrr")
#  UserProjects.sharedWithMe(1)
p  UserProjects.allUserProject(7)
p UserProjects.all
=end


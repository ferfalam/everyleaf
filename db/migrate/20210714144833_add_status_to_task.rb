class AddStatusToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :status, :string, default:"unstarted"
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end

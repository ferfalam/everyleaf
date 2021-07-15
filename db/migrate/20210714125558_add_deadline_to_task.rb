class AddDeadlineToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :deadline, :datetime, default: "01/08/2021 00:00"
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end

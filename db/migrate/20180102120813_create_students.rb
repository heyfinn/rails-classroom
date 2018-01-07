class CreateStudents < ActiveRecord::Migration[5.1]
  belongs_to: classroom
  
  def change
    create_table :students do |t|
      t.string :user_id
      t.string :class_id
      t.string :first_name
      t.string :last_name
      t.string :profile_id
      t.string :email
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end

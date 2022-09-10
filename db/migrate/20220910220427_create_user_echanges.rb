class CreateUserEchanges < ActiveRecord::Migration[7.0]
  def change
    create_table :user_echanges, id: :uuid do |t|
      t.string :title
      t.string :slug
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :course, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    # Adding uniqueness constraint for the couple title and course_id
    add_index :user_echanges, [:title, :course_id], unique: true
    # Adding index to the title field for performance reasons
    add_index :user_echanges, :title
  end
end

class EditIntroduction < ActiveRecord::Migration[5.0]
  def change
    change_column :books, :introduction, :text
  end
end

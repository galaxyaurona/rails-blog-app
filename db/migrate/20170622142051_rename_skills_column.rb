class RenameSkillsColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :skills, :percent_ultilized, :percent_utilized
  end
end

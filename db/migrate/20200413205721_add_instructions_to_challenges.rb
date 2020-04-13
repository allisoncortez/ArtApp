class AddInstructionsToChallenges < ActiveRecord::Migration[6.0]
  def change
    add_column :challenges, :instructions, :text
  end
end

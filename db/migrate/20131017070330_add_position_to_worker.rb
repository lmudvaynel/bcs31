class AddPositionToWorker < ActiveRecord::Migration
  def change
    add_column :workers, :position, :integer
    add_index :workers, :position

    Worker.all.each_with_index do |w, i|
      w.position = i
      w.save!
    end
  end
end
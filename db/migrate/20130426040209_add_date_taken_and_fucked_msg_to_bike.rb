class AddDateTakenAndFuckedMsgToBike < ActiveRecord::Migration
  def change
    add_column :bikes, :date_offline, :datetime
    add_column :bikes, :fucked, :boolean
    add_column :bikes, :notes, :text, default: ''

    Bike.all.each do |bike|
      case bike.condition
      when 'operational'

      when 'offline'
        bike.update_attribute(:date_offline, Time.now)
      when 'fucked'
        bike.update_attribute(:date_offline, Time.now)
        bike.update_attribute(:fucked, true)
      end
    end

    remove_column :bikes, :condition
  end
end

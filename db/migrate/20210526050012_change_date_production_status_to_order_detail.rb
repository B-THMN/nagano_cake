class ChangeDateProductionStatusToOrderDetail < ActiveRecord::Migration[5.2]
  def change 
    change_column_default :order_details,:production_status,from: "0",to: 0
    change_column :order_details,:production_status,:integer
  end
end

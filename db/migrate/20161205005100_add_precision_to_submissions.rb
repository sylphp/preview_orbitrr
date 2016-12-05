class AddPrecisionToSubmissions < ActiveRecord::Migration[5.0]
  def change
  	change_column :submissions, :price, :decimal, precision: 8, scale: 2
  end
end

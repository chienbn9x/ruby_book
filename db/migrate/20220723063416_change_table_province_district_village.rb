class ChangeTableProvinceDistrictVillage < ActiveRecord::Migration[6.1]
  def change
    rename_column :provinces, :type, :province_type
    rename_column :districts, :type, :district_type
    rename_column :villages, :type, :village_type
  end
end

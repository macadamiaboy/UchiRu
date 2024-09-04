class RemovePrefixColumnsFromApiKeys < ActiveRecord::Migration[7.1]
  def change
    remove_column :api_keys, :common_token_prefix, :string
    remove_column :api_keys, :random_token_prefix, :string
  end
end

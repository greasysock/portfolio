class AddProjectUrlToPortfolio < ActiveRecord::Migration[5.2]
  def change
    add_column :portfolios, :project_url, :string
  end
end

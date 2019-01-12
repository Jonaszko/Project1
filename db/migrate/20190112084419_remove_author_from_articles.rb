class RemoveAuthorFromArticles < ActiveRecord::Migration[5.2]
  def change
    #typ opcje i wartość domyslna podajemy by migracja byla odwracalna
    #mozna ja cofnac poleceniem rails db:rollback
    remove_column :articles, :author, :string, null: false, default: 'Nieznany', index: true
  end
end

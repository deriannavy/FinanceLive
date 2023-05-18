defmodule Finance.Repo.Migrations.CreateAccounts do
   use Ecto.Migration

   def change do
      create table(:accounts, primary_key: false) do
         add :id, :binary_id, primary_key: true
         add :first_name, :string
         add :last_name, :string
         add :email, :string, null: false 
         add :alias, :string, null: false 
         add :encrypted_password, :string
   
         timestamps()      
      end

      create unique_index(:accounts, [:email])
      create unique_index(:accounts, [:alias])
      
   end
end

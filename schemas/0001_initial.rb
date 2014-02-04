
schema "0001 initial" do

  entity "User" do
    string :name
    string :bio

    has_many :tones
  end

  entity "Tone" do
    string :title
    string :content

    datetime :created_at
    datetime :updated_at

    belongs_to :user
  end

end

ART TRACKER/LOG/ART CHALLENGE
Rails_App : MakeSh*t(still thinking of names)
Artsh*t, MakeArt, ArtChallenge,
Art School/ Art Project/ Sketch/ ProjectArt/ ArtMake/ Sketchbook/Make/MakeSh*t
Write something, read something, MAKE SOMETHING.

MODELS
User
- has_many :art_pieces
- has_many :challenges, through: :art_pieces
 
- has_many :comments
<!-- - has_many :comments_on_art, through :comments, source: :art_piece -->

- email
- password_digest

Challenge
- has_many :art_pieces
- has_many :users, through: :art_pieces
- name

Art_piece
- belongs_to :user
- belongs_to :challenge
- has_many :comments
<!-- - has_many :users, through :comments -->
- Title(required)
- IG handle(optional)

Comments
- belongs_to :user
- belongs_to :art_piece
- content

getting challenge cards to be linkable(the entire card)

<%= link_to "View Image", image_path(a.image.id), class: 'btn btn-secondary stretched-link' %>







App Flow
1. Sign up => users/1
2. Pick a Challenge
- LonelyArtsClub (themed every week)
- MakeSh*t (make one thing every day)
3. Upload

Misc. Ideas
you can see your logs by months… ( a digitalized collage) 
Brewery.create(
  name: "BEERWORKS (No. 3 Boston/Canal)",
  address: "112 Canal St.",
  city: "Boston",
  state: "MA",
  zip: "02114",
  image: "https://i2.wp.com/beerbusterspodcast.com/wp-content/uploads/2014/06/Beer-Works-Featured-2.jpg?fit=1300%2C846&ssl=1"
)
Brewery.create(
  name: "Night Shift Brewing",
  address: "1 Lovejoy Wharf Suit 101",
  city: "Boston",
  state: "MA",
  zip: "02114",
  image: "https://www.lenoxhotel.com/wp-content/uploads/2017/05/NightShift.jpg"
)
Brewery.create(
  name: "Harpoon Brewery & Beer Hall",
  address: "306 Northern Ave",
  city: "Boston",
  state: "MA",
  zip: "02110",
  image: "https://www.wheretraveler.com/sites/default/files/images/harpoon_1658_gelsobello_2016.jpg"
)
Brewery.create(
  name: "Hopsters Brewing Company",
  address: "51 Sleeper St.",
  city: "Boston",
  state: "MA",
  zip: "02110",
  image: "https://www.bostonseaport.xyz/wp-content/uploads/2018/06/boston-seaport-places-hopsters.jpg"
)
User.create(
  username: 'username',
  email: "user@example.com",
  password: 'password',
  password_confirmation: 'password'
)
Review.create(
  rating: 5,
  comment: "This place was absolutely fantastic, I had a great time with my friends at a great price.",
  brewery_id: 1,
  user: User.first
)
Review.create(
  rating: 5,
  comment: "They had my favorite beer.",
  brewery_id: 2,
  user: User.first
)
Review.create(
  rating: 4,
  comment: "Lots of seating!",
  brewery_id: 2,
  user: User.first
)
Review.create(
  rating: 1,
  comment: "Waiter was a jerk!!!",
  brewery_id: 3,
  user: User.first
)
Review.create(
  rating: 2,
  comment: "It took forever to get my food!",
  brewery_id: 3,
  user: User.first
)
Review.create(
  rating: 3,
  comment: "Beer was sub-par.",
  brewery_id: 4,
  user: User.first
)

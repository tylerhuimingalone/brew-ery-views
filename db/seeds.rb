User.create(
  username: "testUser",
  email: "test@test.com",
  password: "password",
  password_confirmation: "password"
)

Brewery.create(
  name: "BEERWORKS (No. 3 Boston/Canal)",
  address: "112 Canal St",
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
  address: "51 Sleeper St",
  city: "Boston",
  state: "MA",
  zip: "02110",
  image: "https://www.bostonseaport.xyz/wp-content/uploads/2018/06/boston-seaport-places-hopsters.jpg"
)

Brewery.create(
  name: "Idle Hands Craft Ales",
  address: "89 Commercial St",
  city: "Malden",
  state: "MA",
  zip: "02148",
  image: "https://cdn10.bostonmagazine.com/wp-content/uploads/2016/07/idle-hands-lede.jpg"
)

Brewery.create(
  name: "Bone Up Brewering Co.",
  address: "38 Norman St",
  city: "Everett",
  state: "MA",
  zip: "02149",
  image: "https://www.boneup.beer/uploads/2/9/4/5/29456217/taproom-0002-20181126_orig.jpg"
)

Review.create(
  rating: 5,
  comment: "This place was absolutely fantastic, I had a great time with my friends at a great price.",
  brewery_id: 1,
  user_id: 1
)

Review.create(
  rating: 5,
  comment: "They had my favorite beer.",
  brewery_id: 2,
  user_id: 1
)

Review.create(
  rating: 4,
  comment: "Lots of seating!",
  brewery_id: 2,
  user_id: 1
)

Review.create(
  rating: 1,
  comment: "Waiter was a jerk!!!",
  brewery_id: 3,
  user_id: 1
)

Review.create(
  rating: 2,
  comment: "It took forever to get my food!",
  brewery_id: 3,
  user_id: 1
)

Review.create(
  rating: 3,
  comment: "Beer was sub-par.",
  brewery_id: 4,
  user_id: 1
)

Review.create(
  rating: 5,
  comment: "My hands were full... of beer!",
  brewery_id: 5,
  user_id: 1
)

Review.create(
  rating: 3,
  comment: "Good, but kinda expensive.",
  brewery_id: 5,
  user_id: 1
)

Review.create(
  rating: 2,
  comment: "Did not appreciate the name.",
  brewery_id: 6,
  user_id: 1
)

Review.create(
  rating: 5,
  comment: "Best name ever!!",
  brewery_id: 6,
  user_id: 1
)

Beer.create(
  name: "A Beer",
  beer_type: "Laaaaaaager",
  description: "Piss in a glass",
  brewery_id: 1
)

Beer.create(
  name: "Portman's Unusual",
  beer_type: "Stout",
  description: "",
  brewery_id: 1
)

Beer.create(
  name: "A Most Peculiar Upchuck",
  beer_type: "IPA",
  description: "Honestly, it is",
  brewery_id: 2
)

Beer.create(
  name: "Another Thing To Make Me Do Something Stupid",
  beer_type: "Who Knows",
  description: "IT'S PRETTY AWESOME",
  brewery_id: 3
)

Beer.create(
  name: "Dogsbottom IPA",
  beer_type: "IP",
  description: "Better than one might think",
  brewery_id: 1
)

Beer.create(
  name: "German Exploitation Hefeweiss",
  beer_type: "Wheat",
  description: "Completely original, our own ceeation",
  brewery_id: 1
)

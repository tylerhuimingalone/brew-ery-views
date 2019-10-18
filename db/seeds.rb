Brewery.create(
  name: "BEERWORKS (No. 3 Boston/Canal)",
  address: "112 Canal St.",
  city: "Boston",
  state: "MA",
  zip: "02114",
  image: ""
)
Brewery.create(
  name: "Night Shift Brewing",
  address: "1 Lovejoy Wharf Suit 101",
  city: "Boston",
  state: "MA",
  zip: "02114",
  image: ""
)
Brewery.create(
  name: "Harpoon Brewery & Beer Hall",
  address: "306 Northern Ave",
  city: "Boston",
  state: "MA",
  zip: "02110",
  image: ""
)
Brewery.create(
  name: "Hopsters Brewing Company",
  address: "51 Sleeper St.",
  city: "Boston",
  state: "MA",
  zip: "02110",
  image: ""
)
Review.create(
  rating: 5,
  comment: "This place was absolutely fantastic, I had a great time with my friends at a great price.",
  brewery_id: 1
)
Review.create(
  rating: 5,
  comment: "They had my favorite beer.",
  brewery_id: 2
)
Review.create(
  rating: 4,
  comment: "Lots of seating!",
  brewery_id: 2
)
Review.create(
  rating: 1,
  comment: "Waiter was a jerk!!!",
  brewery_id: 3
)
Review.create(
  rating: 2,
  comment: "It took forever to get my food!",
  brewery_id: 3
)
Review.create(
  rating: 3,
  comment: "Beer was sub-par.",
  brewery_id: 4
)

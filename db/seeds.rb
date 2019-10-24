User.create(
  username: "Richard",
  email: "richard@test.com",
  password: "password",
  password_confirmation: "password",
  admin: true
)

User.create(
  username: "Tyler",
  email: "tyler@test.com",
  password: "password",
  password_confirmation: "password",
  admin: true
)

User.create(
  username: "Charlie",
  email: "charlie@test.com",
  password: "password",
  password_confirmation: "password",
  admin: true
)

User.create(
  username: "Susan",
  email: "susan@test.com",
  password: "password",
  password_confirmation: "password",
  admin: true
)

beerworks_brewery = Brewery.create(
  name: "BEERWORKS (No. 3 Boston/Canal)",
  address: "112 Canal St",
  city: "Boston",
  state: "MA",
  zip: "02114",
  image: "https://i2.wp.com/beerbusterspodcast.com/wp-content/uploads/2014/06/Beer-Works-Featured-2.jpg?fit=1300%2C846&ssl=1"
)

Review.create(
  rating: 3,
  comment: "Beer was sub-par.",
  brewery_id: beerworks_brewery.id,
  user_id: 1
)

Review.create(
  rating: 5,
  comment: "My hands were full... of beer!",
  brewery_id: beerworks_brewery.id,
  user_id: 2
)

Review.create(
  rating: 3,
  comment: "Good, but kinda expensive.",
  brewery_id: beerworks_brewery.id,
  user_id: 3
)

Beer.create(
  name: "Brewski",
  beer_type: "Light American PA",
  description: "Low in calories, smooth, easy to drink",
  brewery_id: beerworks_brewery.id
)

Beer.create(
  name: "Blue 92",
  beer_type: "Light American Ale",
  description: "Low in calories, Maine blueberries, smooth & crisp finish",
  brewery_id: beerworks_brewery.id
)

Beer.create(
  name: "Boho Pils",
  beer_type: "Traditional Bohemian Pilsner",
  description: "Bohemian pilsner malt, Czech Saaz hops, smooth & crisp",
  brewery_id: beerworks_brewery.id
)

Beer.create(
  name: "Stars & Stripes IPA",
  beer_type: "America PA",
  description: "Matueka, Mosaic, Ekuanot, refreshing, hazy straw ",
  brewery_id: beerworks_brewery.id
)

Beer.create(
  name: "Brutally honest IPA",
  beer_type: "IPA",
  description: "Brut style IPA (Hop champagne), excessively effervescent, super dry, well-rounded hop profile",
  brewery_id: beerworks_brewery.id
)

Beer.create(
  name: "Excellent Porter",
  beer_type: "Porter",
  description: "Dialed up to 11, dark and roasty, complex",
  brewery_id: beerworks_brewery.id
)

Beer.create(
  name: "Contender",
  beer_type: "IP",
  description: "'New East Coast Style' IPA, tropical hop character, slightly malty",
  brewery_id: beerworks_brewery.id
)

Beer.create(
  name: "Big Boy",
  beer_type: "IPA",
  description: "Strong IPA, assertively bitter, huge flavor, citrus, pine, floral notes",
  brewery_id: beerworks_brewery.id
)

night_shift_brewery = Brewery.create(
  name: "Night Shift Brewing",
  address: "1 Lovejoy Wharf Suit 101",
  city: "Boston",
  state: "MA",
  zip: "02114",
  image: "https://www.lenoxhotel.com/wp-content/uploads/2017/05/NightShift.jpg"
)

Review.create(
  rating: 5,
  comment: "This has to be one of my favorite hangouts after work. The beer is great and the atmosphere friendly.",
  brewery_id: night_shift_brewery.id,
  user_id: 4
)

Review.create(
  rating: 5,
  comment: "I just keep coming back to this place because it is without fault. I've tried many taprooms in the city but this one is my favorite.",
  brewery_id: night_shift_brewery.id,
  user_id: 3
)

Review.create(
  rating: 5,
  comment: "Recommend for beer lovers that want to try interesting local takes on traditional beers. The IPAs are truly outstanding.",
  brewery_id: night_shift_brewery.id,
  user_id: 2
)

Review.create(
  rating: 4,
  comment: "Stopped by whilst visiting from out of town and had an excellent time though it took a while to get service initially",
  brewery_id: night_shift_brewery.id,
  user_id: 1
)

Beer.create(
  name: "Whirlpool",
  beer_type: "New England PA",
  description: "Our flagship New England pale ale is brewed with a malt bill of wheat, oats, and barley; Mosaic and Summer hops are used in the kettle, and we dry-hop with another round of Mosaic. Whirlpool pours straw yellow and slightly hazy. Expect aromas of peach and mango, with notes of ripe citrus and a crisp finish.",
  brewery_id: night_shift_brewery.id
)

Beer.create(
  name: "Santilli",
  beer_type: "American IPA",
  description: "Our flagship American IPA is named after Santilli Highway, the street in Everett that the brewery calls home. We first brewed this beer in 2015 as a batch of our rotating series, Morph. This batch was too good to become a distant memory, and thus, Santilli was born.",
  brewery_id: night_shift_brewery.id
)

Beer.create(
  name: "The 87",
  beer_type: "American Double IPA",
  description: "Lovingly named after our address in Everett, The 87 delivers juicy hop bombs that remind us of our Taproom home. With crisp notes of sweet stone fruit that transport your taste buds to a tropical destination, The 87 is ready to sip no matter what the weather outside may be.",
  brewery_id: night_shift_brewery.id
)

Beer.create(
  name: "Morph",
  beer_type: "Rotating IPAs",
  description: "At Night Shift Brewing, we think change is a good thing. Meet Morph, our ever transforming IPA series. With new recipes from batch to batch, Morph allows our brewers to experiment with different hops and malts. The result? A wide range of IPA varieties all under one name.",
  brewery_id: night_shift_brewery.id
)

harpoon_brewery = Brewery.create(
  name: "Harpoon Brewery & Beer Hall",
  address: "306 Northern Ave",
  city: "Boston",
  state: "MA",
  zip: "02110",
  image: "https://www.wheretraveler.com/sites/default/files/images/harpoon_1658_gelsobello_2016.jpg"
)

Review.create(
  rating: 4,
  comment: "I've been drinking their beer for years and finally got around to visiting the taproom. Glad I did.",
  brewery_id: harpoon_brewery.id,
  user_id: 1
)

Review.create(
  rating: 3,
  comment: "The beer is good but I couldn't quite see why it reviews so highly.",
  brewery_id: harpoon_brewery.id,
  user_id: 2
)

Review.create(
  rating: 2,
  comment: "So, so busy and the staff seemed disinterested in serving. Might be because the Red Sox dropped out of playoff contention last night.",
  brewery_id: harpoon_brewery.id,
  user_id: 3
)

Beer.create(
  name: "Harpoon IPA",
  beer_type: "IPA",
  description: "A traditional IPA that is as approachable as it is delicious. That isn't just easy to drink, it's fun to drink. That is so well-rounded, so refreshing and – yes – so drinkable that it pairs perfectly with anything life has to offer",
  brewery_id: harpoon_brewery.id
)

Beer.create(
  name: "Rec. League",
  beer_type: "Hazy PA",
  description: "Brewed with a groundbreaking blend of ingredients, Rec. League is bursting with citrusy hop flavor and aroma, refreshing, and just 120 calories.",
  brewery_id: harpoon_brewery.id
)

Beer.create(
  name: "About One Hazy Summer",
  beer_type: "New England PA",
  description: "Intense aromas of citrus, berry, and tropical fruit in a hazy Summer pale ale. We don't need any excuses to celebrate One Hazy Summer. Open, and enjoy!",
  brewery_id: harpoon_brewery.id
)

Beer.create(
  name: "Peach Kettle Sour",
  beer_type: "Kettle Sour",
  description: "Beer has brought people together for centuries. So it's no surprise that when three women from both of our Breweries teamed up to brew together, they crafted the runaway hit of our annual homebrew contest. The end result was not just this refreshingly tart peach kettle sour, but a lasting friendship.",
  brewery_id: harpoon_brewery.id
)

Beer.create(
  name: "About MacGuffin",
  beer_type: "Wee Heavy Ale",
  description: "It's time… to quit your yapping, grab a stool, and fill your beak with a slug of this hard-as-nails wee heavy. A real beaut, right on the edge of darkness, this beer is brewed with fresh thyme – to sing to your sniffer – and honey – to sweeten your gills. This is one enigma of an ale.",
  brewery_id: harpoon_brewery.id
)

Beer.create(
  name: "American IPA",
  beer_type: "IPA",
  description: "American IPA is our latest effort to squeeze the flavor out of both – with a healthy dose of lupulin thrown in for good measure. Bursting with fruit-forward aromas of citrus and a hint of pine, served up refreshingly bitter and decidedly un-hazy, it isn't old school or new school. It's not West Coast, English, or New England Style. It's not brewed with glitter. It's an American IPA, hopped with Galaxy, Citra, and Centennial.",
  brewery_id: harpoon_brewery.id
)

hopsters_brewery = Brewery.create(
  name: "Hopsters Brewing Company",
  address: "51 Sleeper St",
  city: "Boston",
  state: "MA",
  zip: "02110",
  image: "https://www.bostonseaport.xyz/wp-content/uploads/2018/06/boston-seaport-places-hopsters.jpg"
)

Review.create(
  rating: 5,
  comment: "I fell in love with one of the bar staff but am too shy to own up. Will definitely go again. Apparently the Porter gives you the confidence I currently lack.",
  brewery_id: hopsters_brewery.id,
  user_id: 1
)

Review.create(
  rating: 5,
  comment: "Beer. More beer. Beer again. All the major food groups in one fantastic place.",
  brewery_id: hopsters_brewery.id,
  user_id: 2
)

Review.create(
  rating: 4,
  comment: "Probably a great place but one of the kids called to say that the dog had got stuck in the mailbox again so we had to leave before we finished the first. We'll try again soon.",
  brewery_id: hopsters_brewery.id,
  user_id: 3
)

Review.create(
  rating: 1,
  comment: "Not for me, very loud and some customers were truly obnoxious. The staff did what they could",
  brewery_id: hopsters_brewery.id,
  user_id: 2
)

Review.create(
  rating: 5,
  comment: "Best. Night. Ever.",
  brewery_id: hopsters_brewery.id,
  user_id: 3
)

Beer.create(
  name: "Brew Your Own!",
  beer_type: "All styles",
  description: "The beer making experience starts by choosing your ingredients. As the only custom craft brewery in the area, we offer one-of-a-kind opportunities to make your own beer in Boston. We have a variety of high-quality ingredients to choose from including hops, barley, and more. Don't worry—our Award-Winning Brewers will help you choose your ingredients to handcraft your beer. However, the recipe is completely up to you. After you finish brewing your own beer, you will come back in 2 to 3 weeks when it's time to bottle your creation.",
  brewery_id: hopsters_brewery.id
)

idle_hands_brewery = Brewery.create(
  name: "Idle Hands Craft Ales",
  address: "89 Commercial St",
  city: "Malden",
  state: "MA",
  zip: "02148",
  image: "https://cdn10.bostonmagazine.com/wp-content/uploads/2016/07/idle-hands-lede.jpg"
)

Review.create(
  rating: 2,
  comment: "Food was better than the beer. Unfortunate.",
  brewery_id: idle_hands_brewery.id,
  user_id: 3
)

Review.create(
  rating: 5,
  comment: "This was by far the taproom I wanted to be in when I was living locally. When I get to visit I'll head straight for this place, otherwise the trip seems wasted.",
  brewery_id: idle_hands_brewery.id,
  user_id: 1
)

Review.create(
  rating: 1,
  comment: "My brother loves the place. My brother is an idiot.",
  brewery_id: idle_hands_brewery.id,
  user_id: 1
)

Review.create(
  rating: 2,
  comment: "<shrugs>",
  brewery_id: idle_hands_brewery.id,
  user_id: 1
)

Beer.create(
  name: "Evelyn",
  beer_type: "Pale Lager",
  description: "Bright and clean from extended lagering. Delicate notes of lemon and white grapes mixed with cracker malts. Mild and refreshing.",
  brewery_id: idle_hands_brewery.id
)

Beer.create(
  name: "Clay, 8th Anniversary",
  beer_type: "German Brown Ale",
  description: "A tasty German brown ale with deep malt characteristics and a touch of bitterness.",
  brewery_id: idle_hands_brewery.id
)

Beer.create(
  name: "Slate",
  beer_type: "Everyday Ale",
  description: "Notes of melon, papaya and raspberries over a simple malt base with limited bitterness. A refreshing, flavorful, easy drinker that pairs with life.",
  brewery_id: idle_hands_brewery.id
)

Beer.create(
  name: "Crosstown Traffic",
  beer_type: "New England Pale Ale",
  description: "Bright and clean from extended lagering. Delicate notes of lemon and white grapes mixed with cracker malts. Mild and refreshing.",
  brewery_id: idle_hands_brewery.id
)

Beer.create(
  name: "Barrel-Aged Annika",
  beer_type: "Porter",
  description: "Our hearty and rich Baltic porter aged for one year in bourbon barrels. Notes of dark chocolate, caramel, coconut and oak combine into a decadent treat.",
  brewery_id: idle_hands_brewery.id
)

bone_up_brewery = Brewery.create(
  name: "Bone Up Brewering Co.",
  address: "38 Norman St",
  city: "Everett",
  state: "MA",
  zip: "02149",
  image: "https://www.boneup.beer/uploads/2/9/4/5/29456217/taproom-0002-20181126_orig.jpg"
)

Review.create(
  rating: 5,
  comment: "Such a fun experience with my family!",
  brewery_id: bone_up_brewery.id,
  user_id: 4
)

Review.create(
  rating: 1,
  comment: "How in hot garbage does this place still exist?",
  brewery_id: bone_up_brewery.id,
  user_id: 2
)

Review.create(
  rating: 2,
  comment: "I'm only giving two stars because the food was decent, but the beer was less than acceptable.",
  brewery_id: bone_up_brewery.id,
  user_id: 1
)

Beer.create(
  name: "Extra Naked",
  beer_type: "Premium Ceam Ale",
  description: "We took a cream ale and goosed it with some good ol' Bone Up magic, and made a tasty brew that'll disappear from your glass before you know it and then you'll have to try and convince your roommate to get you more so you don't have to get up. I'm told that the British call that 'moreishness'.",
  brewery_id: bone_up_brewery.id
)

Beer.create(
  name: "Wasted Life",
  beer_type: "IPA",
  description: "​Ever had an IPA? This one is better! And it gets better with every glass you have, so you should probably drink this to the exclusion of everything else. Except water. Water is good for you. And maybe coffee too, but that's it.",
  brewery_id: bone_up_brewery.id
)

Beer.create(
  name: "Shut Up Kelly!",
  beer_type: "Porter",
  description: "I used to work with a girl named Kelly who didn't like dark beers until she drank my porter. Then every time I mentioned brewing within twenty feet of her, she'd ask, 'Are you brewing your porter?' and then she'd start telling the same story I just told you, only ten thousand times longer. Eventually, I brewed the porter again in the hopes of getting her to shut up about it. It didn't work, but the beer was a keeper.",
  brewery_id: bone_up_brewery.id
)

Beer.create(
  name: "Rebello Fellow",
  beer_type: "Hoppy Belgium Strong",
  description: "In all seriousness, friend of the brewery (not to mention creator of that one rad painting in our taproom and several-time coloring contest winner and designer of our sweet lunchboxes) Victor just became a bona fide US citizen and we wanted to make him a beer to celebrate! Victor's the kinda guy that likes 'em big and burly, so we whipped up this whopper in his honor!",
  brewery_id: bone_up_brewery.id
)

Beer.create(
  name: "Ganymede",
  beer_type: "Hoppy Amber Ale",
  description: "Somebody (we forget who, like all meetings around here, there may have been some drinking during this meeting) suggested a moderately-burly yet bone-dry caramel-forward amber with some earthy/grassy hops and a (somewhat unexpected) whack o' banana (graciously provided by some Jarrylo hops) and that's exactly what we've got here! ",
  brewery_id: bone_up_brewery.id
)

sam_adams_brewery = Brewery.create(
  name: "Samuel Adams",
  address: "30 Germania St.",
  city: "Boston",
  state: "MA",
  zip: "02130",
  image: "https://www.hereforthebeer.com/wp-content/uploads/2018/03/331-1.jpg"
)

Review.create(
  rating: 4,
  comment: "Lots of seating!",
  brewery_id: sam_adams_brewery.id,
  user_id: 2
)

Review.create(
  rating: 1,
  comment: "Waiter was a jerk!!!",
  brewery_id: sam_adams_brewery.id,
  user_id: 2
)

Review.create(
  rating: 2,
  comment: "It took forever to get my food!",
  brewery_id: sam_adams_brewery.id,
  user_id: 3
)

Review.create(
  rating: 3,
  comment: "Beer was sub-par.",
  brewery_id: sam_adams_brewery.id,
  user_id: 3
)

Review.create(
  rating: 3,
  comment: "Beer was actually not bad.",
  brewery_id: sam_adams_brewery.id,
  user_id: 4
)

Beer.create(
  name: "Boston Lager",
  beer_type: "Lager",
  description: "A distinctive balance of spicy hops, slightly sweet roasted Malts, and a Smooth Finish",
  brewery_id: sam_adams_brewery.id
)

Beer.create(
  name: "Sam '76'",
  beer_type: "Lager/Ale Hybrid",
  description: "A lightly golden, slightly veiled brew with subtle citrus tropical aroma that is refreshing and smooth.",
  brewery_id: sam_adams_brewery.id
)

Beer.create(
  name: "OctoberFest",
  beer_type: "Lager",
  description: "Smooth with a Roasty Sweetness, and Light Hop Character.",
  brewery_id: sam_adams_brewery.id
)

Beer.create(
  name: "Porch Rocker",
  beer_type: "Lager",
  description: "Crisp and bright, with a tart lemon flavor and clean finish.",
  brewery_id: sam_adams_brewery.id
)

turtle_swamp_brewery = Brewery.create(
  name: "Turtle Swamp Brewing",
  address: "3377 Washington St.",
  city: "Boston",
  state: "MA",
  zip: "02130",
  image: "https://images.squarespace-cdn.com/content/v1/5a7c7a55f43b55f343cfbd7d/1559057116477-M557FOAZ17HT43Z4LMVL/ke17ZwdGBToddI8pDm48kPTrHXgsMrSIMwe6YW3w1AZ7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0k5fwC0WRNFJBIXiBeNI5fKTrY37saURwPBw8fO2esROAxn-RKSrlQamlL27g22X2A/20180809_194806-01.jpeg?format=1500w"
)

Review.create(
  rating: 5,
  comment: "This place was absolutely fantastic, I had a great time with my friends at a great price!",
  brewery_id: turtle_swamp_brewery.id,
  user_id: 1
)

Review.create(
  rating: 3,
  comment: "It was a fun atmosphere, but the beers were meh.",
  brewery_id: turtle_swamp_brewery.id,
  user_id: 4
)

Review.create(
  rating: 5,
  comment: "They had my favorite beer.",
  brewery_id: turtle_swamp_brewery.id,
  user_id: 1
)

Beer.create(
  name: "Orange Line IPA",
  beer_type: "New England IPA",
  description: "Our First New England IPA and beloved flagship; This is the citrus bomb of a beer that the good people of JP have demanded. Orange Line is named for the iconic subway of JP, and features a massive Citra dry hopping which gives the beer its unique orange and citrus aroma and taste.",
  brewery_id: turtle_swamp_brewery.id
)

Beer.create(
  name: "Serendipitous Pale Ale",
  beer_type: "American Pale Ale",
  description: "As the name implies, this beer came about as a happy accident. While doing one of our first brews of Nik's Bitter, Nik misread his own handwriting, and added CaraPils malt rather than Caramel Pils malt. You can see how he got messed up. The result was a paler than Pale Ale, but with a hearty hop aroma. We developed this beer further--simplified the malts, and upped the hopping--and Serendipitous is the result.",
  brewery_id: turtle_swamp_brewery.id
)

Beer.create(
  name: "Fine",
  beer_type: "Sour Beer",
  description: "Brewed with dried hibiscus flower which gives it a rose gold color and a cranberry-like tart flavor, FINE. is our first sour beer at Turtle Swamp. A true summer ale, it clocks in at 3.75% ABV, perfect for long days at the beach or pool, enjoying the sun, or just hanging out with friends. This beer was soured in our kettle with a live lacto-bacillus culture, and then fermented with our house yeast for the same full bodied flavor that is in all our other ales.",
  brewery_id: turtle_swamp_brewery.id
)

Beer.create(
  name: "Toll Gate",
  beer_type: "Hybrid IPA",
  description: "This beer is best thought of as half American IPA and half New England IPA--it retains the juiciness of the NEIPA style but has a strong bitter and malt body more reminiscent of the bitter hop bombs from the rest of the country. Made with a higher amount of caramel malt than most New England style IPAs, this darker color and sweetness helps accentuate the strong Passion Fruit aromas from the generous dose of dry hopping of Mosaic.",
  brewery_id: turtle_swamp_brewery.id
)

backlash_brewery = Brewery.create(
  name: "Backlash Beer Company",
  address: "8WHG+33",
  city: "Boston",
  state: "MA",
  zip: "02119",
  image: "https://images.squarespace-cdn.com/content/v1/5b055a972714e57af9b3b125/1537989386930-ZH3AO2UXU9IKTAJPUA8R/ke17ZwdGBToddI8pDm48kLkXF2pIyv_F2eUT9F60jBl7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0iyqMbMesKd95J-X4EagrgU9L3Sa3U8cogeb0tjXbfawd0urKshkc5MgdBeJmALQKw/IMG_0437.jpg"
)

Review.create(
  rating: 5,
  comment: "Went in on Friday, woke up Sunday in the gutter outside Fenway. Can only assume I had a great time....",
  brewery_id: backlash_brewery.id,
  user_id: 4
)

Review.create(
  rating: 2,
  comment: "Not as good as the ones back home. SourPuss.",
  brewery_id: backlash_brewery.id,
  user_id: 3
)

Review.create(
  rating: 1,
  comment: "Server is incredibly lucky to still have their job after their (lack of) performance. Leave the attitude at home next time.",
  brewery_id: backlash_brewery.id,
  user_id: 2
)

Review.create(
  rating: 3,
  comment: "Loved the beer names but they were too oddly flavored for my liking. Met one of the brewers and had an interesting conversation about what they did but it's too experimental for my taste.",
  brewery_id: backlash_brewery.id,
  user_id: 1
)

Review.create(
  rating: 5,
  comment: "Why doesn't my local bar have drinks like this back home? Disappointed from Ohio.",
  brewery_id: backlash_brewery.id,
  user_id: 4
)

Review.create(
  rating: 2,
  comment: "The beer was OK, but I haven't left the bathroom in 2 days after trying the scampi. Yikes!!!",
  brewery_id: backlash_brewery.id,
  user_id: 3
)

Review.create(
  rating: 5,
  comment: "Didn't try the taproom but the tour was great. Guide was incredibly helpful and chatty. Worth doing again just for the guide talk.",
  brewery_id: backlash_brewery.id,
  user_id: 2
)

Review.create(
  rating: 1,
  comment: "I don't actually like beer. Why was I even there? Confused.",
  brewery_id: backlash_brewery.id,
  user_id: 1
)

Beer.create(
  name: "Widerstand",
  beer_type: "German Pilsner",
  description: "This brand new beer is our German inspired Fest Bier. Brewed with continental pilsner malt and local Valley Malt Vienna malt, this beer is super smooth with a really nice bready malt profile.",
  brewery_id: backlash_brewery.id
)

Beer.create(
  name: "The Tartness",
  beer_type: "Kettle Sour",
  description: "This Pineapple Passion Fruit Sour packs a punch. Our kettle sour is balanced, but has additions of passion fruit and pineapple puree. This beer is light and crisp, with refreshing tart finish",
  brewery_id: backlash_brewery.id
)

Beer.create(
  name: "Indomitable",
  beer_type: "Double IPA",
  description: "This beer is a huge Double IPA where old school meets new school. Resin and dankness blends with sweet fruits with hints orange and peach.",
  brewery_id: backlash_brewery.id
)

Beer.create(
  name: "Bad Decision Juice",
  beer_type: "IPA",
  description: "Our first sorta-session'ish IPA. Popping with Citra, Mosaic and Idaho 7.",
  brewery_id: backlash_brewery.id
)

Beer.create(
  name: "The Great Molasses Disaster",
  beer_type: "Stout",
  description: "Brewed in tribute to one of the craziest things to happen in Boston history, this is our take on an Imperial Stout brewed with molasses.  Notes of roasted barley, chocolate and hints of smoke round out this complex brew.",
  brewery_id: backlash_brewery.id
)

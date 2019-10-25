import React from 'react'
import { Link } from 'react-router-dom'

const BreweryTile = props => {
  let image = props.image

  if (image === "") {
    image = "https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/beer-drink-sample-sampler.png?itok=JV4E4iVY"
  }
  return (
    <div className="columns small-12 medium-6 large-4">
      <div className="container brewery-tile">
        <Link to={`/breweries/${props.id}`}>
          <img src={image} />
        </Link>
        <div className="top-centered">
          <p className="brewery-name">
            <strong>{props.name}</strong>
          </p>
        </div>
        <div className="bottom-centered">
          <p className="brewery-location">
            {props.city}, {props.state}
          </p>
        </div>
      </div>
    </div>
  )
}

export default BreweryTile

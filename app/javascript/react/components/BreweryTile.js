import React from 'react'
import { Link } from 'react-router-dom'


const BreweryTile = props => {
  return (
    <div className="brewery-tile columns small-12 medium-4 large-3">
      <Link to={`/breweries/${props.id}`}>
        <p className="brewery-tile">
          {props.name}
        </p>
      </Link>
      <img src={props.image} width="200" />
      <p className="brewery-tile">
        {props.city}, {props.state}
      </p>
    </div>
  )
}

export default BreweryTile

import React from 'react'
import { Link } from 'react-router-dom'


const BreweryTile = props => {
  return (
    <div className="brewery-tile columns small-12 medium-4 large-3">
      <Link to={`/breweries/${props.id}`}>
        <h4>{props.name}</h4>
      </Link>
      <img src={props.image} width = "200" />
      <br/>
      <h5>{props.city}, {props.state}</h5>
    </div>
  )
}

export default BreweryTile

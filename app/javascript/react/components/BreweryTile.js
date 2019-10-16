import React from 'react'

const BreweryTile = props => {
  return (
    <div className="brewery-tile columns small-12 medium-4 large-3">
      <h4>{props.name}</h4>
      <br />
      <h5>{props.city}, {props.state}</h5>
    </div>
  )
}

export default BreweryTile

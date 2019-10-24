import React from 'react'

const BeerTile = props => {
  return (
    <div className="beer-box">
      <div className="row">
        <div className="columns small-12">
          <p>
            <strong>{props.name}</strong>
            <br/>
            Type: {props.type}
          </p>
        </div>
        <div className="columns small-12">
          Description: {props.description}
        </div>
        <hr />
      </div>
    </div>
  )
}

export default BeerTile

import React, { useState, useEffect } from 'react'

import BeerTile from './BeerTile'

const BeerIndexContainer = props => {
  const [beers, setBeers] = useState([])

  useEffect(() => {fetch(`/api/v1/breweries/${props.breweryId}/beers`)
    .then((response) => {
      if (response.ok) {
        return response
      } else {
        let errorMessage = `${response.status} (${response.statusText})`,
          error = new Error(errorMessage)
        throw(error)
      }
    })
    .then(response => response.json())
    .then(body => {
      setBeers(body.beers)
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`))
  }, [])

  const beerTiles = beers.map(beer => {
    return(
      <BeerTile
        key={beer.id}
        id={beer.id}
        name={beer.name}
        type={beer.beer_type}
        description={beer.description}
      />
    )
  })

  return(
    <div>
      {beerTiles}
    </div>
  )
}

export default BeerIndexContainer

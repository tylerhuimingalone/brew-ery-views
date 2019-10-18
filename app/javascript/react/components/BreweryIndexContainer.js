import React, { useState, useEffect } from 'react'

import BreweryTile from './BreweryTile'

const BreweryIndexContainer = props => {
  const [breweries, setBreweries] = useState([])

  useEffect(() => {fetch("/api/v1/breweries", {
    credentials: 'same-origin',
    })
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
      setBreweries(body)
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`))
  }, [])

  const breweryTiles = breweries.map(brewery => {
    return(
      <BreweryTile
        key={brewery.id}
        id={brewery.id}
        name={brewery.name}
        city={brewery.city}
        state={brewery.state}
        image={brewery.image}
      />
    )
  })

  return (
    <div>
      <p className="index-title row text-center">
        Let's Get A Drink
      </p>
      <hr id="index-line"/>
      <div className="row">
        {breweryTiles}
      </div>
    </div>
  )
}

export default BreweryIndexContainer

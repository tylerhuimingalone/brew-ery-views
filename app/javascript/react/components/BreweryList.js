import React, { useState, useEffect } from 'react'

const BreweryList = props => {
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
      setBreweries(body.breweries)
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`))
  }, [])

  const breweryList = breweries.map(brewery => {
    return(
      <li key={brewery.id}>
        {brewery.name}
      </li>
    )
  })

  return(
    <div className="small-12 medium-3 columns brewery-list">
      <h4 className="text-center list-title">Current Breweries</h4>
      <hr />
      <ul>
        {breweryList}
      </ul>
    </div>
  )
}

export default BreweryList

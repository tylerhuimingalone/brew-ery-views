import React, { useState, useEffect } from "react"
import { Link } from 'react-router-dom'

const BreweryShowContainer = props => {
  const [brewery, setBrewery] = useState([])

  let breweryId = props.match.params.id

  useEffect(() => {fetch(`/api/v1/breweries/${breweryId}`)
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
      setBrewery(body)
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`))
  },[])

  return (
    <div>
      <div className = "columns small-12 medium-6">
        <h2> {brewery.name} </h2>
          <img src={brewery.image} width = "500"/>
          <h3>
            {brewery.address} <br/>
            {brewery.city}, {brewery.state} <br/>
            {brewery.zip}
          </h3>
          <Link to="/breweries"> Return to Homepage </Link>
      </div>
      <div className = "columns small-12 medium-6">
        <p> reviews go here </p>
      </div>
    </div>
  )
}

export default BreweryShowContainer

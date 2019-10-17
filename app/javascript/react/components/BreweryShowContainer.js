import React, { useState, useEffect } from "react"
import { Link } from 'react-router-dom'

import ReviewIndexContainer from './ReviewIndexContainer'

const BreweryShowContainer = props => {
  const [brewery, setBrewery] = useState([])

  let breweryId = props.match.params.id

  useEffect(() => {fetch(`/api/v1/breweries/${breweryId}`, {
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
      setBrewery(body)
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`))
  },[])

  return (
    <div>
      <div className = "columns small-12 medium-6">
        <h3> {brewery.name} </h3>
          <img src={brewery.image} width = "500"/>
          <p>
            {brewery.address}&nbsp;
            {brewery.city},&nbsp;
            {brewery.state}&nbsp;
            {brewery.zip}
          </p>
          <Link to="/breweries"> Return to Homepage </Link>
      </div>
      <div>
        <button type="button">Reviews onClick=</button>
      </div>
      <div>
        <ReviewIndexContainer
          breweryId={breweryId}
        />
      </div>
    </div>
  )
}

export default BreweryShowContainer

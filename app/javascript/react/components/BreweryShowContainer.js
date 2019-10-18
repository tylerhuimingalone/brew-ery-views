import React, { useState, useEffect } from "react"
import { Link } from 'react-router-dom'

import ReviewIndexContainer from './ReviewIndexContainer'
import NewReviewContainer from './NewReviewContainer'

const BreweryShowContainer = props => {
  const [brewery, setBrewery] = useState([])
  const [reviewView, setReviewView] = useState("reviews")

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

  let component = ""

  const switchView = event => {
    setReviewView(event.currentTarget.name)
  }

  const resetView = () => {
    setReviewView("reviews")
  }

  if (reviewView === "reviews") {
    component = <ReviewIndexContainer breweryId={breweryId}/>
  }
  if (reviewView === "form") {
    component = <NewReviewContainer breweryId={breweryId} resetView={resetView} />
  }

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
      <div className = "columns small-12 medium-6">
        <div>
          <button name="reviews" onClick={switchView}> See Reviews </button>
          <button name="form" onClick={switchView}> Submit Reviews </button>
        </div>
        <div>
          {component}
        </div>
      </div>
    </div>
  )
}

export default BreweryShowContainer

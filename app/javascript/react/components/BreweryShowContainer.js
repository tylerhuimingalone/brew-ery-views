import React, { useState, useEffect } from "react"
import { Link } from 'react-router-dom'

import ReviewIndexContainer from './ReviewIndexContainer'
import NewReviewContainer from './NewReviewContainer'
import BeerIndexContainer from './BeerIndexContainer'

const BreweryShowContainer = props => {
  const [brewery, setBrewery] = useState([])
  const [reviewView, setReviewView] = useState("reviews")

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

  let component = ""

  const switchView = event => {
    setReviewView(event.currentTarget.name)
  }

  const resetView = () => {
    setReviewView("reviews")
  }

  let seeButton = 'selected'
  let formButton = 'unselected'
  let beerButton = 'unselected'

  if (reviewView === "reviews") {
    component = <ReviewIndexContainer breweryId={breweryId} resetView={resetView}/>
    seeButton ='selected'
    formButton = 'unselected'
    beerButton = 'unselected'
  }
  if (reviewView === "form") {
    component = <NewReviewContainer breweryId={breweryId} resetView={resetView} />
    seeButton ='unselected'
    formButton = 'selected'
    beerButton = 'unselected'
  }
  if (reviewView === "beers") {
    component = <BeerIndexContainer breweryId={breweryId} resetView={resetView} />
    seeButton ='unselected'
    formButton = 'unselected'
    beerButton = 'selected'
  }

  return (
    <div className="show-background">
      <div className="row show-page">
        <h3 className="show-title"> {brewery.name} </h3>
        <hr className="show-hr"/>
        <div className = "columns small-12 medium-6 show-block">
          <div className="text-center">
            <img src={brewery.image} />
            <div className="info-box">
              <p>
                {brewery.address},&nbsp;
                {brewery.city},&nbsp;
                {brewery.state}&nbsp;
                {brewery.zip}
              </p>
            </div>
            <div className="button">
              <Link to="/breweries"> Return to Homepage </Link>
            </div>
          </div>
        </div>
        <div className = "columns small-12 medium-6 list-block">
          <div className="show-tabs">
            <button className={seeButton} name="reviews" onClick={switchView}>
              See<br/>Reviews
            </button>
            <button className={formButton} name="form" onClick={switchView}>
              Submit<br/>Review
            </button>
            <button className={beerButton} name="beers" onClick={switchView}>
              See<br/>Beers
            </button>
          </div>
          <div className="show-component">
            {component}
          </div>
        </div>
      </div>
    </div>
  )
}

export default BreweryShowContainer

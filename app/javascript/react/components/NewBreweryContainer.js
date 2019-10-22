import React, { useState } from 'react'
import { Redirect } from 'react-router-dom'
import { isEmpty } from 'lodash'

import BreweryList from './BreweryList'

const StateArray = [ 'AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'DC', 'FL', 'GA', 'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VI', 'VA', 'WA', 'WV', 'WI', 'WY' ]


const NewBreweryContainer = props => {
  const [shouldRedirect, setShouldRedirect] = useState(false)
  const [errors, setErrors] = useState({})
  const [newBrewery, setNewBrewery] = useState({
    name: "",
    address: "",
    city: "",
    state: "",
    zip: "",
    image: ""
  })

  const validForSubmission = () => {
    let submitErrors = {}
    const requiredFields = ["name", "address", "city", "state", "zip"]
    requiredFields.forEach(field => {
      if (newBrewery[field].trim() === "") {
        submitErrors = {
          ...submitErrors,
          [field]: "can't be blank"
        }
      }
    })

    setErrors(submitErrors)
    return isEmpty(submitErrors)
  }

  const postNewBrewery = () => {
    event.preventDefault()
    if (validForSubmission()) {
      fetch("/api/v1/breweries", {
        credentials: 'same-origin',
        method: "POST",
        body: JSON.stringify(newBrewery),
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json"
        }
      })
      .then(response => {
        if (response.ok) {
          return response
        } else {
          const errorMessage = `${response.status} (${response.statusText})`
          const error = new Error(errorMessage)
          throw error
        }
      })
      .then(response => response.json())
      .then(body => {
        if (body.id) {
          setShouldRedirect(true)
        } else {
          setErrors(body)
        }
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`))
    }
  }

  if (shouldRedirect) {
    return <Redirect to='/breweries' />
  }

  const handleInputChange = event => {
    setNewBrewery({
      ...newBrewery,
      [event.currentTarget.name]: event.currentTarget.value
    })
  }

  const clearForm = event => {
    event.preventDefault()
    setNewBrewery({
      name: "",
      address: "",
      city: "",
      state: "",
      zip: "",
      image: ""
    })
    setErrors({})
  }

  const StateOptions = StateArray.map((state) => {
    return (
      <option key={state} name={state}>{state}</option>
    )
  })

  return(
    <div className="form-background">
      <div className="form-page">
        <div className="row">
          <form className="small-12 medium-9 columns" onSubmit={postNewBrewery}>
            <h3 className="text-center form-title">New Brewery Form</h3>
            <h5 className="text-center">{errors.user}</h5>
            <label className="small-12 columns">
              Name: {errors.name}
              <input
                type="text"
                name="name"
                value={newBrewery.name}
                onChange={handleInputChange}
              />
            </label>

            <label className="small-12 columns">
              Address: {errors.address}
              <input
                type="text"
                name="address"
                value={newBrewery.address}
                onChange={handleInputChange}
              />
            </label>

            <label className="small-12 medium-12 large-4 columns">
              City: {errors.city}
              <input
                type="text"
                name="city"
                value={newBrewery.city}
                onChange={handleInputChange}
              />
            </label>

            <label className="small-12 medium-6 large-4 columns">
              State: {errors.state}
              <select name="state" value={newBrewery.state} onChange={handleInputChange}>
                <option name=""></option>
                {StateOptions}
              </select>
            </label>

            <label className="small-12 medium-6 large-4 columns">
              Zip Code: {errors.zip}
              <input
                type="text"
                name="zip"
                value={newBrewery.zip}
                onChange={handleInputChange}
              />
            </label>

            <label className="small-12 columns">
              Image URL: (Optional)
              <input
                type="text"
                name="image"
                value={newBrewery.image}
                onChange={handleInputChange}
              />
            </label>

            <div className="text-center">
              <input
                className="button"
                type="submit"
                value="Add Brewery"
              />
              <button className="button" onClick={clearForm}>Clear</button>
            </div>
          </form>

          <BreweryList />
        </div>
      </div>
    </div>
  )
}

export default NewBreweryContainer

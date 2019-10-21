import React, { useState } from 'react'
import { Redirect } from 'react-router-dom'
import { isEmpty } from 'lodash'

import BreweryList from './BreweryList'

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

  return(
    <div className="row">
      <form className="small-12 medium-9 columns" onSubmit={postNewBrewery}>
        <h3 className="text-center">New Brewery Form</h3>
        <h5 className="text-center">{errors.user}</h5>
        <label>
          Name: {errors.name}
          <input
            type="text"
            name="name"
            value={newBrewery.name}
            onChange={handleInputChange}
          />
        </label>

        <label>
          Address: {errors.address}
          <input
            type="text"
            name="address"
            value={newBrewery.address}
            onChange={handleInputChange}
          />
        </label>

        <label>
          City: {errors.city}
          <input
            type="text"
            name="city"
            value={newBrewery.city}
            onChange={handleInputChange}
          />
        </label>

        <label>
          State: {errors.state}
          <input
            type="text"
            name="state"
            value={newBrewery.state}
            onChange={handleInputChange}
          />
        </label>

        <label>
          Zip Code: {errors.zip}
          <input
            type="text"
            name="zip"
            value={newBrewery.zip}
            onChange={handleInputChange}
          />
        </label>

        <label>
          Image URL:
          <input
            type="text"
            name="image"
            value={newBrewery.image}
            onChange={handleInputChange}
          />
        </label>

        <div>
          <button className="button" onClick={clearForm}>Clear</button>
          <input
            className="button"
            type="submit"
            value="Add Brewery"
          />
        </div>
      </form>

      <BreweryList />
    </div>
  )
}

export default NewBreweryContainer

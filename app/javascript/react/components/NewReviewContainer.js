import React, { useState } from 'react'
import _ from 'lodash'

const NewReviewContainer = props => {
  const [shouldRedirect, setShouldRedirect] = useState(false)
  const [errors, setErrors] = useState({})
  const [newReview, setNewReview] = useState({
    rating: "",
    comment: "",
    breweryId: props.breweryId
  })

  const validForSubmission = () => {
    let submitErrors = {}
    const requiredFields = ["rating"]
    requiredFields.forEach(field => {
      if (newReview[field].trim() === "") {
        submitErrors = {
          ...setErrors,
          [field]: "can't be blank"
        }
      }
    })

    setErrors(submitErrors)
    return _.isEmpty(submitErrors)
  }

  const postNewReview = (name) => {
    event.preventDefault()
    if (validForSubmission()) {
      fetch("api/v1/reviews", {
        credentials: "same-origin",
        method: "POST",
        body: JSON.stringify(newReview),
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
    props.resetView()
  }

  const handleInputChange = event => {
    setNewReview({
      ...newReview,
      [event.currentTarget.name]: event.currentTarget.value
    })
  }

  const clearForm = event => {
    event.preventDefault()
    setNewReview({
      rating: "",
      comment: ""
    })
    setErrors({})
  }

  return(
    <div className="row">
      <form className="small-12 medium-9 columns" onSubmit={postNewReview}>
        <h4 className="text-center">New Review Form</h4>
        <label>
          Rating: {errors.rating}
          <select name="rating" value={newReview.rating} onChange={handleInputChange}>
            <option name=""></option>
            <option name="1">1</option>
            <option name="2">2</option>
            <option name="3">3</option>
            <option name="4">4</option>
            <option name="5">5</option>
          </select>
        </label>

        <label>
          Comment: {errors.comment}
          <input
            type="text"
            name="comment"
            value={newReview.comment}
            onChange={handleInputChange}
          />
        </label>

        <div>
          <button className="button" onClick={clearForm}>Clear</button>
          <input
            className="button"
            type="submit"
            value="Add Review"
          />
        </div>
      </form>
    </div>
  )
}

export default NewReviewContainer

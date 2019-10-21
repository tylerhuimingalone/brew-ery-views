import React, { useState } from 'react'
import _ from 'lodash'

const EditReviewTile = props => {
  const [shouldRedirect, setShouldRedirect] = useState(false)
  const [errors, setErrors] = useState({})
  const [editReview, setEditReview] = useState({
    rating: props.rating,
    comment: props.comment
  })

  const postEditReview = (event) => {
    event.preventDefault()
    fetch(`/api/v1/reviews/${props.id}`, {
      credentials: "same-origin",
      method: "PATCH",
      body: JSON.stringify(editReview),
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

  const handleInputChange = event => {
    setEditReview({
      ...editReview,
      [event.currentTarget.name]: event.currentTarget.value
    })
  }

  if (shouldRedirect) {
    props.resetView()
  }

  return(
    <div className="row">
      <form className="small-12 medium-9 columns" onSubmit={postEditReview}>
        <h4 className="text-center">Edit Review Form</h4>
        <h5 className="text-center">{errors.user}</h5>
        <label>
          Rating: {errors.rating}
          <select name="rating" value={editReview.rating} onChange={handleInputChange}>
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
            value={editReview.comment}
            onChange={handleInputChange}
          />
        </label>

        <div>
          <input
            className="button"
            type="submit"
            value="Update Review"
          />
        </div>
      </form>
      <button className="button" onClick={props.resetView}>Cancel</button>
    </div>
  )
}

export default EditReviewTile

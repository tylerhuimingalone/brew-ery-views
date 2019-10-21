import React, { useState, useEffect } from 'react'
import { Link } from 'react-router-dom'

import ReviewTile from './ReviewTile'

const ReviewIndexContainer = props => {
  const [reviews, setReviews] = useState([])
  const [currentUserId, setCurrentUserId] = useState(0)
  const [message, setMessage] = useState("")

  useEffect(() => {fetch(`/api/v1/breweries/${props.breweryId}/reviews`)
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
      setReviews(body.reviews)
      setCurrentUserId(body.user_id)
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`))
  },[message])

  const deleteReview = (reviewId) => {
    fetch(`api/v1/reviews/${reviewId}`, {
      credentials: "same-origin",
      method: "DELETE",
      body: JSON.stringify(props.id),
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
      setMessage(body.message)
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`))
  }

  const reviewTiles = reviews.map(review => {
    return(
      <ReviewTile
        key={review.id}
        id={review.id}
        rating={review.rating}
        comment={review.comment}
        userId={review.user_id}
        currentUser={currentUserId}
        deleteReview={deleteReview}
      />
    )
  })

  return (
    <div>
      {message}
      {reviewTiles}
    </div>
  )
}
export default ReviewIndexContainer

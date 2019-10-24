import React, { useState } from 'react'

import ReviewTileBody from './ReviewTileBody'

const ReviewTile = props => {
  const [reviewScore, setReviewScore] = useState(props.score)
  const [errors, setErrors] = useState("")
  let buttons = ""

  const handleClick = (event) => {
    props.deleteReview(props.id)
  }

  const submitVote = (voteCount) => {
    fetch(`/api/v1/reviews/${props.id}/votes`,{
      credentials: 'same-origin',
      method: "POST",
      body: JSON.stringify({
        vote: {vote: voteCount}
      }),
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json"
      }
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
      if (body.id) {
        setReviewScore(body.total)
      } else {
        setErrors(body.user)
      }
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`))
  }

  const registerVote = (value) => {
    submitVote(value)
  }

  const voteUp = () => {
    registerVote(1)
  }

  const voteDown = () => {
    registerVote(-1)
  }

  if (props.currentUser === props.userId) {
    buttons = (
      <div className="buttons">
        <button className="button edit" onClick={props.editReview}>Edit</button>
        <button className="button delete" onClick={handleClick}>Delete</button>
      </div>
    )
  }

  return (
    <ReviewTileBody
      errors={errors}
      rating={props.rating}
      comment={props.comment}
      reviewScore={reviewScore}
      buttons={buttons}
      voteUp={voteUp}
      voteDown={voteDown}
    />
  )
}

export default ReviewTile

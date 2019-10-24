import React, { useState } from 'react'

const ReviewTile = props => {
  const [reviewScore, setReviewScore] = useState(props.score)
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
      setReviewScore(body.total)
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
        <button className="button" onClick={props.editReview}>Edit</button>
        <button className="button" onClick={handleClick}>Delete</button>
      </div>
    )
  }

  return (
    <div className="review-box row">
      <div className="small-9 columns">
        <p>{props.rating}:{props.comment} - score: {reviewScore}</p>
      </div>
      <div className="small-3 columns">
        <i className="fas fa-arrow-circle-up fa-lg" onClick={voteUp}/>
        <i className="fas fa-arrow-circle-down fa-lg" onClick={voteDown}/>
      </div>
      <div className="columns small-12 text-center">
        {buttons}
      </div>
      <hr />
    </div>
  )
}

export default ReviewTile

import React from 'react'

const ReviewTile = props => {
  let buttons = ""

  const handleClick = (event) => {
    props.deleteReview(props.id)
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
    <div className="review-box">
      <div className="row">
        <div className="columns small-12">
          <p>{props.rating}/5: {props.comment}</p>
        </div>
        <div className="columns small-12 text-center">
          {buttons}
        </div>
        <hr />
      </div>
    </div>
  )
}

export default ReviewTile

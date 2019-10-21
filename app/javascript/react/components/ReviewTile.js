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
      {buttons}
      <div><p>{props.rating}:{props.comment}</p></div>
    </div>
  )
}

export default ReviewTile

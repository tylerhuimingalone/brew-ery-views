import React from 'react'

const ReviewTile = props => {
  return(
    <div className="review-box">
      <p>{props.rating}:{props.comment}</p>
    </div>
  )
}

export default ReviewTile

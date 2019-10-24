import React from 'react'

const ReviewTileBody = props => {
  return(
    <div className="review-box row">
      <div className="small-12 columns errors">
        {props.errors}
      </div>
      <div className="small-9 columns">
        <p>{props.rating}/5: {props.comment} - score: {props.reviewScore}</p>
      </div>
      <div className="small-3 columns">
        <i className="fas fa-arrow-circle-up fa-lg" onClick={props.voteUp}/>
        <i className="fas fa-arrow-circle-down fa-lg" onClick={props.voteDown}/>
      </div>
      <div className="columns small-12 text-center">
        {props.buttons}
      </div>
      <hr />
    </div>
  )
}

export default ReviewTileBody

import React from 'react'

const ReviewTileBody = props => {
  return(
    <div className="review-box row">
      <div className="small-12 columns errors">
        {props.errors}
      </div>
      <div className="small-10 columns review-text">
        <p>{props.rating}/5: {props.comment}</p>
      </div>
      <div className="small-2 columns arrows">
        <i className="fas fa-arrow-circle-up fa-lg" onClick={props.voteUp}/>
        <i className="fas fa-arrow-circle-down fa-lg" onClick={props.voteDown}/>
        <br/>
        <div className="score">Score: {props.reviewScore}</div>
      </div>
      <div className="columns small-12 text-center">
        {props.buttons}
      </div>
      <hr />
    </div>
  )
}

export default ReviewTileBody

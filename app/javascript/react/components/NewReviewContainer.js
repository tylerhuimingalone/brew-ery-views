import React, { useState } from 'react'
import { Redirect } from 'react-router-dom'
import _ from 'lodash'

const NewReviewContainer = props => {
  const [errors, setErrors] = useState({})
  const [newReview, setNewReview] = useState = ({
    rating: nil,
    comment: ""
  })

  const validForSubmission = () => {
    let submitErrors = {
      const requiredFields = ["rating"]
      }
    }
  }
 }


export default NewReviewContainer

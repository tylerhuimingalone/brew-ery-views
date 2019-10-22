import React, { useState, useEffect } from 'react'

const UsersIndexContainer = props => {
  const [users, setUsers]
  useEffect(() => {fetch(`/api/v1/users`)
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
  },[])


  const UserTiles = users.map((user) => {
    //MAKE TILE HERE
  })

  return (
    {UserTiles}
  )
}

export default UsersIndexContainer

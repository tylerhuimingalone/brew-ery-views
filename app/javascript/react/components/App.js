import React from 'react'
import { Route, Switch, BrowserRouter } from "react-router-dom"

import BreweryIndexContainer from './BreweryIndexContainer'

export const App = (props) => {
  return (
    <BrowserRouter>
      <Switch>
        <Route exact path="/" component={BreweryIndexContainer} />
        <Route exact path="/breweries" component={BreweryIndexContainer} />
      </Switch>
    </BrowserRouter>
  )
}

export default App

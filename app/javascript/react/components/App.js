import React from 'react'
import { Route, Switch, BrowserRouter } from "react-router-dom"

import BreweryIndexContainer from './BreweryIndexContainer'
import NewBreweryContainer from './NewBreweryContainer'
import BreweryShowContainer from './BreweryShowContainer'

export const App = (props) => {
  return (
    <BrowserRouter>
      <Switch>
        <Route exact path="/" component={BreweryIndexContainer} />
        <Route exact path="/breweries" component={BreweryIndexContainer} />
        <Route exact path="/breweries/new" component={NewBreweryContainer} />
        <Route exact path="/breweries/:id" component={BreweryShowContainer} />
      </Switch>
    </BrowserRouter>
  )
}

export default App

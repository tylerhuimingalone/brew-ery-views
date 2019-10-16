import React from "react"
import Enzyme, { mount } from "enzyme"
import Adapter from "enzyme-adapter-react-16"
Enzyme.configure({ adapter: new Adapter() })

import BreweryTile from "./BreweryTile"

describe("BreweryTile", () => {
  let wrapper

  beforeEach(() => {
    wrapper = mount(
      <BreweryTile
        key="3"
        id="3"
        name="Night Shift Brewing"
        city="Boston"
        state="MA"
      />
    )
  })

  it("renders a h4 tag with the brewery name", () => {
    expect(wrapper.find("h4").text()).toBe("Night Shift Brewing")
  })

  it("renders an h5 tag with the brewery city and state", () => {
    expect(wrapper.find("h5").text()).toBe("Boston, MA")
  })
})

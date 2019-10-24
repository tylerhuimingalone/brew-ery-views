import React from "react"
import Enzyme, { mount } from "enzyme"

import BeerTile from "./BeerTile"

describe("BeerTile", () => {
  let wrapper

  beforeEach(() => {
    wrapper = mount(
      <BeerTile
        key="1"
        id="1"
        name="A Beer"
        type="IPA"
        desription="Pretty ok"
      />
    )
  })

  it("renders a p tag with the name and type", () => {
    expect(wrapper.find("p").text()).toBe("A BeerType: IPA")
  })
})

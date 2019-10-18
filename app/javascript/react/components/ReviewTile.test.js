import React from "react"
import Enzyme, { mount } from "enzyme"

import ReviewTile from "./ReviewTile"

describe("ReviewTile", () => {
  let wrapper

  beforeEach(() => {
    wrapper = mount(
      <ReviewTile
        key="1"
        id="1"
        rating="3"
        comment="This place was pretty good."
      />
    )
  })

  it("renders a p tag with the rating and optional comment", () => {
    expect(wrapper.find("p").text()).toBe("3:This place was pretty good.")
  })
})

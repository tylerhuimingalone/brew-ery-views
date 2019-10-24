import React from "react"
import Enzyme, { mount } from "enzyme"

import ReviewTileBody from "./ReviewTileBody"

describe("ReviewTileBody", () => {
  let wrapper, onClickMock, onClickMockTwo

  beforeEach(() => {
    onClickMock = jest.fn()
    onClickMockTwo = jest.fn()
    wrapper = mount(
      <ReviewTileBody
        key="1"
        id="1"
        rating="3"
        comment="This place was pretty good."
        reviewScore="2"
        voteUp={onClickMock}
        voteDown={onClickMockTwo}
      />
    )
  })

  it("renders a p tag with the rating and optional comment", () => {
    expect(wrapper.find("p").text()).toBe("3/5: This place was pretty good. - score: 2")
  })

  it('upVote should invoke the onClick function from props when clicked', () => {
    let upArrow = wrapper.find(".fa-arrow-circle-up")
    upArrow.simulate('click');
    expect(onClickMock).toHaveBeenCalled()
  })

  it('downVote should invoke the onClick function from props when clicked', () => {
    let downArrow = wrapper.find(".fa-arrow-circle-down")
    downArrow.simulate('click');
    expect(onClickMockTwo).toHaveBeenCalled()
  })
})

import React from "react"
import Enzyme, { mount } from "enzyme"

import ReviewTileBody from "./ReviewTileBody"

describe("ReviewTileBody", () => {
  let wrapper, onClickMock, onClickMockTwo, onClickMockThree, onClickMockFour

  beforeEach(() => {
    onClickMock = jest.fn()
    onClickMockTwo = jest.fn()
    onClickMockThree = jest.fn()
    onClickMockFour = jest.fn()
    wrapper = mount(
      <ReviewTileBody
        rating="3"
        comment="This place was pretty good."
        reviewScore="2"
        errors="You must be logged in to vote."
        buttons={
          <div className="buttons">
            <button className="button edit" onClick={onClickMockThree}>Edit</button>
            <button className="button delete" onClick={onClickMockFour}>Delete</button>
          </div>
        }
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

  it('downVote should invoke the onClick function from props when clicked', () => {
    let editButton = wrapper.find(".edit")
    editButton.simulate('click');
    expect(onClickMockThree).toHaveBeenCalled()
  })

  it('downVote should invoke the onClick function from props when clicked', () => {
    let deleteButton = wrapper.find(".delete")
    deleteButton.simulate('click');
    expect(onClickMockFour).toHaveBeenCalled()
  })

  it('it should render errors passed from props.', () => {
    expect(wrapper.find(".errors").text()).toBe("You must be logged in to vote.")
  })
})

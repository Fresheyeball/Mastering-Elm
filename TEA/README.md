# The Elm Architecture (TEA)

TEA is made of *upto* 5 parts.

- ### Msg
  The type of messages that will flow through our system.
- ### Model
  The type of our one and only source of truth.
- ### Init
  The initial `Model` for the start of our application.
- ### Update
  A function that steps the application forward.
- ### View
  A function that translates the `Model` to markup.

In this section, we will explore this idea with some simple exercises.

## The EMF

In order to detect paranormal activity, we will need to monitor the Electromagnetic field of the room. Let's get that setup now.

The goal of this exercise is just to get you familiar with TEA. Your job is to play with the lights on the EMF reader. Make them do something cool! Make them do something spooky! Have fun playing with `Time` in TEA. The completed example is just some funkiness.

# Animations in Design System

The project presents a sample way of integrating animations into a 
[design system](https://en.wikipedia.org/wiki/Design_system) for iOS developers.

## Project setup

A sample fake library containing a design system is located in `DesignSystem` folder.
This project does not contain any dependencies and does not require additional setup.
The project was created and tested with Xcode 12.5.1.

## Vision

This solution is focused on implementing animations as components of a design system, i.e.
as something to be constantly reused to introduce consistency into your app. In this sense,
**animations** are a part of a design system **the same way views are**.

We propose adding 2 new kinds of components into a Design System:
* **Atomic animations** — very simple animations operating on a single view with very 
limited configuration (via parameters such as duration). These offer preset behavior, i.e. one should not change **what** an atomic animation does, `ColorAnimation` only changes `backgroundColor`,
and has unmodifiable timing curve.
* **Interactions** — a composition of animations which are triggered upon a predefined event. Example: `ControlHighlightInteraction` is used for adding highlight animations for any 
`UIControl` in a certain way.

The APIs were designed with a big team in mind, where not every designer and developer is at
all keen on implementing UI Animations or is proficient enough to make them. This sample 
project offers a tool to greatly simplify system APIs such as `UIViewPropertyAnimator` and
to reuse a given set of atomic animations everywhere in an app.
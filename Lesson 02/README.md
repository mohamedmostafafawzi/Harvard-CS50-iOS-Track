# Harvard-CS50-iOS-Track
This is CS50 iOS Track, Harvard University's introduction to iOS Development.

## [Lesson 02](https://youtu.be/SSjrnG4v90U)

To write our iOS app, we’ll be using a framework called UIKit, made by Apple, with lots of functions to create UI, or user interface, elements on the screen, like tables, images, and buttons.
We’ll follow the MVC pattern, or model-view-controller, where we have models, or code that handles storing our data; views that handle displaying data; and controller that contains our logic for bridging our model and our view. In iOS, they’re called view controllers, and decide what gets shown when.
[2:38] We take a look at table views, which shows a list of contents. Xcode allows us to have visual containers, or storyboards, with which we can create views and indicate how our app moves between them.
IBOutler and IBAction types will be used for connecting data to views. Segues will allow us to map actions in the app to changes to our views or data.
[4:35] We open Xcode again, and now we create a project with the “Single View App” template under the iOS tab. We don’t need Core Data, Unit Tests, or UI Tests yet, so we can leave them all unchecked.
We’ll build a simple Pokédex app, which will show us a list of Pokémon and more details. We have some generated files:
AppDelegate.swift, which we can think of as the main function for our app, which will decide what happens when the app is started or closed, but we probably won’t need to override any of the default behaviors.
ViewController.swift, which will contain the code for what our app does when a view for our app is loaded.
Main.storyboard, which shows a preview of an iPhone screen and what our view will look like.
Assets.xcassets is a directory into which we can put assets like images and sounds.
LaunchScreen.storyboard, the view that our app will show while it starts.
Info.plist, a generated configuration file with everything we need for now.
[12:25] We can start by opening our main storyboard, deleting the blank view controller we see, and adding a “Table View Controller” with the home button icon on the toolbar. We can drag it onto our storyboard, and we’ll also need to change our ViewController.swift file to match and connect to the controller.
We make sure that our view controller “Is Initial View Controller” in one of the panels on the right, and we can start by defining our model.
We’ll create a new Swift file and call it Pokemon.swift. Inside, we’ll declare a struct Pokemon with two fields, and in ViewController we can create an array of elements of the Pokemon type.
It turns out that we can override methods in our Table View, like numberOfSections, numberOfRowsInSection, and cellForRowAt to display our data in the table.
[20:50] In the storyboard view, we can find the tab for the Attributes inspector, and apply basic styles.
Finally, in cellForRowAt we get a reusable cell, set the text label, and return it for the table to display.
[29:20] We can also add a title bar to show where we are, by using the storyboard to place our table view inside a Navigation Controller. Now, our table view can have a title.
[31:30] We’ll add another view by searching for a regular View Controller and dragging it into our storyboard. We can add labels and use the UI to move and resize them.
[34:20] We’ll now need to make another Swift file for this controller, and call it PokemonViewController.swift. We’ll use an IBOutlet in order to connect labels to variables in our class. First, in our storyboard we need to set the view controller’s class to our new class, and use the UI to set each label to the right outlet.
[38:20] We’ll have our table view pass in the Pokemon to the PokemonViewController, and we can override the viewDidLoad function to set the value of the labels based on the Pokemon passed in.
We’ll need to go back to the storyboard and create a Segue for our table view to transition to the new view controller. We’ll pick “Show” as the Segue type, and set an identifier we can use from our view controller.
We’ll override prepare(for segue) and use the if let destination = segue.destination as? PokemonViewController syntax to make sure that the view we’re going to is a PokemonViewController. Then, we can get the right Pokemon for the row, and set it on the view directly.
[47:30] We can run our app and see the views as we expect now, and to format the number of the Pokemon we can use String(format: "#%03d", pokemon.number).

##
[Harvard CS50 - iOS Track](https://cs50.harvard.edu/x/2020/tracks/mobile/ios/)

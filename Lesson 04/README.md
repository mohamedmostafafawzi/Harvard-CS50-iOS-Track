# Harvard-CS50-iOS-Track
This is CS50 iOS Track, Harvard University's introduction to iOS Development.

## [Lesson 04](https://youtu.be/fr3s3H6TxRA)

We’ll make a different app this time, one that can apply filters to photos.
We’ll create a new Single View App project in Xcode, and add some basic components to our main storyboard. We’ll add:
a navigation controller so our app has a title
a Bar Item that looks like a button in the navigation bar, labeled “Choose Photo”
an Image View to show an image
buttons for each of the filters that we’ll want
[5:25] First, we want to be able to pick a photo and show it. We’ll need an IBAction to link to “Choose Photo”, an IBOutlet for the Image View, and connect both using the storyboard UI in Xcode by clicking and dragging.
[7:35] To show the user’s photo gallery for them to select a photo, we’ll use the UIImagePickerController class and make sure that our class will be the delegate, or the class that will be responding to the user selecting a photo in that controller class.
[9:55] To display the image picker, we’ll need to use the Navigation Controller to present it, and use the didFinish function that the ImagePickerController will call for us. By looking through some documentation or examples, we’ll need to get a UIImage from what’s passed in to the function, and set it on the Image View. We also need to dismiss the picker after a photo is selected.
[15:10] Now we can write some of the code to apply filters to the image after it’s been selected. We can look at the documentation for Core Image Filter from Apple, and notice that we have many built-in options like CISepiaTone.
[16:20] We’ll create another IBAction, connect it in the storyboard, and use the CIFilter class to create an object we can use to filter our image. We need to convert the classes of images we have with a little extra code to guard the types.
[22:30] We can save the original image so the filter doesn’t keep getting reapplied, and be careful to add a guard to make sure it exists before we try applying a filter.
[24:20] We’ll add a few more buttons for other filters, and create and connect IBActions for them too. Since we’re now repeating some of this code, we’ll factor the common lines out into a helper method. Now, all three of our filters work.

##
[Harvard CS50 - iOS Track](https://cs50.harvard.edu/x/2020/tracks/mobile/ios/)

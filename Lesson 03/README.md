# Harvard-CS50-iOS-Track
This is CS50 iOS Track, Harvard University's introduction to iOS Development.

## [Lesson 03](https://youtu.be/DfFQ9nManXo)

We can use an API, application programming interface, to load data from the internet in our app. An API is like a set of code that someone else has written, designed for you to use too.
In this case, we’ll be making requests to a website and getting data back in a format called JSON, JavaScript Object Notation.
An object in JSON might look like a dictionary of key-value pairs:
{
  "course": "cs50",
  "tracks": ["mobile", "web", "games"],
  "year": 2019,
}
The values can be a string, an array, or a number as we see here, or some other data types.
[2:12] We’ll use a new pattern in Swift called try, catch, where any exception, or error, can be “caught”:
do {
    let result = try something()
}
catch let error {
    print (error)
}
In this case, the something() function might cause an exception, so we want to try running it, and catch any error that does occur.
[3:15] A closure, or anonymous function, will also be helpful:
let reversed = names.sorted(by: {(
    s1: String,
    s2: String
) -> Bool in
    return s1 > s2
})
We pass in a closure to the sorted function on the names array, which is a function that takes in two strings and returns a Boolean, acting as a comparison function between them.
[5:22] We’ll also see a pattern called delegates, where we can attach event handlers, so a change to one object can “notify” another one to respond; the logic to handle a change is “delegated” to somewhere else.
[6:01] We’ll use https://pokeapi.co to get our data about Pokemon, in JSON format.
In Xcode, we’ll populate our array of pokemon in the viewDidLoad function of our ViewController.
We can read the documentation of the API and figure out the URL format we need to use. Then, we can use the URL and URlSession class in Swift to actually get the data.
[13:10] We’ll use a closure to handle the data (or error) we get back from our request, along with guards to make sure the types aren’t optional.
[15:18] We’ll also need a struct to represent the data we get back, like PokemonList. With the JSONDecoder class, we can decode the data into a struct we define. To make our struct decodable, we also have to specify it is codable (convertable to and from JSON), so we use struct PokemonList: Codable in our definition. We also need to wrap this decoding function with a try, catch, since we’re not guaranteed that the data we get back will successfully be decoded.
[19:05] We try to run our app, and see an error about a key not found. It turns out the API doesn’t return a number field, that’s required by our Pokemon struct.
[20:55] To display the data we get back, we can set our table’s data to the results of our decoded data, using the keyword self in a closure to be clear which variable we’re setting.
[22:50] And now that we’ve changed the data for the table, we have to tell the table to reload the view with self.tableView.reloadData(), but we actually have to ask the main thread (the foreground of the app) to reload the data, since our URL request is in a background thread.
[25:40] We can add a capitalize function to change the name of the Pokemon before we display it in our table.
[28:23] Let’s use the API in our second view, for each individual Pokemon. We can explore the API to see that a lot of information is returned. It turns out that one field, types, is an array with one or more type objects. We’ll create a struct to represent this data as a whole, PokemonData, and add the fields we want to decode, with PokemonTypeEntry and PokemonType structs as needed.
[32:20] Now we can make a second API call in our PokemonViewController, changing the URL based on the Pokemon passed in, decoding the data, and setting the values of the labels in the view. We also need to be careful to clear placeholder data in our labels, since we might not have values to set them to each time.

##
[Harvard CS50 - iOS Track](https://cs50.harvard.edu/x/2020/tracks/mobile/ios/)

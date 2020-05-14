# Harvard-CS50-iOS-Track
This is CS50 iOS Track, Harvard University's introduction to iOS Development.

## [Lesson 05](https://youtu.be/1l3u_a1TTmc)

SQLite is a simple SQL database where our Swift code can write queries and save data.
We’ll need queries like:
CREATE TABLE
INSERT INTO
SELECT ... FROM
UPDATE ... SET
[3:50] We’ll make a note-taking app as our example, and start by creating a Single View App in Xcode as before. We’ll want a Table View Controller to show a list of notes.
[6:20] Now let’s define our model with a struct Note, and show a list of those in our table by overriding the functions on our ViewController.
[10:00] We’ll define a new class, NoteManager, to work with the database. With SQLite, we can save and open our database like a file, so we’ll use the built-in FileManager to open or create a file called notes.sqlite3 in a function called connect.
[13:15] We need a variable of type OpaquePointer, which is just a pointer to our database file. This way, sqlite3_open can keep the same connection to the database.
[15:40] We’ll also create our table if it doesn’t exists, as we open the database file.
[17:20] To create a new note, we’ll have a create function that first tries to connect (in case we haven’t already) and then sqlite3_prepare_v2 to prepare a statement. We’ll then use sqlite3_step to run the next step of the statement, and sqlite3_finalize to finish executing it.
[22:00] We’ll have our create function also return the ID of the row we just created, in case we want to do something else with it right after.
[22:55] Next, we’ll write getAllNotes to return a list of the Notes we have saved, by preparing a SELECT statement. Since we want to run this query for each row we can get back, we’ll have to use a while loop to run each step of our statement until there are no more rows. Inside our loop, we’ll use sqlite3_column_int or sqlite3_column_text to get the values of each column from the last row from our statement, and build a result array of Notes to return.
[28:05] We’ll add a Bar Item button and link it to an action to create a new note. In our view controller, we’ll create a NoteManager. We’ll add a main reference in NoteManager to an instance of itself (a singleton, since there will ever be one of them that we need), and make sure that init is marked as private so we won’t have multiple NoteManagers.
[31:15] Now, our action can create a new note in the database, but we’ll need a new method to reload data from the database and refresh our table view.
[33:40] When we try to run our app, we couldn’t create the database, and it turns out we need to use documentDirectory as the directory for our database file. But after creating a note and stopping and starting our app again, we don’t see the note saved. We need to load the notes when the table view is loaded for the first time, too, not just when we add a new note.
[36:10] We also need a view to show and edit individual notes, so we’ll add a second View Controller and a segue from our table view controller to it. We’ll add a text view, and it turns out that our storyboard has little buttons that allow us to add constraints, or rules for where the text view can expand to, on the screen.
[39:20] Now we’ll need our model to save any changes to the note, so we’ll write a save method. We’ll prepare a statement with UPDATE, and to pass data into our query we’ll use ?s as placeholders, and bind data to it with sqlite3_bind_text or sqlite3_bind_int. This will help protect us from SQL injection attacks.
[43:40] In our table view controller, we’ll use prepare(for segue... to pass a selected Note to our note view controller. We’ll create an outlet for the text view (to display the contents for the note) and save the note automatically when the user leaves the view, by overriding viewWillDisappear. We’ll also need to reload the data in our table view after we come back to it, so we’ll override viewWillAppear in it.
[48:20] We don’t see our note being updated in the app after we change it, so we look at our note view controller. It turns out, that even though we save the Note correctly, we’re not updating that based on the text view. So we’ll set the struct’s contents to the text in the text view.

##
[Harvard CS50 - iOS Track](https://cs50.harvard.edu/x/2020/tracks/mobile/ios/)

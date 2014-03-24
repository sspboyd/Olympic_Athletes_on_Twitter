// [0] Twitter Acct, [1] Name, [2] Bio, [3] Profile Img URL, [4] Recent Img Post, [5] Day 1 Mentions, Day 2 Mentions...
// "@HeatherMoyse", "Heather Moyse", "2010 & 2014 Olympic Gold Medalist (bobsleigh); Canadian Nat'l Rugby player; Occupational therapist; Motivational & Keynote speaker; Ready for my next challenge.", https://pbs.twimg.com/profile_images/1283410829/_MGS7358.jpg, https://pbs.twimg.com/media/Bhkh4_eIIAAnOvJ.jpg, 9341, 20712, 18287, 15548, 23448, 19829, 19068, 13568, 3457, 8181, 14691, 22773, 5786, 8722, 2150, 21575

void setup() {
  size(1000, 700); // set the width and height of the canvas
  background(255); // set the background to white
  int margin = 50; // set a margin to be used around the edge of canvas


  ////////////////////////////////////
  // Step 1 - Acquire the Data
  ////////////////////////////////////
  String[] data = loadStrings("HeatherMoyse.txt"); // load the text file into a temporary variable called 'data'
  String[] twitterData; // Create an array to store the parsed data from the text file
  twitterData = split(data[0], TAB); // Lets use split to parse the data and put each piece of data into its own array bucket

  // Lets test it out and make sure everything's working. 
  // Try changing the number below to look at different variables in the array.
  println(twitterData[2]);
}
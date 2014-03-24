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


  ////////////////////////////////////
  // Step 2 - Draw the user images and posted photo to the canvas
  ////////////////////////////////////
  String twAvatarURL = twitterData[3]; // Get the URL for the twitter data array
  PImage twAvatar; // Create the image variable to hold the profile photo
  twAvatar = loadImage(twAvatarURL); // load the image into the variable
  image(twAvatar, margin, margin, 267, 200); // draw the image to the canvas

  String twImgPostURL = twitterData[4]; // Get the URL of the image posted to Twitter
  PImage twImgPost; // Create the image variable to hold the profile photo
  twImgPost = loadImage(twImgPostURL); // load the image into the variable
  image(twImgPost, 683, margin, 267, 200); // draw the image to the canvas


  ////////////////////////////////////
  // Step 3 - Draw the Twitter account name and bio to the canvas
  ////////////////////////////////////
  PFont unameF;   // Create the variable to be used for the user name
  unameF = createFont("Georgia", 24); // load the font into the variable 
  PFont bioF;     // Create the variable to be used for the bio copy
  bioF = createFont("Georgia", 14); // load the font into the variable 

  // Draw the Twitter Account and Bio text!
  textFont(unameF); // Select the font to be used for the username
  fill(0); // Set the font color
  String twitterName = twitterData[0]; // Grab the name from the twitter data array
  text(twitterName, 350, 75); // Print the User name to the canvas

  textFont(bioF); // Select the font to be used for the bio
  fill(0); // Set the font color
  String twBioCopy = twitterData[2]; // Get the Twitter bio copy
  text(twBioCopy, 350, 100, 300, 300); // Print the bio to the canvas
}
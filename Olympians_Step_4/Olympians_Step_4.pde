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


  ////////////////////////////////////
  // Step 4 - Draw the Bar Chart
  ////////////////////////////////////
  // Set the boundaries of the bar chart area
  float x1 = 100; // sets the left edge of the chart
  float x2 = 950; // sets the right edge of the chart
  float y1 = 350; // sets the top edge of the chart
  float y2 = 650; // sets the bottom edge of the chart

  // Now get the data...
  int[] mentions = new int[16]; // Create an array to hold the daily mention numbers
  for (int i = 0; i < 16; i++) { // Create a for loop to go through the 16 numbers
    mentions[i] = int(twitterData[i+5]); // place the twitter data into the new mentions array
  }

  // We will need to know the maximum number to figure out what the height of our chart should be
  int maxMentions = max(mentions); // returns the biggest number...

  // Time to draw the bar chart...
  for (int i = 0; i < mentions.length; i++) { // Create a for loop to go through each number
    float barX = map(i, 0, 15, x1, x2); // use the map function to set the x axis value
    float barY1 = map(mentions[i], 0 , maxMentions, y2, y1); // use the map function again to find the height of the bar chart
    float barY2 = y2; // the bottom of the bar is always the same (bottom of the chart)

    stroke(50); // Set color of the bar
    strokeWeight(3);
    line(barX, barY1, barX, barY2); // draw the bar!
    ellipse(barX, barY1, 5, 5); // bonus points, draw a circle at the top of the bar
  }

  // Draw the horizontal axis lines
  stroke(126); // set the axis line color
  strokeWeight(.5);
  line(x1, y2, x2, y2); // draw the bottom axis
  line(x1, y1, x2, y1); // draw the top axis
  // Draw the maximum and minimum numbers
  textFont(bioF); // lets re-use the Bio copy font here
  text("0", x1 - 20, y2); // draw the minimum number at the top left of the bar chart
  text(maxMentions, x1 - 40, y1); // draw the maximum number at the top left of the bar chart

  // Add a for the bar chart
  textFont(unameF); // lets reuse the username font here
  text("Twitter mentions per day during the Sochi Olympics", x1, y1-24); // draw the title above the bar chart!

  // Save the chart to a jpg and we're done!!
  save("output.jpg");
}
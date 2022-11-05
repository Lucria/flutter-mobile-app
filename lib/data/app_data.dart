import 'package:flutter/material.dart';

List<Chunk> post1Chunks = [
  Chunk(
      "Resting Heart Rate",
      "This is the number of times your heart beats in a minute when you’re not active and your heart isn’t having to work hard to pump blood through your body.",
      "https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/articles/health_tools/what_to_know_about_your_heart_rate_slideshow/1800ss_getty_rf_woman_reading_book.jpg?resize=652px:*&output-quality=75"),
  Chunk(
      "A Healthy Resting Heart Rate",
      "Most healthy adults should have a resting heart rate between 60 and 100 beats a minute. In general, the more physically fit  you are, the lower your heart rate will be. Athletes can have a normal resting heart rate in the 40s. A healthy one is a sign that your heart isn’t having to work too hard to circulate blood.",
      "https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/articles/health_tools/what_to_know_about_your_heart_rate_slideshow/1800ss_getty_rf_metronome_and_graphic.jpg?resize=652px:*&output-quality=75"),
  Chunk(
      "How to Lower It",
      "This can be as easy as simply relaxing -- sit down, have a glass of water, or just take a few deep breaths. A healthier lifestyle, including getting at least 30 minutes of exercise a day,  eating healthier, watching your weight, and cutting down alcohol, caffeine, and smoking can help, too. If that is not enough, you might try to find ways to better handle stress, like tai chi, meditation, or mindfulness.",
      "https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/articles/health_tools/what_to_know_about_your_heart_rate_slideshow/1800ss_getty_rf_man_drinking_glass_of_water_alt2.jpg?resize=652px:*&output-quality=75")
];

List<Post> posts = [
  Post(
      Colors.amberAccent,
      'Resting Heart Rate',
      1,
      "This is the number of times your heart beats in a minute when you’re not active and your heart isn’t having to work hard to pump blood through your body.",
      "https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/articles/health_tools/what_to_know_about_your_heart_rate_slideshow/1800ss_getty_rf_woman_reading_book.jpg?resize=652px:*&output-quality=75",
      post1Chunks),
  Post(
      Colors.blue,
      'Post 2',
      2,
      "asdf",
      "https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/articles/health_tools/what_to_know_about_your_heart_rate_slideshow/1800ss_getty_rf_woman_reading_book.jpg?resize=652px:*&output-quality=75",
      post1Chunks),
  Post(
      Colors.pinkAccent,
      'Post 3',
      3,
      "asdf",
      "https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/articles/health_tools/what_to_know_about_your_heart_rate_slideshow/1800ss_getty_rf_woman_reading_book.jpg?resize=652px:*&output-quality=75",
      post1Chunks),
];

class Chunk {
  final String text;
  final String title;
  final String imageLink;

  Chunk(this.title, this.text, this.imageLink);
}

class Post {
  final Color color;
  final String title;
  final List<Chunk> articleChunks;
  final String articlePreview;
  final String imageLink;
  final int id;

  Post(this.color, this.title, this.id, this.articlePreview, this.imageLink,
      this.articleChunks);
}

class User {
  static final users = [
    User(Colors.amberAccent, 1),
    User(Colors.blue, 2),
    User(Colors.pinkAccent, 3),
  ];
  final Color color;
  final int id;

  User(this.color, this.id);
}

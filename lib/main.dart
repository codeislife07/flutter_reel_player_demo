import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:reels_viewer/reels_viewer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reels Viewer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //create a list of reelmodels
  List<ReelModel> reelsList = [
    ReelModel(
        'https://assets.mixkit.co/videos/preview/mixkit-tree-with-yellow-flowers-1173-large.mp4',
        'Coding Is Life',
        likeCount: 2000,
        isLiked: true,
        musicName: 'In the name of Love',
        reelDescription: "Life is better when you're laughing.",
        profileUrl:
            'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
        commentList: [
          ReelCommentModel(
            comment: 'Nice...',
            userProfilePic:
                'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
            userName: 'Darshan',
            commentTime: DateTime.now(),
          ),
          ReelCommentModel(
            comment: 'Superr...',
            userProfilePic:
                'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
            userName: 'Darshan',
            commentTime: DateTime.now(),
          ),
          ReelCommentModel(
            comment: 'Great...',
            userProfilePic:
                'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
            userName: 'Darshan',
            commentTime: DateTime.now(),
          ),
        ]),
    ReelModel(
      'https://assets.mixkit.co/videos/preview/mixkit-father-and-his-little-daughter-eating-marshmallows-in-nature-39765-large.mp4',
      'Rahul',
      musicName: 'In the name of Love',
      reelDescription: "Life is better when you're laughing.",
      profileUrl:
          'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
    ),
    ReelModel(
      'https://assets.mixkit.co/videos/preview/mixkit-mother-with-her-little-daughter-eating-a-marshmallow-in-nature-39764-large.mp4',
      'Rahul',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    //now use ReelsVIewer
    return ReelsViewer(
      reelsList: reelsList,//pass the list of reel or video 
      appbarTitle: 'Instagram Reels',
      onShare: (url) {
        log('Shared reel url ==> $url');
      },
      onLike: (url) {
        log('Liked reel url ==> $url');
      },
      onFollow: () {
        log('======> Clicked on follow <======');
      },
      onComment: (comment) {
        log('Comment on reel ==> $comment');
      },
      onClickMoreBtn: () {
        log('======> Clicked on more option <======');
      },
      onClickBackArrow: () {
        log('======> Clicked on back arrow <======');
      },
      onIndexChanged: (index) {
        log('======> Current Index ======> $index <========');
        if ((reelsList.length - 1) == index) {
          log("Load more");
          //load more data from api
        }
      },
      showProgressIndicator: true,
      showVerifiedTick: true,
      showAppbar: false,
    );
  }
}

import "package:flutter/material.dart";

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({ super.key });

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback Page'),
      ),  
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.pushNamed(context, '/registerFirst');
          }, child: const Text('Next')),
      ),
    );
  }
}
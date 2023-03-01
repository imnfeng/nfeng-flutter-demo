import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class ChewieVideo extends StatefulWidget {
  const ChewieVideo({super.key});

  @override
  State<ChewieVideo> createState() => _ChewieVideoState();
}

class _ChewieVideoState extends State<ChewieVideo> {
  late ChewieController chewieController;
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController = VideoPlayerController.network(
        'https://vfx.mtime.cn/Video/2019/02/04/mp4/190204084208765161.mp4');

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2, // 配置视频的宽高比
      autoPlay: true,
      // looping: true,
      optionsBuilder: (context, defaultOptions) async {
        await showModalBottomSheet(
          context: context,
          builder: (context) {
            return SizedBox(
              height: 200,
              child: ListView(
                children: [
                  ListTile(
                    title: const Text("播放速度"),
                    onTap: () {
                      defaultOptions[0].onTap!();
                    },
                  ),
                  ListTile(
                    title: const Text("取消"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  //返回的时候需要销毁
  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('在线视频播放'),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 3 / 5,
          child: Chewie(
            controller: chewieController,
          ),
        ),
      ),
    );
  }
}

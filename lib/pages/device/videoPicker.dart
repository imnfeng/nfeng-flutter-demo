import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPickerPage extends StatefulWidget {
  const VideoPickerPage({super.key});

  @override
  State<VideoPickerPage> createState() => _VideoPickerPageState();
}

class _VideoPickerPageState extends State<VideoPickerPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _pickedFile;
  //配置加载视频
  late ChewieController chewieController;
  late VideoPlayerController videoPlayerController;

  _initVideo(fileDir) async {
    videoPlayerController = VideoPlayerController.network(fileDir);
    //初始化完成后才可以获取宽高比
    await videoPlayerController.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: videoPlayerController.value.aspectRatio, // 配置视频的宽高比
      autoPlay: true,
    );
  }

  @override
  void dispose() {
    super.dispose();
    try {
      videoPlayerController.dispose();
      chewieController.dispose();
    } catch (e) {
      print(e);
    }
  }

  //录制视频
  _pickerCameraVideo() async {
    XFile? pickedFile = await _picker.pickVideo(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      // print(pickedFile.path);
      // print(File(pickedFile.path));
      await _initVideo(pickedFile.path);
      setState(() {
        _pickedFile = pickedFile;
      });
    }
  }

  //相册选择视频
  _pickerGalleryVideo() async {
    XFile? pickedFile = await _picker.pickVideo(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      // 加载视频
      await _initVideo(File(pickedFile.path));
      // 上传视频
      _uploadFile(pickedFile.path);
      setState(() {
        _pickedFile = pickedFile;
      });
    }
  }

  //上传视频 需要压缩视频
  _uploadFile(videoDir) async {
    final formData = FormData.fromMap({
      'username': 'zhangsan',
      'age': 25,
      'date': DateTime.now().toIso8601String(),
      'file': await MultipartFile.fromFile(videoDir, filename: 'xxxx.mp4'),
      'files': [
        await MultipartFile.fromFile('./text1.txt', filename: 'text1.txt'),
        await MultipartFile.fromFile('./text2.txt', filename: 'text2.txt'),
      ]
    });
    // https://jd.itying.com/public/upload/orXDAXMHW9XsAxMKYZix-Lpu.mp4
    // https://jd.itying.com/public/upload/_ydOjlsD6o53L3r1GPL_av2z.mp4
    var response =
        await Dio().post('https://jd.itying.com/imgupload', data: formData);
    print(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            ElevatedButton(
              onPressed: _pickerCameraVideo,
              child: const Text("录制视频"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _pickerGalleryVideo,
              child: const Text("相册选择视频"),
            ),
            const SizedBox(
              height: 20,
            ),
            _pickedFile == null
                ? const Text("选择视频")
                : AspectRatio(
                    aspectRatio: videoPlayerController.value.aspectRatio,
                    child: Chewie(controller: chewieController),
                  ),
          ],
        ),
      ),
    );
  }
}

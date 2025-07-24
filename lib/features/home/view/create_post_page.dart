import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qolber_clean_arc/features/auth/data/models/sign_up_parameters.dart';
import 'package:qolber_clean_arc/features/home/domain/entities/post.dart';
import 'package:qolber_clean_arc/features/home/domain/repository/post_repo.dart';
import '../../../servise_locator.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {

  final homeBloc = sl<HomeBloc>();

  TextEditingController postTextController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  Uint8List? webImage;
  File? fileImage;

  UserModel? userEntity;

  @override
  void initState() async {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    userEntity = (await sl<PostRepo>().getUser()) as UserModel?;
    setState(() {});
  }

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true,
    );

    if (result != null) {
      final files = result.files.single;
      if (kIsWeb) {
        webImage = files.bytes;
      } else {
        fileImage = File(files.path!);
      }
    }
  }

  Future<void> _uploadPost() async {
    if (userEntity?.uid == null) {
      // Показываем ошибку или выходим
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User is not loaded yet or UID is missing')),
      );
      return;
    }

    final postText = postTextController.text;

    final newPost = Post(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: userEntity!.uid!,
      userName: userEntity!.name ?? "Unknown",
      price: double.tryParse(priceController.text) ?? 0.0,
      timestamp: DateTime.now(),
      postText: postText,
    );

    /// Пример добавления ивента в блок:
    homeBloc.add(HomeEventCreatePost(
         imagePath: fileImage,
        imageBytes: webImage,
        post: newPost
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Create Post'),
          leading: IconButton(onPressed: () {

          }, icon: Icon(Icons.arrow_back_ios))
      ),

      body: SingleChildScrollView(

        child: SafeArea(child: Padding(
          padding: EdgeInsets.all(20), child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Container(
              width: 300,
              height: 300,
              color: Colors.blue,
            )
          ],
        ),)),
      ),
    );
  }
}

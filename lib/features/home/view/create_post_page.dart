import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qolber_clean_arc/features/auth/data/models/sign_up_parameters.dart';
import 'package:qolber_clean_arc/features/home/domain/repository/post_repo.dart';
import '../../../servise_locator.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../domain/entities/post.dart';
import '../storage/domain/storage_repo.dart';

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
  void initState()  {
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
        fileImage = files.path! as File?;
      }
    }
  }

  Future<void> _uploadPost() async {

    final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
    String? imageUrl;

    final storage = sl<StorageRepo>();

    if (kIsWeb) {
      imageUrl = await storage.uploadPostImageWeb(webImage!, fileName);
    } else {
      imageUrl = await storage.uploadPostImageMob(fileImage!.path, fileName);
    }



    final newPost = Post(
      id: fileName,
      userId: userEntity!.uid.toString(),
      userName: userEntity!.name.toString(),
      imageUrl: imageUrl,
      timestamp: DateTime.now(),
      postText: postTextController.text,
      price: double.tryParse(priceController.text) ?? 0.0,
    );

    homeBloc.add(HomeEventCreatePost(
        post: newPost, imagePath: imageUrl, imageBytes: webImage));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Create Post'),
          leading:
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios))),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: _imagePreview(),
              ),
              SizedBox(height: 30,),
              Container(
                height: 60 ,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(196, 135, 198, .3)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(196, 135, 198, .3),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: TextField(
                  controller: postTextController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Information about food',
                    hintStyle: TextStyle(color: Colors.grey.shade700),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 50 ,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(196, 135, 198, .3)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(196, 135, 198, .3),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: priceController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Price charge',
                    hintStyle: TextStyle(color: Colors.grey.shade700),
                  ),
                ),
              ),
              SizedBox(height: 250,),
              MaterialButton(
                onPressed: () {
                  final text = postTextController.text;
                  final price = priceController.text;
                  if(text.isEmpty && price.isEmpty){
                    return;
                  }else{
                    _uploadPost();
                  }
                },
                color: Color.fromRGBO(49, 39, 79, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                height: 50,
                child: Center(
                  child: Text("Upload",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  Widget _imagePreview (){
    return GestureDetector(
      onTap: () => _pickImage(),
      child: Container(
        height: 280,
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(12),
          color:  Color.fromRGBO(49, 39, 79, 1),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.45),
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(0, 7),
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width * 0.65,

        child: Builder(builder: (context) {
        if (webImage != null){
          return Image.memory(webImage!,fit: BoxFit.cover);
        } if( fileImage != null){
          return Image.file(fileImage!,fit: BoxFit.cover);
        }else {
          return Image.asset('assets/images/upload_image.png');
        }
      }
        ,),
      ),
    );
  }
}

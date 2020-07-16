import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodieng/blocs/library/index.dart';
import 'package:foodieng/models/upload.dart';
import 'package:foodieng/screens/library.dart';
import 'package:foodieng/utils/ValidationMixin.dart';
import 'package:foodieng/utils/fadein.dart';
import 'package:foodieng/widgets/loading.dart';
import 'package:video_player/video_player.dart';

class UploadVideo extends StatefulWidget {
  final String userId;
  UploadVideo({@required this.userId});

  @override
  _UploadVideoState createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> with ValidationMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LibraryBloc _libraryBloc = LibraryBloc();
  //int _selectedCategory = 0;
  File file;
  VideoPlayerController controller;
  Duration duration;
  String filePath;
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  List<DropdownMenuItem<int>> categoryList = [];

  // void loadCategoryList() {
  //   categoryList = [];
  //   categoryList.add(new DropdownMenuItem(
  //     child: new Text('Select Category'),
  //     value: 0,
  //   ));
  //   categoryList.add(new DropdownMenuItem(
  //     child: new Text('Female'),
  //     value: 1,
  //   ));
  //   categoryList.add(new DropdownMenuItem(
  //     child: new Text('Other'),
  //     value: 2,
  //   ));
  // }
  _chooseFile() async {
    file = await FilePicker.getFile(
        allowedExtensions: ['MP4', 'WEBM', 'FLV'], type: FileType.custom);
    controller = VideoPlayerController.file(file)
      ..initialize().then((_) {
        duration = Duration(seconds: controller.value.duration.inSeconds);
        setState(() {
          filePath = file.uri.toFilePath();
        });
      });
    return file;
  }

  _addContent() async {
    var fileSize = await file.length();
    var maxSize = (20 * 1024 * 1024);
    if (fileSize > maxSize) {
    } else {
      if (_formKey.currentState.validate()) {
        final content = Upload(
            userId: this.widget.userId,
            description: _descriptionController.value.text,
            title: _titleController.value.text,
            file: file.uri.toFilePath(),
            category: "Recipe",
            duration: formatDuration(duration));
        _libraryBloc.add(CreateContent(content: content));
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //loadCategoryList();
    void showAlertDialog(BuildContext context) {
      Widget continueButton = FlatButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          onPressed: () => Navigator.pushAndRemoveUntil(context,
              FadeRoute(page: Library()), (route) => false), //logOut(),
          child: Text("Yes"));

      AlertDialog alert = AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text("Success"),
        content: Text("Content Successfully Added"),
        actions: <Widget>[continueButton],
      );

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    }

    return BlocProvider(
        create: (context) {
          return LibraryBloc();
        },
        child: BlocListener<LibraryBloc, LibraryState>(
            bloc: _libraryBloc,
            listener: (context, state) {
              if (state is ShowDialog) {
                showAlertDialog(context);
              }
              if (state is LibraryError) {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('${state.errorMessage}'),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 4),
                ));
              }
            },
            child: BlocBuilder<LibraryBloc, LibraryState>(
              bloc: _libraryBloc,
              builder: (context, state) => Container(
                height: MediaQuery.of(context).size.height / 1.2,
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Share Video (Maximum Size is 20MB)",
                              style: TextStyle(
                                  fontFamily: 'Gill Bold', fontSize: 16)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12.0, 8, 12, 8),
                          child: TextFormField(
                            controller: _titleController,
                            keyboardType: TextInputType.text,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Title cannot be empty";
                              }
                              return null;
                            },
                            decoration: InputDecoration(hintText: 'Title'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(12.0, 8, 12, 8),
                          child: TextFormField(
                            controller: _descriptionController,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Description cannot be empty";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration:
                                InputDecoration(hintText: 'Description'),
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.fromLTRB(12.0, 0, 12, 8),
                        //   child: DropdownButton(
                        //     hint: Text('Select Category'),
                        //     items: categoryList,
                        //     value: _selectedCategory,
                        //     onChanged: (value) => {
                        //       setState(() {
                        //         _selectedCategory = value;
                        //       })
                        //     },
                        //     isExpanded: true,
                        //   ),
                        // ),
                        Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => _chooseFile(),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(12.0, 8, 2, 8),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      "Choose File to upload",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Icon(FontAwesomeIcons.fileUpload,
                                          size: 25),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                filePath ?? 'No File Choosen',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(12.0, 16, 12, 8),
                          child: RaisedButton(
                            color: Color(0xff462618),
                            onPressed: (state is! LibraryLoading)
                                ? () => _addContent()
                                : null,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              'Upload',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        if (state is LibraryLoading)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 20,
                              child: LoadingWidget(),
                            ),
                          ),
                        if (state is LibraryError)
                          Padding(
                              padding: EdgeInsets.all(8),
                              child: Text('${state.errorMessage}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.red)))
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}

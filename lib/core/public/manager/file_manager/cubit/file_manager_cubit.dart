import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:meta/meta.dart';

part 'file_manager_state.dart';

class FileManagerCubit extends Cubit<FileManagerState> {
   File?  file;
  FileManagerCubit() : super(FileManagerInitial());

  Future<void> pickFile()async{
    FilePickerResult ? filePicker = await FilePicker.platform.pickFiles();
    log(filePicker.toString());
    if(filePicker != null){
      file = File(filePicker.files.single.path??"");
      log(file!.path.toString());
      emit(FileManagerSuccess());

    }else
       {
         emit(FileManagerFailed(message: "failed pick file !"));
       }
  }
}

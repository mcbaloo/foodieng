import 'dart:async';
import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'package:foodieng/blocs/library/index.dart';
import 'package:foodieng/utils/login_util.dart';
import 'package:foodieng/utils/vidoesutil.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  UserRepository repository = UserRepository();
  VideoUtils videoUtils = VideoUtils();
  @override
  LibraryState get initialState => UnLibraryState();

  @override
  Stream<LibraryState> mapEventToState(
    LibraryEvent event,
  ) async* {
    try {
      if (event is LogOut) {
        await this.repository.deleteToken();
      }
      if (event is InitialLibraryEvent) {
        var isLoggedIn = await this.repository.getDetails();
        var recent = await this.videoUtils.getRecentVideos();
        if (isLoggedIn.firstName != null) {
          yield InLibraryState(video: recent, user: isLoggedIn);
        } else {
          yield LibraryGuest();
        }
      }

      if (event is CreateContent) {
        try {
          yield LibraryLoading();
          var content = await this.videoUtils.uploadVideo(event.content);
          if (content.title != null) {
            yield ShowDialog();
          } else {
            yield LibraryError(
                errorMessage: 'Error Occured while processing your request');
          }
        } catch (_) {
          yield LibraryError(errorMessage: 'Error Occured');
        }
      }

      if (event is LoadUserContent) {
        try {
          yield LibraryLoading();
          var contents = await this.videoUtils.getUserVideos(event.userId);
          yield UserContent(videos: contents);
        } catch (_) {
          yield LibraryError(errorMessage: 'Error Occured');
        }
      }

      if (event is DeleteUserContent) {
        try {
          yield LibraryLoading();
          var status = await this
              .videoUtils
              .deletUserContent(event.userId, event.contentId);
          yield DeleteStatus(message: status);
        } catch (_) {
          yield LibraryError(errorMessage: 'Error Occured');
        }
      }
    } catch (_, stackTrace) {
      yield LibraryError(errorMessage: 'Error Occured');
    }
  }
}

import 'package:toktik/domain/datasource/video_posts_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_post_repository.dart';

class VideoPostsRepository implements VideoPostRepository {

final VideoPostDataSource videoPostDataSource;

  VideoPostsRepository(this.videoPostDataSource);

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String user) {
    // TODO: implement getFavoriteVideosByUser
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    // TODO: implement getTrendingVideosByPage
    throw UnimplementedError();
  }
}

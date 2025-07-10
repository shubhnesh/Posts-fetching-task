import 'package:get/get.dart';
import 'package:task/api_service.dart';
import 'package:task/post_model.dart';

class PostController extends GetxController {
  var posts = <PostModel>[].obs;
  var isLoading = true.obs;
  var error = "".obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  void fetchPosts() async {
    try {
      isLoading.value = true;
      error.value = "";
      var result = await ApiService.fetchPosts();
      posts.assignAll(result);
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void moveToTop(int index) {
    final item = posts[index];
    posts.removeAt(index);
    posts.insert(0, item);
  }
}

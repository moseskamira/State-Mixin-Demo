import 'package:custom_loader_state_mixin/constants/app_environment.dart';
import 'package:get/get.dart';
import 'apis.dart';

class ApiProvider extends GetConnect {
  ApiProvider() {
    httpClient.baseUrl = AppEnvironment.returnBaseUrl();
    httpClient.defaultContentType = 'application/json';
  }

  Future<dynamic> getMostPopularTvShow(String page) async {
    try {
      final response = await get('${Apis.mostPopularShows}?page=$page');
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return response.body;
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}

import 'package:get/get.dart';
import '../../data/model/home_slider_model.dart';
import '../../data/services/network_caller.dart';

class HomeSliderController extends GetxController {

  bool _getHomeSliderControllerIsLoading = false;
  bool get getCarouselSliderControllerIsLoading => _getHomeSliderControllerIsLoading;

  HomeSliderModel _homeSliderModel = HomeSliderModel();
  HomeSliderModel get homeSliderModel => _homeSliderModel;

  Future<bool> getCarouselSlider() async {
    _getHomeSliderControllerIsLoading = true;
    update();
    final response = await NetworkCaller.getRequest(url: "/ListProductSlider");
    _getHomeSliderControllerIsLoading = false;
    if (response.isSuccess) {
      _homeSliderModel = HomeSliderModel.fromJson(response.responseBody);

      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/features/home/data/data_sources/data_sources.dart';
import 'package:e_commerce/features/home/data/repositories/home_data_repo.dart';
import 'package:e_commerce/features/home/domain/repositories/home_domain_repo.dart';
import 'package:e_commerce/features/home/domain/use_cases/get_brands_use_case.dart';
import 'package:e_commerce/features/home/domain/use_cases/get_categories_use_case.dart';
import 'package:e_commerce/features/home/domain/use_cases/get_products_use_case.dart';
import 'package:e_commerce/features/home/presentation/manager/states.dart';
import 'package:e_commerce/features/home/presentation/pages/tabs/category_tab.dart';
import 'package:e_commerce/features/home/presentation/pages/tabs/fav_tab.dart';
import 'package:e_commerce/features/home/presentation/pages/tabs/profile_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/CategoriesEntity.dart';
import '../../domain/entities/ProductEntity.dart';
import '../pages/tabs/home_tab.dart';

class HomeCubit extends Cubit<HomeStates>{

  HomeDataSources homeDataSources;
  late  HomeDomainRepo homeDomainRepo;
  HomeCubit(this.homeDataSources):super(HomeInitState()){
     homeDomainRepo= HomeDataRepo(homeDataSources);
  }

  static HomeCubit get(context) => BlocProvider.of(context);

  int bottomNavIndex=0;
  List<Widget>tabs= [HomeTab(),CategoryTab(),FavTab(),ProfileTab()];

  List<String>sliders=[
    AppImages.slider1,
    AppImages.slider2,
    AppImages.slider3

  ];

  List<DataEntity> categories=[];
  List<DataEntity> brands=[];
  List<ProductDataEntity> products = [];



  void changeBottomNav(int index){
    emit(HomeInitState());
    bottomNavIndex = index;
    emit(ChangeBottomNavBar());
  }


  getBrands()async {

    emit(HomeLoadingState());
    GetBrandsUseCase getBrandsUseCase =GetBrandsUseCase(homeDomainRepo);
    var result = await getBrandsUseCase.call();
    result.fold((l) => {
      emit(HomeGetBrandsErrorState(l))
    }, (r)  {
      brands = r.data??[];
      emit(HomeGetBrandsSuccessState(r));
        });

  }
  getProducts()async {

    emit(HomeLoadingState());
    GetProductsUseCase getProductsUseCase =GetProductsUseCase(homeDomainRepo);
    var result = await getProductsUseCase.call();
    result.fold((l) => {
      emit(HomeGetProductsErrorState(l))
    }, (r)  {
      products = r.data??[];
      emit(HomeGetProductsSuccessState(r));
    });

  }

  getCategories() async{
    emit(HomeLoadingState());
    GetCategoriesUseCase getCategoriesUseCase=
        GetCategoriesUseCase(homeDomainRepo);
    var result = await getCategoriesUseCase.call();
    result.fold((l) => {
    emit(HomeGetCategoriesErrorState(l))
    }, (r)  {
      categories = r.data??[];
      emit(HomeGetCategoriesSuccessState(r));
    });

  }

}
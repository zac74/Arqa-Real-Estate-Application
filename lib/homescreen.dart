import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gam3a/component/components.dart';
import 'package:gam3a/profile/mytheme.dart';
import 'package:gam3a/search/SearchScreen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RealEstateCubit,RealEstateStates>(
      listener: (context , state){},
      builder: (context , state){

        var cubit=RealEstateCubit.get(context);

        return Scaffold(
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar:Padding(
            padding: const EdgeInsets.all(7.0),
        child: Container(
        decoration: BoxDecoration(
        color: MyTheme.blueBorder,
        borderRadius: BorderRadius.circular(12),
        ),
          child:SalomonBottomBar(
            unselectedItemColor: Colors.white,
            onTap:(index)
            {
              cubit.ChangeBottom(index);
            },
            currentIndex: cubit.currentIndex,
            items: [
              /// Home
              SalomonBottomBarItem(
                icon:  Icon(Icons.home),
                title:  Text("Home"),
                selectedColor: Colors.white,
              ),

              /// Likes
              SalomonBottomBarItem(
                icon:  Icon(Icons.favorite_border),
                title:  Text("Favorites"),
                selectedColor: Colors.white,
              ),


              /// ADD Property
              SalomonBottomBarItem(
                icon: const Icon(Icons.add),
                title: const Text("Add"),
                selectedColor: Colors.white,
              ),

              /// Profile
              SalomonBottomBarItem(
                icon: const Icon(Icons.person),
                title: const Text("Profile"),
                selectedColor: Colors.white,
              ),



            ],
        ),
        ),
        ),
        );
      },
    );

  }
}



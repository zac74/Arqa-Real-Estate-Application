
abstract class RealEstateLoginStates {}

class RealEstateLoginInitialState extends RealEstateLoginStates{}

class RealEstateLoginLoadingState extends RealEstateLoginStates{}

class RealEstateLoginSuccessState extends RealEstateLoginStates{
   final String uId;
   final String? currentemail;

  RealEstateLoginSuccessState(this.uId,this.currentemail);
}

class RealEstateLoginErrorState extends RealEstateLoginStates
{
  final String error;
  RealEstateLoginErrorState(this.error);
}
class RealEstateChangePassWordVisibilityState extends RealEstateLoginStates{}

import 'package:flutter/material.dart'; // importing material.dart
import 'package:go_moon/widgets/custom_dropdown_button.dart'; 

class HomePage extends StatelessWidget {
  late double _deviceHeight, _deviceWidth; // late refers whether the fields can be null or not null

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {   // BuildContext is a handle to the location of a widget in the widget tree.

    _deviceHeight = MediaQuery.of( context).size.height; // assigning height to the variable
    _deviceWidth = MediaQuery.of(context).size.width; // assigning width to the variable

    return Scaffold(
      body: SafeArea(        // It is used to avoid the devices blind spot like notch, punch holes, etc.
        child: Container(
          height: _deviceHeight,
          width: _deviceWidth,
          padding: EdgeInsets.symmetric(
            horizontal: _deviceWidth * 0.05), //  providing 5% of device's width as padding
          child: Stack(
              children: [
                  Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // This aligns the widgets to the top and bottom with space in between
                        mainAxisSize: MainAxisSize.max, // It occupies the maximum space of the column
                        crossAxisAlignment: CrossAxisAlignment.start, // It aligns the widget to the center of the horizontal plane
                        children: [
                          _pageTitle(),
                          _bookRideWidget()        
                        ],
                  ),
                  Align(
                     alignment: Alignment.centerRight,
                     child: _astroImageWidget(),
                  )
              ],
          )
        ),
      ),
    );
  }

  Widget _pageTitle() {   // Text widget func()
    return const Text(
      "#GoMoon",
      style: TextStyle(
        color: Colors.white,
        fontSize: 80,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget _astroImageWidget() {   // Widget is a function with the name _astroImageWidget and _ represents its private function
    return Container(
      height: _deviceHeight * 0.50,
      width: _deviceWidth * 0.65,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/astro_moon.png"),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _bookRideWidget(){
    return Container(
        height: _deviceHeight * 0.25,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                _destinationDropDownWidget(),
                _travelersInformationWidget(),
                _rideButton()
            ],
        ),
    );
  }

  Widget _destinationDropDownWidget() {
    return CustomDropdownButton(         // calling the custom made drop down button class
      items: ["Buzz Dome", "Skywalker Station","Leia Watchtower"],
      width: _deviceWidth,
    );
  }

  
  Widget _travelersInformationWidget(){
    return Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        CustomDropdownButton(         // calling the custom made drop down button class
            items: ["1","2","3","4"], 
            width: _deviceWidth * 0.45
        ),
        CustomDropdownButton(         // calling the custom made drop down button class
            items: ["Economy","First","Business","Private"], 
            width: _deviceWidth * 0.40
        ),
      ],
    );
  }

  Widget _rideButton(){ // Adding Button widget to the UI
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      margin: EdgeInsets.only(bottom: _deviceHeight*0.01),
      width: _deviceWidth,  
      child:MaterialButton(
        onPressed: (){},  // Empty anonymous func means it does nothing
        child: Text("Book Ride!",
               style: TextStyle( color: Colors.black),
               )
      )

    );
  }


}

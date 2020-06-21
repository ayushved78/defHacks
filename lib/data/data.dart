
import 'package:flutter/material.dart';


class SliderModel{

  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath,this.title,this.desc});

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setDesc(String getDesc){
    desc = getDesc;
  }

  String getImageAssetPath(){
    return imageAssetPath;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }

}


List<SliderModel> getSlides(){

  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc("All COVID related updates in one click");
  sliderModel.setTitle("COVID19-INDIA");
  sliderModel.setImageAssetPath("assets/image3.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc("Healthcare worker requests and FAQ\'s");
  sliderModel.setTitle("Healthcare");
  sliderModel.setImageAssetPath("assets/image1.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc("Data and App  security deatils");
  sliderModel.setTitle("Secure");
  sliderModel.setImageAssetPath("assets/image2.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
//
//  LFRescueViewController.swift
//  huiyangche
//
//  Created by 你的名字 on 2018/9/1.
//  Copyright © 2018年 com.njyl. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class LBMapLocationViewController: UIViewController {

    var locationManager:CLLocationManager!
    
    lazy var geoCoder: CLGeocoder = {
        return CLGeocoder()
    }()

    var showLocAry = NSArray()
    
    lazy var mapView: MKMapView = {
        
       // let mapView = MKMapView(frame: UIScreen.main.bounds)
        let mapView = MKMapView()
        mapView.frame = CGRect(x: 0, y: 0, width: LXSize.ScreenSize_Width(), height: LXSize.ScreenSize_Height())
        //用户位置追踪(用户位置追踪用于标记用户当前位置，此时会调用定位服务)
        
        mapView.userTrackingMode = .follow
        
        //地图的显示风格，此处设置使用标准地图
        
        mapView.mapType = .standard
        
        //地图是否可滚动，默认为true
        
        mapView.isScrollEnabled = true
        
        //地图是否缩放，默认为true
        
        mapView.isZoomEnabled = true
        
        //是否显示用户当前位置 ios8之后才有，默认为false
        
        mapView.showsUserLocation = true
        
        //为MKMapView设置delegate
        
        mapView.delegate = self
        
        return mapView
        
    }()
    
    var userLatitude : CLLocationDegrees?
    var userLongitude : CLLocationDegrees?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.getWithRed(withRed: 242, green: 244, blue: 248)
        
        requestLocation()
//        //设置地图显示的范围，地图显示范围越小，细节越清楚
//        let span = MKCoordinateSpan(latitudeDelta:0.225, longitudeDelta:0.225)
//        //创建MKCoordinateRegion对象，该对象代表了地图的显示中心和显示范围。
//        let region = MKCoordinateRegion(center: CLLocationCoordinate2D.init(latitude: self.userLatitude!, longitude: self.userLongitude!), span: span)
//        //设置当前地图的显示中心和显示范围
//        self.mapView.setRegion(region, animated:true)
        view.addSubview(self.mapView)
        
        let backItem = UIButton(type: .custom)
        var lbheigh:CGFloat = 35
        if LXSize.LBStatusBar_Height() > 20{
            lbheigh = 45
        }
        backItem.frame = CGRect(x: 25, y: lbheigh, width: 25 * LXSize.SCREEN_RATE(), height: 25 * LXSize.SCREEN_RATE())
        backItem.setBackgroundImage(UIImage.init(named: "lbbackAlpha"), for: .normal)
        backItem.layer.cornerRadius = 11 * LXSize.SCREEN_RATE()
        backItem.backgroundColor = UIColor.white
        backItem.addTarget(self, action: #selector(lbbackItemAction), for: .touchUpInside)
        self.view.addSubview(backItem)
        
        let rightCall = UIButton(type: .custom)
        rightCall.frame = CGRect(x: LXSize.ScreenSize_Width() - 50 * LXSize.SCREEN_RATE(), y: lbheigh, width: 30 * LXSize.SCREEN_RATE(), height: 30 * LXSize.SCREEN_RATE())
        rightCall.setBackgroundImage(UIImage.init(named: "LBNavgationIcon"), for: .normal)
        rightCall.layer.cornerRadius = 15 * LXSize.SCREEN_RATE()
        rightCall.layer.shadowColor = UIColor.black.cgColor
        rightCall.layer.shadowOpacity = 1
        //zero表示不偏移
        rightCall.layer.shadowRadius = 5
        rightCall.layer.shadowOffset = CGSize.init(width: 4, height: 4)
        rightCall.backgroundColor = UIColor.white
        rightCall.addTarget(self, action: #selector(lbNavigationAction), for: .touchUpInside)
        self.view.addSubview(rightCall)
        
        let rightCall1 = UIButton(type: .custom)
        rightCall1.frame = CGRect(x: LXSize.ScreenSize_Width() - 90 * LXSize.SCREEN_RATE(), y: lbheigh, width: 25 * LXSize.SCREEN_RATE(), height: 25 * LXSize.SCREEN_RATE())
        rightCall1.setBackgroundImage(UIImage.init(named: "LBCallIcon.jpg"), for: .normal)
        rightCall1.layer.cornerRadius = 11 * LXSize.SCREEN_RATE()
        rightCall1.backgroundColor = UIColor.white
        rightCall1.addTarget(self, action: #selector(phoneAction), for: .touchUpInside)
//        self.view.addSubview(rightCall1)
        
        for i in self.showLocAry{
            let dic = i as! NSDictionary
            let tit = dic["name"] as! String
            let subTit = dic["description"] as! String
            let lat = dic["lat"] as! Double
            let lng = dic["lng"] as! Double
            self.addAnnotation(tit, subTitle: subTit, cllo: CLLocationCoordinate2D(latitude: lat, longitude: lng))
        }
    }
    
    @objc func lbbackItemAction(){
        self.navigationController?.popViewController(animated: true)
    }

    func addAnnotation(_ locationStr : String,subTitle:String,cllo:CLLocationCoordinate2D){

        // 创建一个大头针对象
        let objectAnnotation = MKPointAnnotation()
        // 设置大头针的显示位置
        objectAnnotation.coordinate = CLLocation(latitude: cllo.latitude,
            longitude: cllo.longitude).coordinate
        // 设置点击大头针之后显示的标题
        objectAnnotation.title = locationStr
        objectAnnotation.subtitle = subTitle
        self.mapView.addAnnotation(objectAnnotation)
        
        //设置地图显示的范围，地图显示范围越小，细节越清楚
        
        let span = MKCoordinateSpan(latitudeDelta:0.125, longitudeDelta:0.125)
        
        //创建MKCoordinateRegion对象，该对象代表了地图的显示中心和显示范围。
        
        let region = MKCoordinateRegion(center: CLLocationCoordinate2DMake(cllo.latitude, cllo.longitude), span: span)
        
        //设置当前地图的显示中心和显示范围
        
        self.mapView.setRegion(region, animated:true)

    }
    
    func requestLocation(){
        
        self.locationManager = CLLocationManager()
        
        if CLLocationManager.locationServicesEnabled(){//判断定位服务是否开启
            
            if#available(iOS 8.0, *) {//#available用在条件语句代码块中，判断不同的平台下，做不同的逻辑处理.这里表示iOS 8及其以上系统运行
                
                if self.locationManager.responds(to: #selector(CLLocationManager.requestAlwaysAuthorization)) || self.locationManager.responds(to: #selector(CLLocationManager.requestWhenInUseAuthorization)){
                    if(Bundle.main.object(forInfoDictionaryKey: "NSLocationAlwaysUsageDescription") != nil){
                        print("NSLocationAlwaysUsageDescription")
                        self.locationManager.requestAlwaysAuthorization()
                        
                    }else if (Bundle.main.object(forInfoDictionaryKey: "NSLocationWhenInUseUsageDescription") != nil){
                        print("NSLocationWhenInUseUsageDescription")
                        self.locationManager.requestWhenInUseAuthorization()
                        
                    }else{
                        print("Info.plist does not contain NSLocationAlwaysUsageDescription or NSLocationWhenInUseUsageDescription");
                    }
                }
                
            } else {
                
                print("ios8以下系统！")
                
            }
            
        }else{
            
            print("定位服务未开启！")
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }

}


extension LBMapLocationViewController{
    
    /**
     * @author Lufeng
     *
     *  导航
     */
    @objc func lbNavigationAction(){

        if let dic = self.showLocAry[0] as? NSDictionary{
            let tit = dic["name"] as! String
            let subTit = dic["description"] as! String
            let lat = dic["lat"] as! Double
            let lng = dic["lng"] as! Double
            
            let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lng)
            let currentLocation = MKMapItem.forCurrentLocation()
            let toLocation = MKMapItem.init(placemark: MKPlacemark.init(coordinate: coordinate, addressDictionary: nil))
            
            toLocation.name = tit + "-" + subTit
            let mapItems: [MKMapItem] = [currentLocation, toLocation]// 起点和终点
            let dic: [String : Any] = [// 导航设置字典
                MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving,// 导航模式
                MKLaunchOptionsMapTypeKey: MKMapType.standard.rawValue,// 地图样式
                MKLaunchOptionsShowsTrafficKey: true]// 显示交通
            MKMapItem.openMaps(with: mapItems, launchOptions: dic)
        }
            
    }
    
    /**
     * @author Lufeng
     *
     *  拨打救援电话
     */
    @objc func phoneAction(){
//        var phoneStr = "00"
//        if let pho = self.shopData["contactPhone"] as? String{
//            phoneStr = pho
//        }
//        UIApplication.shared.openURL(NSURL(string :"tel://"+"\(phoneStr)")! as URL)
    }
    
}

//MapView的代理

extension LBMapLocationViewController:MKMapViewDelegate {
    
    
    
    //地图的显示区域即将发生改变的时候调用
    
    func mapView(_ mapView:MKMapView, regionWillChangeAnimated animated:Bool) {
        
        print("当显示的区域即将改变时调用！")
        
    }
    
    
    
    //地图的显示区域已经发生改变的时候调用
    
    func mapView(_ mapView:MKMapView, regionDidChangeAnimated animated:Bool) {
        
        print("当显示的区域发生变化时调用！")
        
    }
    
    
    
    //地图控件即将开始加载地图数据
    
    func mapViewWillStartLoadingMap(_ mapView:MKMapView){
        
        print("地图控件开始加载地图数据")
        
    }
    
    
    
    //当MKMapView加载数据完成时激发该方法
    
    func mapViewDidFinishLoadingMap(_ mapView:MKMapView){
        
        print("当MKMapView加载数据完成时激发该方法")
        
    }
    
    
    
    //当MKMapView加载数据失败时激发该方法如：无网络
    
    func mapViewDidFailLoadingMap(_ mapView:MKMapView, withError error:Error){
        
        print("加载地图数据失败:\(error)")
        
    }
    
    
    
    //当MKMapView即将开始渲染地图时激发该方法
    
    func mapViewWillStartRenderingMap(_ mapView:MKMapView){
        
        print("MKMapView即将开始渲染地图时")
        
    }
    
    
    
    //当MKMapView渲染地图完成时激发该方法
    
    func mapViewDidFinishRenderingMap(_ mapView:MKMapView, fullyRendered:Bool){
        
        print("MKMapView渲染地图完成时")
        
    }
    
    
    
//    func mapView(_ mapView:MKMapView, viewFor annotation:MKAnnotation) -> MKAnnotationView?{
//         print("从缓存池中取出可以循环利用的大头针view.----------")
//        let identifier = "MKPinAnnotationView"
//
//        //从缓存池中取出可以循环利用的大头针view.
//
//        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
//
//
//
//        if  (annotationView == nil){
//
//            //MKAnnotationView：可以用指定的图片作为大头针的样式，但显示的时候没有动画效果，如果没有给图片的话会什么都不显示,使用MKAnnotationView子类MKPinAnnotationView创建系统样式大头针
//
//            annotationView =  MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//
//            //显示子标题和标题
//
//            annotationView!.canShowCallout = true
//
//            //设置大头针描述的偏移量
//
//            annotationView!.calloutOffset = CGPoint(x:0, y: -10)
//
//            //设置大头针描述左边的控件
////            let phoneBtn = UIButton(type: .custom)
////            phoneBtn.setImage(UIImage.init(named: "电话"), for: .normal)
////            phoneBtn.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
////            annotationView!.leftCalloutAccessoryView = phoneBtn
//        }
//
//        annotationView!.annotation = annotation
//
//        return annotationView
//
//    }
 
    
    
    //当大头针被添加到地图上时调用
    
    func mapView(_ mapView:MKMapView, didAdd views: [MKAnnotationView]){
        
        print("添加大头针！")
        
    }
    
    
    
    //当点击左边或者右边附属视图的时候方法被调用
    
    func mapView(_ mapView:MKMapView, annotationView view:MKAnnotationView, calloutAccessoryControlTapped control:UIControl){
        
        print("打电话。。。")

        
    }
    
    
    
    //点击选中大头针
    
    func mapView(_ mapView:MKMapView, didSelect view:MKAnnotationView){
        
//        print("didSelectAnnotationView---\(view.annotation?.title)")
//        if view.annotation?.title != "My Location"{
//            let phone="15974462468"
//            UIApplication.shared.openURL(NSURL(string :"tel://"+"\(phone)")! as URL)
//        }

        
    }
    
    
    
    //当大头针被反选，即取消选中的时候调用，可以通过该方法改变选中大头针视图的姿态
    
    func mapView(_ mapView:MKMapView, didDeselect view:MKAnnotationView){
        
        print("didDeselectAnnotationView")
        
    }
    
    
    
    //当showsUserLocation属性被设置为true，该方法会被调用，即将开始跟踪定位用户位置
    
    func mapViewWillStartLocatingUser(_ mapView:MKMapView){
        
        print("即将开始跟踪定位用户位置")
        
    }
    
    
    
    //当showsUserLocation属性被设置为false，该方法会被调用，停止跟踪用户的位置
    
    func mapViewDidStopLocatingUser(_ mapView:MKMapView){
        
        print("停止跟踪用户的位置")
        
    }
    
    
    
    //当用户位置发生变化时调用,调用非常频繁，不断监测用户的当前位置,每次调用，都会把用户的最新位置（userLocation参数）传进来。
    
    func mapView(_ mapView:MKMapView, didUpdate userLocation:MKUserLocation){
        
        print("didUpdateUserLocation!\(userLocation.coordinate)\(String(describing: userLocation.title))\(userLocation.subtitle)")
        
        //在用户定位成功之后，使大头针显示用户当前的位置。注意：建议使用真机查看效果，这里会随着位置改变多次调用。
        
        //addAnnotaionToMapView(coorinate2D: userLocation.coordinate)
    }
    
    
    
    //无法定位或者用户不允许定位时，即定位失败，触发代理方法
    
    func mapView(_ mapView:MKMapView, didFailToLocateUserWithError error:Error){
        
        print(error.localizedDescription)
        
    }
    
    
    
    //当拖动大头针的姿态改变的时候触发代理方法
    
    func mapView(_ mapView:MKMapView, annotationView view:MKAnnotationView, didChange newState:MKAnnotationViewDragState, fromOldState oldState:MKAnnotationViewDragState){
        
        print("didChangeDragStat")
        
    }
    
    
    
    //当用户的跟踪模式改变会触发代理方法
    
    private func mapView(mapView:MKMapView, didChangeUserTrackingMode mode:MKUserTrackingMode, animated:Bool){
        
        print("用户的跟踪模式改变")
        
    }
    
    
    
    //MARK:添加大头针
    
    func addAnnotaionToMapView(coorinate2D:CLLocationCoordinate2D){
        
        print("添加大头针----------")
        
        //创建MKPointAnnotation对象——代表一个大头针
        
        let pointAnnotation = MKPointAnnotation()
        
        //设置大头针的经纬度
        
        pointAnnotation.coordinate = coorinate2D
        
        pointAnnotation.title = "汽车服务店"
        
       // pointAnnotation.subtitle = "025-32473288"
        
        //添加大头针
        
        self.mapView.addAnnotation(pointAnnotation)
        
        //设置地图显示的范围，地图显示范围越小，细节越清楚

        let span = MKCoordinateSpan(latitudeDelta:0.125, longitudeDelta:0.125)

        //创建MKCoordinateRegion对象，该对象代表了地图的显示中心和显示范围。

        let region = MKCoordinateRegion(center: coorinate2D, span: span)

        //设置当前地图的显示中心和显示范围

        self.mapView.setRegion(region, animated:true)
        
    }
    

    
}



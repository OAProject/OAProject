//
//  QrCodeScanning.swift
//  ConsumerLoan
//
//  Created by Zhengkui Wang  on 16/6/30.
//  Copyright © 2016年 Sulei Qin. All rights reserved.
//

import UIKit
import AVFoundation



/*
 返回成功失败的代理方法，如果是成功，返回二维码信息，如果失败返回提示字符
 */
protocol QrCodeScanningDelegate {
    func qrCodeComplete(codeString: String?)
    func qrCodeError(errorString: String)
}

class QrCodeScanning: UIView,AVCaptureMetadataOutputObjectsDelegate {
    
    private let y1: CGFloat = 130.0
    private let x1: CGFloat = 30.0
    private let h1: CGFloat = 260.0
    private let w1: CGFloat = 260.0

    
    
    private var device: AVCaptureDevice?
    private var output: AVCaptureMetadataOutput?
    private var input: AVCaptureDeviceInput?
    private var session: AVCaptureSession?
    private var preview: AVCaptureVideoPreviewLayer?
    private var imageLine: UIImageView?
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    var delegate: QrCodeScanningDelegate?
    
    
    //停止扫描
    func stop() {
        if session == nil {
            return
        }
        if session!.isRunning {
           session!.stopRunning()
        }
        
    }
    
    //开始扫描
    func start() {
        if session == nil {
            return
        }
        if session!.isRunning == false {
            session?.startRunning()
            lineAnimation()
        }
        
    }
    
    //添加图片
    private func addImage()  {
        let imageView: UIImageView = UIImageView(frame: self.bounds)
        imageView.image = getImage()
        imageView.alpha = 0.7
        
        
        let imageBG = UIImageView(frame: CGRect(x: (UIScreen.main.bounds.size.width - w1)/2.0, y: y1, width: w1, height: h1))
        imageBG.image = UIImage(named: "pick_bg")
        self.addSubview(imageBG)
        imageLine = UIImageView(frame: CGRect(x: (UIScreen.main.bounds.size.width - w1)/2.0+5, y: y1+10, width: w1-10, height: 10))
        
        
        imageLine!.contentMode = .scaleAspectFit
        imageLine!.image = UIImage(named: "line")
        self.addSubview(imageLine!)
        //动画递归
        
        lineAnimation()
  
        self.addSubview(imageView)
    }
    private func lineAnimation()  {

        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(2)
        UIView.setAnimationRepeatCount(10000000)
        var rect = self.imageLine!.frame
        rect.origin.y =  self.y1 - 20.0 + self.h1
        self.imageLine!.frame = rect
        UIView.commitAnimations()
        
    }
    //生成灰色中间透明的背景图
    private func getImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 1.0)
        let con: CGContext = UIGraphicsGetCurrentContext()!
        con.setFillColor(UIColor.black.cgColor)
        
        con.fill(self.bounds)
       // CGRectMake(, , )
        con.addRect(CGRect(x: (UIScreen.main.bounds.size.width - w1)/2.0, y: y1, width: w1, height: h1) )
        con.setBlendMode(.clear)
        con.setStrokeColor(UIColor.white.cgColor)
        con.fillPath()
        let ima: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return ima
        
        
    }
    override func draw(_ rect: CGRect) {
        // Drawing code
        //二维码扫描
        initUiConfig(rect: rect)
        
    }

   private func initUiConfig(rect: CGRect) {
        self.clipsToBounds = true
    initUI(rect: rect)
    }
    
    
    /*
     
     
     //二维码扫描
     
     */
    private func initUI(rect: CGRect)  {
        
        let authStatus: AVAuthorizationStatus = AVCaptureDevice .authorizationStatus(for: AVMediaType.video);
        if (authStatus == .restricted || authStatus == .denied)
        {
            
            print("没有权限")
            delegate?.qrCodeError(errorString: "没有权限")
            return
            
            
        }
        do {
            device = AVCaptureDevice.default(for: AVMediaType.video)
            try input = AVCaptureDeviceInput(device: device!)
            
        }
        catch
        {
            print("没有权限")
            delegate?.qrCodeError(errorString: "没有权限")
            return
            
        }
        captureDeviceOK(previewFrame: rect)
        addImage()
    }
    private func captureDeviceOK(previewFrame: CGRect) {
        output = AVCaptureMetadataOutput()
        let y = 130.0/UIScreen.main.bounds.height
        let x = 30.0/UIScreen.main.bounds.width
        let h = 260.0/UIScreen.main.bounds.height
        let w = 260.0/UIScreen.main.bounds.width
        output!.rectOfInterest = CGRect(x: y, y: x, width: h, height: w)//设置扫描区范围dispatch_get_main_queue()
        output!.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        session = AVCaptureSession()
        if session!.canAddInput(input!) {
            session!.addInput(input!)
        }
        if session!.canAddOutput(output!) {
            session!.addOutput(output!)
        }
        output!.metadataObjectTypes = [AVMetadataObject.ObjectType.ean13, AVMetadataObject.ObjectType.ean8, AVMetadataObject.ObjectType.code128, AVMetadataObject.ObjectType.qr]
        preview = AVCaptureVideoPreviewLayer(session:session!)
        preview!.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        preview!.frame = previewFrame;
        

        
        self.layer.addSublayer(preview!)
        if UIScreen.main.bounds.size.height == 480 {
            session!.sessionPreset = AVCaptureSession.Preset.vga640x480
        }
        else
        {
            session!.sessionPreset = AVCaptureSession.Preset.high
        }
        session?.startRunning()
    }
     func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!)
     {
        var val: String? = nil
        if metadataObjects.count < 1 {
            print("停止")
            
            return
            
        }
        let obj : AVMetadataMachineReadableCodeObject = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        val = obj.stringValue
        //成功返回二维码信息
        print(val)
        
        /*
         添加声音 -- 扫描成功的声音
         */
        
        
        delegate?.qrCodeComplete(codeString: val)
     }
    
    
    /*
     ***********************  二维码识别  ***********************
 
     
     */
    
    
    func scanningForImage(image: UIImage!)
    {
        let detector: CIDetector = CIDetector(ofType: CIDetectorTypeQRCode, context: nil, options:[CIDetectorAccuracy : CIDetectorAccuracyHigh])!
        var stringResult: String = ""
        //监测到的结果数组CIImage(CGImage: image.CGImage!)
        let metadataObject = detector.features(in: CIImage(cgImage: image.cgImage!))
        if metadataObject.count >= 1 {
            let feature: CIQRCodeFeature = metadataObject[0] as! CIQRCodeFeature
            stringResult = String(describing: feature.messageString)
            //成功返回二维码信息
            print(stringResult)
            
            delegate?.qrCodeComplete(codeString: stringResult)
            
        }
        else
        {
            print("扫描失败")
            delegate?.qrCodeError(errorString: "没有二维码")
        }
    }

}





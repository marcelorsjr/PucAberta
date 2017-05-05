//
//  QrCodeViewController.swift
//  Puc Aberta
//
//  Created by Marco Braga on 04/05/17.
//  Copyright © 2017 Marcelo Rodrigues dos Santos Junior. All rights reserved.
//

import UIKit
import AVFoundation

class QrCodeViewController: UIViewController {
    
    // MARK: - Members
    
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var qrCodeFrameView:UIView?
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
    }
    
    // MARK: Private
    
    func initialize() {
        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            captureSession = AVCaptureSession()
            captureSession?.addInput(input)
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession?.addOutput(captureMetadataOutput)
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
            videoPreviewLayer?.frame = view.layer.bounds
            view.layer.addSublayer(videoPreviewLayer!)
            captureSession?.startRunning()
            qrCodeFrameView = UIView()
            
            if let qrCodeFrameView = qrCodeFrameView {
                qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
                qrCodeFrameView.layer.borderWidth = 2
                view.addSubview(qrCodeFrameView)
                view.bringSubview(toFront: qrCodeFrameView)
            }
        } catch {
            let alert = UIAlertController(title: title,
                                          message: error as? String,
                                          preferredStyle: UIAlertControllerStyle.alert)
            
            let cancelAction = UIAlertAction(title: "OK",
                                             style: .cancel, handler: nil)
            
            alert.addAction(cancelAction)
            self.present(alert, animated:true)
            return
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension QrCodeViewController: AVCaptureMetadataOutputObjectsDelegate {
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        if metadataObjects == nil || metadataObjects.count == 0 {
            qrCodeFrameView?.frame = CGRect.zero
            return
        }
        
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if metadataObj.type == AVMetadataObjectTypeQRCode {
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrCodeFrameView?.frame = barCodeObject!.bounds
            
            if metadataObj.stringValue != nil {

                var mensagem = ""
                let defaults = UserDefaults.standard
                switch metadataObj.stringValue {
                case "grupo_a":
                    mensagem = "Grupo A Liberado"
                    defaults.set(true, forKey: metadataObj.stringValue)
                break
                    
                case "grupo_b":
                    mensagem = "Grupo B Liberado"
                    defaults.set(true, forKey: metadataObj.stringValue)
                break
                    
                case "grupo_c":
                    mensagem = "Grupo C Liberado"
                    defaults.set(true, forKey: metadataObj.stringValue)
                break
                    
                case "grupo_d":
                    mensagem = "Grupo D Liberado"
                    defaults.set(true, forKey: metadataObj.stringValue)
                break
                    
                case "grupo_e":
                    mensagem = "Grupo E Liberado"
                    defaults.set(true, forKey: metadataObj.stringValue)
                break
                    
                case "grupo_f":
                    mensagem = "Grupo F Liberado"
                    defaults.set(true, forKey: metadataObj.stringValue)
                break
                    
                case "grupo_g":
                    mensagem = "Grupo G Liberado"
                    defaults.set(true, forKey: metadataObj.stringValue)
                break
                    
                case "grupo_h":
                    mensagem = "Grupo H Liberado"
                    defaults.set(true, forKey: metadataObj.stringValue)
                break
                    
                case "grupo_i":
                    mensagem = "Grupo I Liberado"
                    defaults.set(true, forKey: metadataObj.stringValue)
                break
                    
                case "grupo_j":
                    mensagem = "Grupo J Liberado"
                    defaults.set(true, forKey: metadataObj.stringValue)
                break
                    
                default:
                    mensagem = "Nenhum grupo encontrado"
                }
                
                let alert = UIAlertController(title: title,
                                              message:mensagem,
                                              preferredStyle: UIAlertControllerStyle.alert)
                
                let cancelAction = UIAlertAction(title: "OK",
                                                 style: .cancel, handler: nil)
                
                alert.addAction(cancelAction)
                self.present(alert, animated:true)
            }
        }
    }
}

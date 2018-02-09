//
//  AppDelegate.swift
//  Commandline
//
//  Created by Nana Kumi on 9/8/15.
//  Copyright (c) 2015 Nana Kumi. All rights reserved.
//

import Cocoa
import Foundation

@NSApplicationMain



class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var ipAddressField: NSTextField!
    
    
    
    func shell(launchPath: String, arguments: [String]) -> String
    {
        let task = NSTask()
        task.launchPath = launchPath
        task.arguments = arguments
        
        let pipe = NSPipe()
        task.standardOutput = pipe
        task.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output: String = NSString(data: data, encoding: NSUTF8StringEncoding)! as String
        
        return output
    }
    
    
    @IBAction func goButton(sender: NSButton) {
        
        
        let ipAddress = "lpd://\(ipAddressField.stringValue)"
    
       shell("/usr/sbin/lpadmin", arguments: ["-p", "LanierMPC4503A", "-E", "-v", ipAddress, "-P", "/Library/Printers/PPDs/Contents/Resources/LANIER MP C4503", "-D", "IA-391COPIER"])
        
    }
    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application

        
        
        
        
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}


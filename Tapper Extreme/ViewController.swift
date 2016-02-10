//
//  ViewController.swift
//  Tapper Extreme
//
//  Created by Christopher Reynolds on 2/10/16.
//  Copyright © 2016 Smooth Black 6. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Properties
    var maxTaps: Int = 0
    var currentTaps: Int = 0

    // Outlets
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var coinTapBtn: UIButton!
    @IBOutlet weak var tapsLbl: UILabel!
    
    @IBAction func onPlayBtnPressed(sender: UIButton!){
        if howManyTapsTxt.text != nil && howManyTapsTxt.text != "" {
            showHideGameStart()
            showHideCoinTapper()
        
            maxTaps = Int( howManyTapsTxt.text! )!
            currentTaps = 0
            
            updateTapsLbl()
        }
    }
    
    @IBAction func onCoinBtnPressed(sender: UIButton!){
        currentTaps++
        updateTapsLbl()
        if isGameOver() {
            howManyTapsTxt.text = ""
            maxTaps = 0
            showHideGameStart()
            showHideCoinTapper()
        }
    }
    
    func updateTapsLbl(){
        tapsLbl.text = "\(currentTaps) Taps"
    }
    
    func showHideGameStart() {
        if logoImg.hidden {
            logoImg.hidden = false
            howManyTapsTxt.hidden = false
            playBtn.hidden = false
        } else {
            logoImg.hidden = true
            howManyTapsTxt.hidden = true
            playBtn.hidden = true
        }
    }
    
    func showHideCoinTapper() {
        if coinTapBtn.hidden {
            coinTapBtn.hidden = false
            tapsLbl.hidden = false
        } else {
            coinTapBtn.hidden = true
            tapsLbl.hidden = true
        }
    }
    
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps {
            return true
        } else {
            return false
        }
    }

}


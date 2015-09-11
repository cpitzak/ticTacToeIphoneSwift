//
//  ViewController.swift
//  tictactoe
//
//  Created by Pitzak, Clint J on 9/10/15.
//  Copyright (c) 2015 Pitzak, Clint J. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var resetBtn: UIButton!
    
    var isPlayerOneTurn = true;
    var isGameOver = false;
    var X_IMAGE = UIImage(named: "x")
    var O_IMAGE = UIImage(named: "o")
    
    var board = Array(count: 3, repeatedValue: Array(count: 3, repeatedValue: ""))
    
    @IBAction func btn(sender: UIButton) {
        if !isGameOver && isSpotAvailable(sender) {
            var piece = X_IMAGE
            var pieceString = "x"
            if !isPlayerOneTurn {
                piece = O_IMAGE
                pieceString = "o"
            }
            // 1  2  3
            // 4  5  6
            // 7  8  9
            if sender == btn1 {
                btn1.setImage(piece, forState: UIControlState.Normal)
                board[0][0] = pieceString
            } else if sender == btn2 {
                btn2.setImage(piece, forState: UIControlState.Normal)
                board[0][1] = pieceString
            } else if sender == btn3 {
                btn3.setImage(piece, forState: UIControlState.Normal)
                board[0][2] = pieceString
            } else if sender == btn4 {
                btn4.setImage(piece, forState: UIControlState.Normal)
                board[1][0] = pieceString
            } else if sender == btn5 {
                btn5.setImage(piece, forState: UIControlState.Normal)
                board[1][1] = pieceString
            } else if sender == btn6 {
                btn6.setImage(piece, forState: UIControlState.Normal)
                board[1][2] = pieceString
            } else if sender == btn7 {
                btn7.setImage(piece, forState: UIControlState.Normal)
                board[2][0] = pieceString
            } else if sender == btn8 {
                btn8.setImage(piece, forState: UIControlState.Normal)
                board[2][1] = pieceString
            } else if sender == btn9 {
                btn9.setImage(piece, forState: UIControlState.Normal)
                board[2][2] = pieceString
            }
            if isWin() {
                statusLabel.hidden = false
                if isPlayerOneTurn {
                    statusLabel.text = "X wins!"
                } else {
                    statusLabel.text = "O wins!"
                }
                isGameOver = true
                resetBtn.hidden = false
            } else if isDraw() {
                statusLabel.hidden = false
                statusLabel.text = "Game is Drawn!"
                isGameOver = true
                resetBtn.hidden = false
            }
            isPlayerOneTurn = !isPlayerOneTurn
        }
    }
    
    func isWin() ->Bool {
        var didWin = false
        
        if board[0][0] != "" && board[0][0] == board[0][2] && board[0][0] == board[0][1] { // horizontal start
            didWin = true
        } else if board[1][0] != "" && board[1][0] == board[1][2] && board[1][0] == board[1][1] {
            didWin = true
        } else if board[2][0] != "" && board[2][0] == board[2][2] && board[2][0] == board[2][1] {
            didWin = true
        } else if board[0][0] != "" && board[0][0] == board[1][0] && board[0][0] == board[2][0] { // verticle start
            didWin = true
        } else if board[0][1] != "" && board[0][1] == board[1][1] && board[0][1] == board[2][1] {
            didWin = true
        } else if board[0][2] != "" && board[0][2] == board[1][2] && board[0][2] == board[2][2] {
            didWin = true
        } else if board[0][0] != "" && board[0][0] == board[1][1] && board[0][0] == board[2][2] { // diagonal start
            didWin = true
        } else if board[0][2] != "" && board[0][2] == board[1][1] && board[0][2] == board[2][0] {
            didWin = true
        }
        
        return didWin
    }
    
    func isDraw() ->Bool {
        var isAvailableSpot = false
        for (var row = 0; row < board.count; row++) {
            for (var col = 0; col < board[0].count; col++) {
                if (board[row][col] == "") {
                    isAvailableSpot = true;
                    break;
                }
            }
        }
        return !isWin() && !isAvailableSpot
    }
    
    @IBAction func reset(sender: UIButton) {
        isGameOver = false
        isPlayerOneTurn = true;
        board = Array(count: 3, repeatedValue: Array(count: 3, repeatedValue: ""))
        btn1.setImage(nil, forState: UIControlState.Normal)
        btn2.setImage(nil, forState: UIControlState.Normal)
        btn3.setImage(nil, forState: UIControlState.Normal)
        btn4.setImage(nil, forState: UIControlState.Normal)
        btn5.setImage(nil, forState: UIControlState.Normal)
        btn6.setImage(nil, forState: UIControlState.Normal)
        btn7.setImage(nil, forState: UIControlState.Normal)
        btn8.setImage(nil, forState: UIControlState.Normal)
        btn9.setImage(nil, forState: UIControlState.Normal)
        resetBtn.hidden = true
        statusLabel.hidden = true
        statusLabel.text = ""
    }
    
    func isSpotAvailable(sender: UIButton) ->Bool {
        var isAvailable = false
        if sender == btn1 && board[0][0] == "" {
            isAvailable = true
        } else if sender == btn2 && board[0][1] == "" {
            isAvailable = true
        } else if sender == btn3 && board[0][2] == "" {
            isAvailable = true
        } else if sender == btn4 && board[1][0] == "" {
            isAvailable = true
        } else if sender == btn5 && board[1][1] == "" {
            isAvailable = true
        } else if sender == btn6 && board[1][2] == "" {
            isAvailable = true
        } else if sender == btn7 && board[2][0] == "" {
            isAvailable = true
        } else if sender == btn8 && board[2][1] == "" {
            isAvailable = true
        } else if sender == btn9 && board[2][2] == "" {
            isAvailable = true
        }
        return isAvailable
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


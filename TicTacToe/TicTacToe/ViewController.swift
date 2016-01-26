//
//  ViewController.swift
//  TicTacToe
//
//  Created by Laura Barton on 1/25/16.
//  Copyright © 2016 Laura Barton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var playerTurnLabel: UILabel!

    @IBOutlet var topLeftLabel: UILabel!
    @IBOutlet var topLabel: UILabel!
    @IBOutlet var topRightLabel: UILabel!
    @IBOutlet var leftLabel: UILabel!
    @IBOutlet var centerLabel: UILabel!
    @IBOutlet var rightLabel: UILabel!
    @IBOutlet var bottomLeftLabel: UILabel!
    @IBOutlet var bottomLabel: UILabel!
    @IBOutlet var bottomRightLabel: UILabel!
    
    var board : [[Int]] = [[0, 0, 0],[0, 0, 0],[0, 0, 0]]; // 3x3 array of 1s and 2s
    var players : [String] = ["X", "O"];
    var currentPlayer : Int = 1; // either 1 or 2
    var squares : [[UILabel!]] = [[]];
    var isGameOver : Bool = false;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        squares = [[topLeftLabel, topLabel, topRightLabel], [leftLabel, centerLabel, rightLabel], [bottomLeftLabel, bottomLabel, bottomRightLabel]];
        
        startNewGame(NSNull);
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if(isGameOver) {
            return;
        }
        
        // get the point of the first touch
        let touch : UITouch = touches.first!;
        let touchPoint : CGPoint = touch.locationInView(self.view);
        
        var row : Int = 0;
        var column : Int = 0;
        for labelArray in squares {
            column = 0;
            for label in labelArray {
                if(label.frame.contains(touchPoint)) {
                    self.markBoxForPlayer(row, column: column);
                }
                column = column + 1;
            }
            row = row + 1;
        }
    }
    
    func markBoxForPlayer(row : Int, column:Int) {
        squares[row][column].text = players[currentPlayer-1];
        board[row][column] = currentPlayer;
        
        if(didPlayerWin()) {
            playerTurnLabel.text = "Player \(currentPlayer) wins!";
            isGameOver = true;
        }
        else if(isBoardFull()) {
            playerTurnLabel.text = "It's a tie!";
            isGameOver = true;
        }
        else {
            // player 1 % 2 = 1 + 1 => 2
            currentPlayer = (currentPlayer % 2) + 1;
            playerTurnLabel.text = "Player \(currentPlayer)'s Turn";
        }
    }
    
    func didPlayerWin() -> Bool {
        var isOver : Bool = false;
        
        for count in 0...2 {
            // Same row (across)
            if(board[count][0] != 0 &&
                board[count][0] == board[count][1] &&
                board[count][1] == board[count][2]) {
                    isOver = true;
            }
            // Same column (down)
            else if(board[0][count] != 0 &&
                board[0][count] == board[1][count] &&
                board[1][count] == board[2][count]) {
                    isOver = true;
            }
        }
        
        // Diagonals
        if(board[0][0] != 0 &&
            board[0][0] == board[1][1] &&
            board[1][1] == board[2][2]) {
                isOver = true;
        }
        else if(board[2][0] != 0 &&
            board[2][0] == board[1][1] &&
            board[1][1] == board[0][2]) {
                isOver = true;
        }
        
        return isOver;
    }
    
    func isBoardFull() -> Bool {
        var isFull : Bool = true;
        
        for i in 0...2 {
            for j in 0...2 {
                if(board[i][j] == 0) {
                    isFull = false;
                    break;
                }
            }
            
            if(!isFull) {
                break;
            }
        }
        
        return isFull;
    }

    @IBAction func startNewGame(sender: AnyObject?) {
        isGameOver = false;
        currentPlayer = 1;
        playerTurnLabel.text = "Player \(currentPlayer)'s Turn"
        
        for row in 0...2 {
            for column in 0...2 {
                board[row][column] = 0;
                squares[row][column].text = "";
            }
        }
    }
}


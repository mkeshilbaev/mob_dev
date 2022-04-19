//
//  ViewController.swift
//  Pomodoro
//
//  Created by Madi Keshilbayev on 11.04.2022.
//

import UIKit

class ViewController: UIViewController, CAAnimationDelegate {
    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var cancelButton: UIButton!
    
    let foreProgressLayer = CAShapeLayer()
    let backProgressLayer = CAShapeLayer()
    let animation = CABasicAnimation(keyPath: "strokeEnd")
    
    var timer = Timer()
    var isTimerStarted = false
    var isBreakStarted = false
    var isAnimationStarted = false
    var time = 10
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawBackLayer()
    }

    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        cancelButton.isEnabled = true
        cancelButton.alpha = 1.0
        
        if !isTimerStarted {
            drawForeLayer()
            startResumeAnimation()
            
            startTimer()
            isTimerStarted = true
             
            startButton.setTitle("Pause", for: .normal)
            startButton.setTitleColor(UIColor.orange, for: .normal)
        }
        else {
            pauseAnimation()
            
            timer.invalidate()
            isTimerStarted = false
            
            startButton.setTitle("Resume", for: .normal)
            startButton.setTitleColor(UIColor.green, for: .normal)
        }
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        stopAnimation()
        
        cancelButton.isEnabled = true
        cancelButton.alpha = 0.5
        
        startButton.setTitle("Start", for: .normal )
        startButton.setTitleColor(UIColor.green, for: .normal )
        
        timer.invalidate()
        time = 10
        isTimerStarted = false
        timeLabel.text = "00:10"
    }
    
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if time < 1 {
//            cancelButton.isEnabled = false
//            cancelButton.alpha = 0.5

//            startButton.setTitle("Start", for: .normal)
//            startButton.setTitleColor(UIColor.green, for: .normal)

//            timer.invalidate()
            isTimerStarted = false
            
            
            timeLabel.text = "00:05"
            time = 5
            isBreakStarted = true
        }
        else {
            time -= 1
            timeLabel.text = formatTime()
        }
    }
    
    func formatTime() -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    
    
    
    
    
    
    func drawBackLayer() {
        backProgressLayer.path = UIBezierPath(arcCenter: CGPoint(x : view.frame.midX, y : view.frame.midY), radius: 100, startAngle: -90.degreesToRadians, endAngle: 270.degreesToRadians, clockwise: true).cgPath
        backProgressLayer.strokeColor = UIColor.white.cgColor
        backProgressLayer.fillColor = UIColor.clear.cgColor
        backProgressLayer.lineWidth = 30
        view.layer.addSublayer(backProgressLayer)
    }
    
    func drawForeLayer() {
        foreProgressLayer.path = UIBezierPath(arcCenter: CGPoint(x : view.frame.midX, y : view.frame.midY), radius: 100, startAngle: -90.degreesToRadians, endAngle: 270.degreesToRadians, clockwise: true).cgPath
        foreProgressLayer.strokeColor = UIColor.orange.cgColor
        foreProgressLayer.fillColor = UIColor.clear.cgColor
        foreProgressLayer.lineWidth = 30
        view.layer.addSublayer(foreProgressLayer)
    }
    
    func startResumeAnimation(){
        if !isAnimationStarted {
            startAnimation()
        }
        else{
            resumeAnimation()
        }
    }
    
    func startAnimation(){
        resetAnimation()
        foreProgressLayer.strokeEnd = 0.0
        animation.keyPath = "strokeEnd"
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 10
        animation.delegate = self
        animation.isRemovedOnCompletion = false
        animation.isAdditive = true
        animation.fillMode = CAMediaTimingFillMode.forwards
        foreProgressLayer.add(animation, forKey: "strokeEnd")
        isAnimationStarted = true
    }
    
    func resetAnimation(){
        foreProgressLayer.speed = 1.0
        foreProgressLayer.timeOffset = 0.0
        foreProgressLayer.beginTime = 0.0
        foreProgressLayer.strokeEnd = 0.0
        isAnimationStarted = false
    }
    
    func pauseAnimation(){
        let pausedTime = foreProgressLayer.convertTime(CACurrentMediaTime(), from: nil)
        foreProgressLayer.speed = 0.0
        foreProgressLayer.timeOffset = pausedTime
    }
    
    func resumeAnimation(){
        let pausedTime = foreProgressLayer.timeOffset
        foreProgressLayer.speed = 1.0
        foreProgressLayer.timeOffset = 0.0
        foreProgressLayer.beginTime = 0.0
        let timeSincePaused = foreProgressLayer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        foreProgressLayer.beginTime = timeSincePaused
    }
    
    func stopAnimation(){
        foreProgressLayer.speed = 1.0
        foreProgressLayer.timeOffset = 0.0
        foreProgressLayer.beginTime = 0.0
        foreProgressLayer.strokeEnd = 0.0
        foreProgressLayer.removeAllAnimations()
        isAnimationStarted = false
    }
    
    internal func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        stopAnimation()
    }
    
}



extension Int{
    var degreesToRadians: CGFloat{
        return CGFloat(self) * .pi / 180
    }
}


/// Copyright (c) 2018 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var basketTop: UIImageView!
  @IBOutlet weak var basketBottom: UIImageView!
  
  @IBOutlet weak var fabricTop: UIImageView!
  @IBOutlet weak var fabricBottom: UIImageView!
  
  @IBOutlet weak var basketTopConstraint : NSLayoutConstraint!
  @IBOutlet weak var basketBottomConstraint : NSLayoutConstraint!
  
  @IBOutlet weak var bug: UIImageView!
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    self.openBasket()
    self.openNapkins()
    self.moveBufLeft()
  }
  
  func openBasket() {
    self.basketTopConstraint.constant -= basketTop.frame.size.height
    self.basketBottomConstraint.constant -= basketBottom.frame.size.height
    
    UIView.animate(withDuration: 0.7, delay: 1.0, options: .curveEaseOut, animations: {
      self.view.layoutIfNeeded()
    }) { (finished) in
      print("Basket doors opened!")
    }
  }
  
  func openNapkins() {
    
    UIView.animate(withDuration: 1.0, delay: 1.2, options: .curveEaseOut, animations: {
        var fabricTopFrame = self.fabricTop.frame
      fabricTopFrame.origin.y -= fabricTopFrame.size.height
      var fabricBottomFrame = self.fabricBottom.frame
      fabricBottomFrame.origin.y += fabricBottomFrame.size.height
      
      self.fabricTop.frame = fabricTopFrame
      self.fabricBottom.frame = fabricBottomFrame
    }) { (finished) in
      print("Napkins opened!")
    }
    
  }
  
  func moveBufLeft() {
    UIView.animate(withDuration: 1.0, delay: 2.0, options: [.curveEaseInOut, .allowUserInteraction], animations: {
      self.bug.center = CGPoint(x: 75, y: 200)
    }) { (finished) in
      print("Bug moved left!")
      self.faceBugRight()
    }
  }
  
  func faceBugRight() {
    UIView.animate(withDuration: 1.0, delay: 0.0, options: [.curveEaseInOut, .allowUserInteraction], animations: {
      self.bug.transform = CGAffineTransform(rotationAngle: .pi)
    }) { (finished) in
      print("Bug faced right!")
      self.moveBugRight()
    }
  }
  
  func moveBugRight() {
    UIView.animate(withDuration: 1.0, delay: 2.0, options: [.curveEaseInOut, .allowUserInteraction], animations: {
      
      self.bug.center = CGPoint(x: -75, y: 200)
    }) { (finshed) in
      print("Bug moved right!")
      self.faceBugLeft()
    }
  }
  
  func faceBugLeft() {
    UIView.animate(withDuration: 1.0, delay: 0.0, options: [.curveEaseInOut, .allowUserInteraction], animations: {
      self.bug.transform = CGAffineTransform(rotationAngle: 0.0)
    }) { (finished) in
      print("Bug faced left!")
    }
  }
}

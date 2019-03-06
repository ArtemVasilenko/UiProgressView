import UIKit

class ViewController: UIViewController {
    
    var myProgressView = UIProgressView()
    var myButton = UIButton()
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(createButton(myButton))
        self.view.addSubview(createProgressView(myProgressView))
        createTimer()
    }
    
    func createButton(_ button: UIButton) -> UIButton {
        button.frame = CGRect(x: self.view.bounds.size.width/4, y: self.view.center.y + 100, width: 150, height: 100)
        button.alpha = 0.2
        button.setTitle("Load", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        button.addTarget(self, action: #selector (tapButton), for: .touchDown)
        return button
    }
    
    @objc func tapButton() {
        myProgressView.progress = 0.0
        self.myButton.alpha = 0.2
        self.myButton.setTitle("Load", for: .normal)
        createTimer()
        
    }
    
    func createProgressView(_ pv: UIProgressView) -> UIProgressView {
        pv.progressViewStyle = .bar
        pv.frame = CGRect(x: self.view.center.x, y: self.view.center.y, width: 150, height: 50)
        pv.setProgress(0.0, animated: false)
        pv.progressTintColor = .green
        pv.trackTintColor = .gray
        pv.center = self.view.center
        return pv
    }
    
    func createTimer() {
        myTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateProgressView), userInfo: nil, repeats: true)
    }
    
    @objc func updateProgressView() {
        if myProgressView.progress != 1.0 {
            myProgressView.progress += 0.01
        } else {
            UIView.animate(withDuration: 0.7, animations: {
                self.myButton.alpha = 1
                self.myButton.setTitle("Start", for: .normal)
                self.myTimer.invalidate()
            })
        }
    }
}


import UIKit

class BadViewController: UIViewController {

    var textView: UILabel!
    var btnClick: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView = UILabel(frame: CGRect(x: 50, y: 100, width: 200, height: 50))
        textView.text = "Initial Text"
        view.addSubview(textView)
        
        btnClick = UIButton(type: .system)
        btnClick.frame = CGRect(x: 50, y: 200, width: 100, height: 50)
        btnClick.setTitle("Click Me", for: .normal)
        view.addSubview(btnClick)
        
        btnClick.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
    }
    
    @objc func clickButton() {
        let message = getMessage()
        textView.text = message
    }
    
    func getMessage() -> String {
        var message = "Hello, "
        message.append(getName())
        return message
    }
    
    func getName() -> String {
        let textFieldName = UITextField(frame: CGRect(x: 50, y: 300, width: 200, height: 30))
        return textFieldName.text ?? ""
    }
}